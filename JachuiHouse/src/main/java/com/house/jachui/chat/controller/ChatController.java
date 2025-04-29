package com.house.jachui.chat.controller;

import java.util.Collections;
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
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.common.PageUtil;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.post.service.PostService;
import com.house.jachui.trade.model.service.TradeService;
import com.house.jachui.realtor.model.service.RealtorService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
	
	private final MemberService mService;
	private final EstateService eService;
	private final TradeService tService;
	private final ChatService cService;
	private final RealtorService rService;
	private final PageUtil pageUtil;
	
	@GetMapping("/torealtor")
    public String showEtoBChat(Model model,
                               @RequestParam("estateNo") int estateNo,
                               HttpSession session) {
        try {
            String writerId = (String) session.getAttribute("userId"); // 현재 로그인한 사람
            String receiverId = eService.selectIdByEstateNo(estateNo); // 매물 번호로 중개사 ID 조회
            System.out.println(writerId);
            System.out.println(receiverId);
            return "redirect:/chat/chat?writerId=" + writerId + "&receiverId=" + receiverId;
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
            return "common/error";
        }
    }
	
	@GetMapping("/totrade")
	public String showTtoTChat(Model model,
	                           @RequestParam("tradeNo") int tradeNo,
	                           HttpSession session) {
	    try {
	        String writerId = (String) session.getAttribute("userId"); // 현재 로그인한 사람
	        String receiverId = tService.selectIdByTradeNo(tradeNo); // 상품 번호로 판매자 ID 조회
	        System.out.println(writerId);
	        System.out.println(receiverId);
	        return "redirect:/chat/chat?writerId=" + writerId + "&receiverId=" + receiverId;
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("errorMessage", e.getMessage());
	        return "common/error";
	    }
	}
	
	

    // 실제 채팅방으로 진입
    @GetMapping("/chat")
    public String showChatRoom(Model model,
                                @RequestParam("writerId") String writerId,
                                @RequestParam("receiverId") String receiverId) {
        Map<String, String> map = new HashMap<>();
        map.put("writerId", writerId);
        map.put("receiverId", receiverId);

        List<Chat> cList = cService.selectList(map);
        String receiverName = mService.selectNameById(receiverId);

        model.addAttribute("cList", cList);
        model.addAttribute("writerId", writerId);
        model.addAttribute("receiverId", receiverId);
        model.addAttribute("receiverName", receiverName);

        return "chat/main";
    }

    // 메시지 전송 처리
    @PostMapping("/send")
    @ResponseBody
    public Map<String, Object> sendChat(@ModelAttribute SendRequest chat,
                                        HttpSession session,
                                        @RequestParam(value = "images", required = false)
                                        List<MultipartFile> images) {
        Map<String, Object> response = new HashMap<>();
        int result = cService.sendChat(chat, images);
        if (result > 0) {
            response.put("status", "success");
        } else {
            response.put("status", "error");
            response.put("message", "메시지 전송 실패");
        }
        return response;
    }
    
    @GetMapping("/fetch")
    @ResponseBody
    public List<Chat> fetchNewMessages(
        @RequestParam("writerId") String writerId,
        @RequestParam("receiverId") String receiverId,
        @RequestParam(value = "lastChatNo", required = false) Integer lastChatNo) {
        
        Map<String, Object> map = new HashMap<>();
        map.put("writerId", writerId);
        map.put("receiverId", receiverId);
        map.put("lastChatNo", lastChatNo);

        return cService.selectNewMessagesAfter(map);
    }

}
