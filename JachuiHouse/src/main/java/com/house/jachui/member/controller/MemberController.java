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

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.UpdateRealtorRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.dto.SignupJachuiRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService mService;
	
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
				return "member/login";
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
	public String memberSignupJachui(@ModelAttribute SignupJachuiRequest request, HttpSession session) {
		boolean result = mService.signupJachui(request);
		
		if(result) {
			session.setAttribute("welcomeMsg", "회원가입이 완료되었습니다!");
			return "redirect:/"; // 메인 페이지로 리다이렉트
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
	public String memberSignupRealtor(@ModelAttribute SignupRealtorRequest request) {
		int result = mService.signupRealtor(request);
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
		Member result = mService.selectFindId(member);
		if(result != null) {
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
	@GetMapping("/realtor/myPage")
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

	// 자취생 마이페이지
	@GetMapping("/myPage")
	public String showAloneDetail(
			HttpSession session,
			Model model) {
			String userRole = (String)session.getAttribute("userRole");
			if("M".equals(userRole)) {
				String userId = (String)session.getAttribute("userId");
				Member member = mService.selectMemberById(userId);
				model.addAttribute("member", member);
				return "member/myPage";
			}else {
				model.addAttribute("errorMsg", "서비스가 완료되지 않았습니다.");
		        return "common/error";
			}
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
	@PostMapping("/delete")
	public String deleteMember(
			HttpSession session,
			@RequestParam("userId") String userId,
			@RequestParam("userPw") String userPw,
			Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		System.out.println(userId);
		System.out.println(userPw);
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
	// 공인중개사 정보 수정 페이지로 이동
	@GetMapping("/realtor/update")
	public String showRealtorUpdate(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		Member member = mService.selectRealtorById(userId);
		if(member != null) {
			model.addAttribute("member", member);
			return "member/realtor/update";
		}
		return "common/error";
	}
	//에러메시지가 뜨는이유, userRole로 본인확인을 하려면 Request, mapper에 userRole관련된 코드가 있어야 하는지
	// 공인중개사 정보 수정 기능
	@PostMapping("/realtor/update")
	public String realtorUpdate(HttpSession session, @ModelAttribute UpdateRealtorRequest realtor
			, Model model) {
		int result = mService.updateRealtor(realtor);
		String userRole = (String)session.getAttribute("userRole");
		if(result > 0) {
			if("R".equals(userRole)) {
				return "redirect:/member/realtor/myPage";
			}
		}
		return "common/error";
		
	}
	// 회원정보 수정
	@GetMapping("/update")
	public String showMemberUpdate(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		Member member = mService.selectMemberById(userId);
		if(member != null) {
			model.addAttribute("member", member);
			return "member/update";
		}
		return "common/error";
	}
	
	
	//리퀘스트 하나 더 만들고 get,post메소드 하나씩 더 만들기
	@PostMapping("/update")
	public String updateMember(
			HttpSession session,
			@ModelAttribute UpdateRequest member
			,Model model){
		int result = mService.updateMember(member);
		String userRole = (String)session.getAttribute("userRole");
		if(result > 0) {
			if("M".equals(userRole)) {
				return "member/myPage";
			}
		}
	    return "common/error";
	}
}
