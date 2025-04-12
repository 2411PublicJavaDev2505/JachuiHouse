package com.house.jachui.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.jachui.member.service.MemberService;
import com.house.jachui.member.vo.MemberVO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService mService;
	
	@Autowired
	public MemberController(MemberService mService) {
		this.mService = mService;
	}
	
	// 로그인 페이지로 이동
	@GetMapping("/login")
	public String MemberLoginForm() {
		return "member/login";  // /WEB-INF/views/login.jsp 로 연결됨
	}
	// 로그인 처리
	@PostMapping("/login")
	public String loginProcess() {
		// 로그인 처리 로직 (예: 아이디/비밀번호 확인)
		return "로그인 처리 완료";
	}
	
	// 자취생 회원가입 페이지 이동
	@GetMapping("/signupJachui")
	public String memberSignupJachuiForm() {
		return "member/signupJachui";
	}
	
	// 자취생 회원가입 처리	
	@PostMapping("/signupJachui")
	public String memberSignupJachui(
			@ModelAttribute MemberVO member
			,HttpServletRequest request) {
		int result = mService.memberSignupJachui(member);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "common/error";
		}
		
	}
}
