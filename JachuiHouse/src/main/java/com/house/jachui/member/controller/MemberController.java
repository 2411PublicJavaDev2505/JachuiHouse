package com.house.jachui.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.jachui.member.dto.MemberLoginRequest;
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
	public String memberLoginForm() {
		return "member/login";
	}
	
	//로그인 처리
	@PostMapping("/login")
	public String memberLoginForm(
			MemberLoginRequest member,
			HttpSession session,
			Model model) {
		try {
			// 로그인 요청 객체 생성
			// 로그인 서비스 호출
			Member mem = mService.selectOneByLogin(member);
			if (mem != null) {
				// 로그인 성공 시 세션에 값 저장
				session.setAttribute("loggedIn", true); //로그인 상태 저장
				session.setAttribute("userId", mem.getUserId()); // 유저 ID 저장
				session.setAttribute("userName", mem.getUserName()); // 사용자 이름 저장
				session.setAttribute("userRole", mem.getUserRole()); 
				return "redirect:/"; //메인페이지로 리다이렉트
			} else {
				model.addAttribute("errorMsg", "아이디 또는 비밀번호가 잘못되었습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			model.addAttribute("errorMsg", "존재하지 않는 정보입니다.");
			return "common/error";
		}
	}
			
			
//	// 로그인 처리
//	@PostMapping("/login")
//	public String loginProcess() {
//		// 로그인 처리 로직 (예: 아이디/비밀번호 확인)
//		return "로그인 처리 완료";
//	}
	
	@GetMapping("/logout")
	public String memberLogout(HttpSession session) {
		if(session != null) {
			session.invalidate();
		}
		return "member/logout";
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
			,HttpServletRequest reponse) {
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
		return "member/foundId";
	}
	
	@PostMapping("/foundId")
	public String selectFoundId(@ModelAttribute Member member, Model model) {
		List<Member> matchedList = mService.selectFoundId(member);
		model.addAttribute("matchedList", matchedList);
		return "member/foundId";
	}
	
	//공인중개사 마이페이지 이동
	@GetMapping("/realtor/mypage")
	public String showRealtorMypageForm(HttpSession session, Model model) {
		String userRole = (String)session.getAttribute("userRole");
		if("R".equals(userRole)) {
			String userId = (String)session.getAttribute("userId");
			Member member = mService.selectRealtorById(userId);
			if(member != null) {
				model.addAttribute("member", member);
				return "member/realtor/mypage";
			}
		}
		return "member/realtor/page";
	}

	// 마이페이지
	@GetMapping("/myPage")
	public String showAloneDetail() {
		return "member/myPage";
	}
	// 공인중개사 채팅 목록
	@GetMapping("/realtor/chatlist")
	public String showRealtorChatList() {
		return "member/realtor/chatlist";
	}
	// 회원탈퇴
	@GetMapping("/delete")
	public String showDleteMember() {
		return "member/delete";
	}

	// 예산계산기
	@GetMapping("/accountBook")
	public String showAccountBook() {
		return "member/accountBook";
	}
	
}
