package com.house.jachui.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.jachui.member.controller.dto.UpdateRequest;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
			@ModelAttribute Member member
			,HttpServletRequest request) {
		int result = mService.memberSignupJachui(member);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "common/error";
		}
		
	}
	
	
	// 공인중개사 회원가입 페이지 이동
	@GetMapping("/signupRealtor")
	public String memberSignupRealtorForm() {
		return "member/signupRealtor";
	}
	
	// 공인중개사 회원가입 처리	
	@PostMapping("/signupRealtor")
	public String memberSignupRealtor(
			@ModelAttribute Member member
			,HttpServletRequest request) {
		int result = mService.memberSignupRealtor(member);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "common/error";
		}
		
	}

	
	// 아이디찾기 페이지 이동
	@GetMapping("/findId")
	public String selectFindIdForm() {
		return "member/findId";
	}
	
	// 아이디찾기 처리	
	@PostMapping("/findId")
	public String selectFindId(
			@ModelAttribute Member member
			,HttpServletRequest request) {
		int result = mService.selectFindId(member);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "common/error";
		}
		
	}
	
	// 비밀번호 재설정 페이지 이동
	@GetMapping("/resetPw")
	public String updateResetPwForm() {
		return "member/resetPw";
	}
	
	// 비밀번호 재설정 처리	
	@PostMapping("/resetPw")
	public String updateResetPw(
			@ModelAttribute Member member
			,HttpServletRequest request) {
		int result = mService.updateResetPw(member);
		if(result > 0) {
			return "redirect:/";
		}else {
			return "common/error";
		}
		
	}
	
	// 아이디찾기결과 페이지 이동
	@GetMapping("/foundId")
	public String selectFoundIdForm() {
		return "member/resetPw";
	}
	
	@PostMapping("/foundId")
	public String selectFoundId(Member member, Model model) {
		List<Member> matchedList = mService.selectFoundId(member);
		model.addAttribute("matchedList", matchedList);
		return "member/foundId";
	}
	
	//공인중개사 마이페이지 이동
	@GetMapping("/realtor/mypage")
	public String showRealtorMypageForm(HttpSession session, Model model) {
		return "member/realtor/mypage";
		
	}


	// 마이페이지
	@GetMapping("/myPage")
	public String showAloneDetail() {
		return "member/myPage";
	}
	// 회원탈퇴
	@GetMapping("/delete")
	public String showDleteMember() {
		return "member/delete";
	}
	@PostMapping("/delete")
	public String deleteMember(
			HttpSession session,
			@RequestParam("userId") String userId,
			@RequestParam("userPw") String userPw,
			Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(!mService.checkPw(userId, userPw)) {
			model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
			return "common/error";
		}
		
		int result = mService.deleteMember(userId);
		if(result > 0) {
			return "redirect:/";
		}else {
		model.addAttribute("errorMsg", "서비스가 완료되지 않았습니다.");
	        return "common/error";
		}
	}
	// 예산계산기
	@GetMapping("/accountBook")
	public String showAccountBook() {
		return "member/accountBook";
	}
	// 회원정보 수정
	@GetMapping("/update")
	public String showMemberUpdate() {
		return "member/update";
	}
	@PostMapping("/update")
	public String updateMember(
			HttpSession session,
			@ModelAttribute UpdateRequest member
			,Model model){
		int result = mService.updateMember(member);
		if(result > 0) {
			String role = (String)session.getAttribute("userRole");
			switch(role) {
			case "M" : 
				return "redirect:/member/myPage";
			case "R" :
				return "redirect:/realtor/mypage";
			default :
				return "common/error";
			}
			
		}else {
			model.addAttribute("errorMsg", "서비스가 완료되지 않았습니다.");
	        return "common/error";
		}
		 
	}
	
}
