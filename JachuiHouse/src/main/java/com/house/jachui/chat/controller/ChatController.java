package com.house.jachui.chat.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.jachui.chat.controller.dto.ChatWith;
import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.service.ChatRoomService;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.chat.model.vo.ChatRoom;
import com.house.jachui.common.PageUtil;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.realtor.model.service.RealtorService;
import com.house.jachui.trade.model.service.TradeService;
import com.house.jachui.trade.model.vo.Trade;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {

	private final RealtorService rService;
    private final ChatRoomService chatRoomService;
    private final ChatService chatService;
    private final MemberService memberService;
    private final EstateService eService;
    private final TradeService tService;
    private final PageUtil pageUtil;

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
            Estate estate = eService.selectOneByNo(estateNo);
            if (estate == null) {
                model.addAttribute("errorMessage", "매물 정보를 찾을 수 없습니다.");
                return "common/error";
            }

            String redirectUrl = "redirect:/chat/room?chatRoomNo=" + chatRoomNo + "&itemname=estate&itemNo=" + estateNo + "&user1Id=" + user1Id + "&user2Id=" + user2Id;
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
            Trade trade = tService.selectOneByNo(tradeNo);
            if (trade == null) {
                model.addAttribute("errorMessage", "중고 거래 정보를 찾을 수 없습니다.");
                return "common/error";
            }

            String redirectUrl = "redirect:/chat/room?chatRoomNo=" + chatRoomNo + "&itemname=trade&itemNo=" + tradeNo + "&user1Id=" + user1Id + "&user2Id=" + user2Id;
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
        model.addAttribute("itemNo", itemNo);
        session.setAttribute("writerId", user1Id);

        return "chat/main";
    }


    @PostMapping("/send")
    @ResponseBody
    public Map<String, Object> sendMessage(@RequestBody SendRequest sendRequest) {
        Map<String, Object> response = new HashMap<>();
        try {
            Chat chat = new Chat();
            chat.setChatRoomNo(sendRequest.getChatRoomNo());
            chat.setWriterId(sendRequest.getWriterId());
            chat.setReceiverId(sendRequest.getReceiverId());
            chat.setMessage(sendRequest.getMessage());
            chat.setIsRead("N"); // 초기 상태는 안 읽음
            chat.setCreateDate(new java.sql.Date(System.currentTimeMillis()));
            chat.setChatTime(new Timestamp(System.currentTimeMillis()));

            chatService.insertMessage(chat); // DB에 저장

            response.put("success", true);
            response.put("chat", chat);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        return response;
    }

    




    @GetMapping("/list")
    public String showChatRoomList(HttpSession session, Model model
    		, @RequestParam(value="page", defaultValue="1") int currentPage) {
        String userId = (String) session.getAttribute("userId");
        String userRole = (String)session.getAttribute("userRole");
        Set<String> opponentSet = new HashSet<>();
		List<ChatWith> uniqueChatWithList = new ArrayList<>();
		List<Chat> cList = chatRoomService.getChatRoomByUserId(userId, currentPage, 3);
		int totalCount = rService.getTotalCount(userId);
		Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage, 3);
		model.addAttribute("maxPage", pageInfo.get("maxPage"));
		model.addAttribute("startNavi", pageInfo.get("startNavi"));
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endNavi", pageInfo.get("endNavi"));
        Member member = rService.selectRealtorById(userId);
        for (Chat chat : cList) {
		    ChatRoom room = chatRoomService.getChatRoomByNo(chat.getChatRoomNo());
		    // 상대방 ID 구하기 (본인 제외)
		    String opponentId = room.getUser1Id().equals(userId) ? room.getUser2Id() : room.getUser1Id();
		    if (!opponentSet.contains(opponentId)) {
		        opponentSet.add(opponentId);				        
		        // 상대방 정보 조회
		        Member opponent = memberService.selectMemberById(opponentId);
		        String opponentName = opponent != null ? opponent.getUserName() : "알 수 없음";

		        ChatWith cwl = new ChatWith(chat, room, opponentId, opponentName);
		        uniqueChatWithList.add(cwl);
		    }
		}
        model.addAttribute("chatwithList", uniqueChatWithList);
        model.addAttribute("cList", cList);
        return "chat/list";
    }

    @GetMapping("/fetch")
    @ResponseBody
    public Map<String, Object> fetchMessages(@RequestParam("chatRoomNo") int chatRoomNo,
                                             @RequestParam("lastChatNo") int lastChatNo) {
        Map<String, Object> response = new HashMap<>();
        try {
            List<Chat> newMessages = chatService.getMessagesAfter(chatRoomNo, lastChatNo);
            response.put("success", true);
            response.put("messages", newMessages);
        } catch (Exception e) {
            e.printStackTrace();
            response.put("success", false);
            response.put("error", e.getMessage());
        }
        return response;
    }

    

}