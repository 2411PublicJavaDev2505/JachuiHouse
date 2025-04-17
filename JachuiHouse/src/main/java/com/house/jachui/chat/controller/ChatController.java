package com.house.jachui.chat.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.member.model.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat")
public class ChatController {
	private MemberService mService;
	private EstateService eService;
	private ChatService cService;
	
	@Autowired
	public ChatController(ChatService cService, EstateService eService, MemberService mService) {
		this.cService = cService;
		this.eService = eService;
		this.mService = mService;
	}
//	
//	@GetMapping("chat/torealtor")
//	public String showToRealtorChat(Model model
//			, @RequestParam("writerId") String writerId
//			, @RequestParam("estateNo") int estateNo) {
//		String recieverId = eService.selectOneByNo(estateNo);
//		return "redirect:/chat/chat?writerId="+writerId+"&recieverId="+recieverId;
//	}
	@GetMapping("/chat")
	public String showChatList() {
		return "/chat/chat";
	}
		
	
}
