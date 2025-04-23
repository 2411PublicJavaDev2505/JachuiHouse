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
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.member.model.service.MemberService;

import jakarta.servlet.http.HttpSession;
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
	@GetMapping("/torealtor")
	public String showChatList(Model model
			, @RequestParam("writerId") String writerId
			, @RequestParam("estateNo") int estateNo) {
		return "/chat/torealtor";
	}
	
	@GetMapping("/main")
	public String showChatRoom(Model model
			, @RequestParam("recieverId") String recieverId
			, HttpSession session) {
		Map<String, String> map = new HashMap<String, String>();
		String writerId = (String)session.getAttribute("userId");
		map.put("recieverId", recieverId);
		map.put("writerId", writerId);
		List<Chat> cList = cService.selectList(map);
//		String recieverName = mService.selectNameById(recieverId);
		model.addAttribute("cList", cList);
		model.addAttribute("recieverId", recieverId);
		model.addAttribute("writerId", writerId);
//		model.addAttribute("recieverName", recieverName);
		return "chat/main";
	}
	@PostMapping("/send")
	public String sendChat(Model model
			,@ModelAttribute SendRequest chat
			, HttpSession session
			, @RequestParam(value = "images", required = false)
			 List<MultipartFile> images) {
		int result = cService.sendChat(chat, images);
		String role = (String)session.getAttribute("role");
		if(result > 0) {
			return "redirect:/chat/main?writerId="+chat.getWriterId()+"&recieverId="+chat.getRecieverId();
		}else {
			return "common/error";
		}
	}
//	@GetMapping("/list")
//	public String chatList(Model model
//			, )
	
}
