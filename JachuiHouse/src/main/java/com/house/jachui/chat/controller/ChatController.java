package com.house.jachui.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.service.ChatRoomService;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.trade.model.service.TradeService;
import com.house.jachui.trade.model.vo.Trade;

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
    public String showEstateChat(Model model,
                                @RequestParam("estateNo") int estateNo,
                                HttpSession session) {
        try {
            String user1Id = (String) session.getAttribute("userId");
            if (user1Id == null) {
                model.addAttribute("errorMessage", "로그인이 필요합니다.");
                return "common/error";
            }
            String user2Id = eService.selectIdByEstateNo(estateNo);
            if (user2Id == null) {
                model.addAttribute("errorMessage", "중개사 정보를 찾을 수 없습니다.");
                return "common/error";
            }

            int chatRoomNo = chatRoomService.createEstateChatRoom(user1Id, user2Id, estateNo);
            System.out.println("Created/Found chatRoomNo for estateNo=" + estateNo + ": " + chatRoomNo);

            Estate estate = eService.selectOneByNo(estateNo);
            if (estate == null) {
                model.addAttribute("errorMessage", "매물 정보를 찾을 수 없습니다.");
                return "common/error";
            }

            String redirectUrl = "redirect:/chat/room?chatRoomNo=" + chatRoomNo + "&itemname=estate&itemNo=" + estateNo + "&user1Id=" + user1Id + "&user2Id=" + user2Id;
            System.out.println("Redirecting to: " + redirectUrl);
            return redirectUrl;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "오류가 발생했습니다: " + (e.getMessage() != null ? e.getMessage() : "알 수 없는 오류"));
            return "common/error";
        }
    }

    @GetMapping("/totrade")
    public String showTradeChat(Model model,
                               @RequestParam("tradeNo") int tradeNo,
                               HttpSession session) {
        try {
            String user1Id = (String) session.getAttribute("userId");
            if (user1Id == null) {
                model.addAttribute("errorMessage", "로그인이 필요합니다.");
                return "common/error";
            }
            String user2Id = tService.selectIdByTradeNo(tradeNo);
            if (user2Id == null) {
                model.addAttribute("errorMessage", "판매자 정보를 찾을 수 없습니다.");
                return "common/error";
            }

            int chatRoomNo = chatRoomService.createTradeChatRoom(user1Id, user2Id, tradeNo);
            System.out.println("Created/Found chatRoomNo for tradeNo=" + tradeNo + ": " + chatRoomNo);

            Trade trade = tService.selectOneByNo(tradeNo);
            if (trade == null) {
                model.addAttribute("errorMessage", "중고 거래 정보를 찾을 수 없습니다.");
                return "common/error";
            }

            String redirectUrl = "redirect:/chat/room?chatRoomNo=" + chatRoomNo + "&itemname=trade&itemNo=" + tradeNo + "&user1Id=" + user1Id + "&user2Id=" + user2Id;
            System.out.println("Redirecting to: " + redirectUrl);
            return redirectUrl;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "오류가 발생했습니다: " + (e.getMessage() != null ? e.getMessage() : "알 수 없는 오류"));
            return "common/error";
        }
    }

    @GetMapping("/room")
    public String showChatRoom(Model model,
                               @RequestParam("chatRoomNo") int chatRoomNo,
                               @RequestParam("user1Id") String user1Id,
                               @RequestParam("user2Id") String user2Id,
                               @RequestParam("itemname") String itemName,
                               @RequestParam("itemNo") int itemNo,
                               HttpSession session) {
        System.out.println("Received request: chatRoomNo=" + chatRoomNo + ", user1Id=" + user1Id + ", user2Id=" + user2Id + ", itemName=" + itemName + ", itemNo=" + itemNo);

        if (chatRoomNo == 0) {
            model.addAttribute("errorMessage", "유효하지 않은 채팅방 번호입니다: CHAT_ROOM_NO=" + chatRoomNo);
            return "common/error";
        }

        if (!chatRoomService.checkChatRoomExists(chatRoomNo)) {
            model.addAttribute("errorMessage", "채팅방이 존재하지 않습니다: CHAT_ROOM_NO=" + chatRoomNo);
            return "common/error";
        }

        List<Chat> chatList = chatService.getMessagesByRoom(chatRoomNo);

        Member receiver = memberService.selectMemberById(user2Id);
        if (receiver == null) {
            model.addAttribute("errorMessage", "수신자 정보를 찾을 수 없습니다.");
            return "common/error";
        }

        if ("estate".equals(itemName)) {
            Estate estate = eService.selectOneByNo(itemNo);
            if (estate == null) {
                model.addAttribute("errorMessage", "매물 정보를 찾을 수 없습니다.");
                return "common/error";
            }
            model.addAttribute("item", estate);
        } else if ("trade".equals(itemName)) {
            Trade trade = tService.selectOneByNo(itemNo);
            if (trade == null) {
                model.addAttribute("errorMessage", "중고 거래 정보를 찾을 수 없습니다.");
                return "common/error";
            }
            model.addAttribute("item", trade);
        }
        
        if(chatList.size() >0) {
        	model.addAttribute("lastChatNo",chatList.get(chatList.size()-1).getChatNo());
        }else {
        	model.addAttribute("lastChatNo",0);
        }

        model.addAttribute("chatRoomNo", chatRoomNo);
        model.addAttribute("chatList", chatList);
        model.addAttribute("writerId", user1Id);
        model.addAttribute("receiverId", user2Id);
        model.addAttribute("receiverName", receiver.getUserName());
        model.addAttribute("itemName", itemName);
        session.setAttribute("writerId", user1Id);

        return "chat/main";
    }

    @PostMapping("/send")
    @ResponseBody
    public Map<String, Object> sendChatMessage(@RequestBody SendRequest sendRequest) {
        Map<String, Object> response = new HashMap<>();
        
        System.out.println("Received SendRequest: " + sendRequest);
        
        if (sendRequest.getWriterId() == null || sendRequest.getReceiverId() == null || sendRequest.getMessage() == null || sendRequest.getChatRoomNo() == 0) {
            response.put("status", "error");
            response.put("message", "잘못된 요청: writerId, receiverId, chatRoomNo, message는 필수입니다.");
            return response;
        }

        try {
            if (!chatRoomService.checkChatRoomExists(sendRequest.getChatRoomNo())) {
                response.put("status", "error");
                response.put("message", "채팅방이 존재하지 않습니다: CHAT_ROOM_NO=" + sendRequest.getChatRoomNo());
                return response;
            }
            
            int result = chatService.sendChatMessage(sendRequest);
            if (result > 0) {
                response.put("status", "success");
            } else {
                response.put("status", "error");
                response.put("message", "메시지 전송 실패: 데이터베이스 삽입 오류");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.put("status", "error");
            response.put("message", "메시지 전송 중 오류 발생: " + e.getMessage());
        }
        return response;
    }

    @GetMapping("/list")
    public String showChatRoomList(HttpSession session, Model model) {
        String userId = (String) session.getAttribute("userId");
        if (userId == null) {
            model.addAttribute("errorMessage", "로그인이 필요합니다.");
            return "common/error";
        }
        
        List<Chat> chatRoomList = chatRoomService.getChatRoomsByUserId(userId);
        model.addAttribute("chatRoomList", chatRoomList);
        return "chat/list";
    }

    @GetMapping("/fetch")
    @ResponseBody
    public List<Chat> fetchNewMessages(@RequestParam("writerId") String writerId,
                                       @RequestParam("receiverId") String receiverId,
                                       @RequestParam("lastChatNo") Integer lastChatNo) {
        Map<String, Object> map = new HashMap<>();
        System.out.println(writerId);
        System.out.println(receiverId);
        map.put("writerId", writerId);
        map.put("receiverId", receiverId);
        map.put("lastChatNo", lastChatNo);
        List<Chat> cList = chatService.fetchNewMessages(map);
        System.out.println(cList);
        return cList;
    }
}