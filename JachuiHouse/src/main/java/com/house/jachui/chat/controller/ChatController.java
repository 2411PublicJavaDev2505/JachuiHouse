package com.house.jachui.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.service.ChatRoomService;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.trade.model.service.TradeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {

    private final ChatRoomService chatRoomService;
    private final ChatService chatService;
    private final MemberService memberService;
    private final EstateService eService;
    private final TradeService tService;

    @GetMapping("/torealtor")
    public String showEtoBChat(Model model,
                               @RequestParam("estateNo") int estateNo,
                               HttpSession session) {
        try {
            String writerId = (String) session.getAttribute("userId"); // 현재 로그인한 사람
            String receiverId = eService.selectIdByEstateNo(estateNo); // 매물 번호로 중개사 ID 조회
            return "redirect:/chat/chat?writerId=" + writerId + "&receiverId=" + receiverId;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
            return "common/error";
        }
    }

    // 중고 거래의 채팅방 열기
    @GetMapping("/totrade")
    public String showTtoTChat(Model model,
                               @RequestParam("tradeNo") int tradeNo,
                               HttpSession session) {
        try {
            String writerId = (String) session.getAttribute("userId"); // 현재 로그인한 사람
            String receiverId = tService.selectIdByTradeNo(tradeNo); // 상품 번호로 판매자 ID 조회
            return "redirect:/chat/chat?writerId=" + writerId + "&receiverId=" + receiverId;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
            return "common/error";
        }
    }
    
    
    // 채팅방 입장
    @GetMapping("/room")
    public String showChatRoom(Model model,
                               @RequestParam("writerId") String writerId,
                               @RequestParam("receiverId") String receiverId) {
        // 채팅방 조회
        Map<String, String> map = new HashMap<>();
        map.put("writerId", writerId);
        map.put("receiverId", receiverId);

        Integer roomNo = chatRoomService.findChatRoom(map);

        if (roomNo == null) {
            // 채팅방이 없다면 새로 생성
            roomNo = chatRoomService.createChatRoom(map);
        }

        // 채팅방의 메시지 목록 조회
        List<Chat> chatList = chatService.getMessagesByRoom(roomNo);

        // 수신자 정보 조회
        Member receiver = memberService.selectMemberById(receiverId);
        
        // 모델에 채팅방 및 메시지 정보 설정
        model.addAttribute("roomNo", roomNo);
        model.addAttribute("chatList", chatList);
        model.addAttribute("writerId", writerId);
        model.addAttribute("receiverId", receiverId);
        model.addAttribute("receiverName", receiver.getUserName());

        return "chat/main";
    }

    // 메시지 전송 처리
    @PostMapping("/send")
    @ResponseBody
    public Map<String, Object> sendChatMessage(@ModelAttribute SendRequest sendRequest) {
        Map<String, Object> response = new HashMap<>();
        
        int result = chatService.sendChatMessage(sendRequest);
        if (result > 0) {
            response.put("status", "success");
        } else {
            response.put("status", "error");
            response.put("message", "메시지 전송 실패");
        }
        return response;
    }

    // 사용자별 채팅방 목록 조회
    @GetMapping("/list")
    public String showChatRoomList(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        
        // 사용자에 해당하는 채팅방 목록 조회
//        List<Chat> chatRoomList = chatRoomService.getChatRoomsByUserId(userId);
        
//        model.addAttribute("chatRoomList", chatRoomList);
        return "chat/list";

    }
    // 새로운 메시지 fetch
    @GetMapping("/fetch")
    @ResponseBody
    public List<Chat> fetchNewMessages(@RequestParam("writerId") String writerId,
                                       @RequestParam("receiverId") String receiverId,
                                       @RequestParam("lastChatNo") Integer lastChatNo) {
        Map<String, Object> map = new HashMap<>();
        map.put("writerId", writerId);
        map.put("receiverId", receiverId);
        map.put("lastChatNo", lastChatNo);
        
        return chatService.fetchNewMessages(map);
    }
}
