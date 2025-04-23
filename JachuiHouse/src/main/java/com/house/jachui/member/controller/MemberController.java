package com.house.jachui.member.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.Base64;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.house.jachui.common.PageUtil;
import com.house.jachui.member.dto.ContactRequest;
import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.MemberPasswordRequest;
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
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService mService;
	//회원 관리 리스트 - 페이지네이션
	private final PageUtil pageUtil;
	
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
			
	//로그아웃 기능 구현하기 
	@PostMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/member/login";
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
//			return "redirect:/"; // 메인 페이지로 리다이렉트
			return "member/login";
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
//			return "redirect:/";
			return "member/login";
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
	
	// 비밀번호 찾기 페이지로 이동
	@GetMapping("/resetPw")
	public String resetPwGet(@ModelAttribute("member")MemberPasswordRequest MemberPasswordRequest) {
		return "member/resetPw";
	}
	
	// 비밀번호 찾기 처리	
	@PostMapping("/resetPw")
	public String updateResetPw(
			MemberPasswordRequest memberPasswordRequest,
			Model model) {
		// 아이디와 이메일로 회원인지 아닌지 확인 후 
		Member member = mService.selectOneByIdEmail(memberPasswordRequest);
		//String password = mService.resetPw(memberPasswordRequest);  // 입력한 비밀번호를 URL 표시할 때 암호화 한다.
		// 회원이 맞다면 
		if(member != null) {
			// 메일 보내기 가동, 메일은 비밀번호 재설정 링크가 보내지는 것임.
			mService.sendEmailPw(memberPasswordRequest.getUserEmail());
			// 이메일 보낸 후 로그인 페이지로 이동
			return "redirect:/member/login";

 		}else {
 			return null;
 		}
//		else if(password==null) {
// 			model.addAttribute("password", null);
//		}
//		
//		return "/member/findPwResult";
	}
	
	// 비밀번호 찾기 페이지로 이동
	@GetMapping("/createNewPw")
	public String showCreateNewPwPage() {
		return "member/createNewPw";
	}
	
	
	// 비밀번호 재설정 처리
	@PostMapping("/createNewPw")
	public String insertNewPw(
			@RequestParam("userPw") String userPw,
			@RequestParam("userPwCheck") String userPwCheck,
			HttpSession session,
			Model model) {
		
		if(!userPw.equals(userPwCheck)) {
			model.addAttribute("error", "비밀번호가 일치하지 않습니다.");
			return "member/createNewPw";
		}
		// 세션에서 userId 가져오기
		String userId = (String) session.getAttribute("userId");
		
		boolean result = mService.updatePassword(userId, userPw);
		
		if(result) {
			return "redirect:/member/login";
		} else {
			model.addAttribute("error", "비밀번호 변경에 실패했습니다.");
			return "member/createNewPw";
		}
	}
	
	// 아이디찾기결과 페이지 이동
	@GetMapping("/foundId")
	public String selectFoundIdForm() {
		return "member/foundId";
	}
	
	@PostMapping("/foundId")
	public String selectFoundId(@ModelAttribute Member member, Model model) {
		Member foundMember = mService.selectFoundId(member);
		if(foundMember != null) {
			model.addAttribute("member", foundMember);
			return "member/foundId";
		}else {
			return "member/error";
		}
	}
	
	// 문의 메일 기능 api
	@PostMapping("/contact/inquiry")
    public RedirectView contactInquiry(
            MultipartHttpServletRequest imageRequest,
            @ModelAttribute("contactRequest") ContactRequest contactRequest) throws IOException {
        // 문의용 이미지 파일을 리스트에 저장
        List<MultipartFile> contactImage = imageRequest.getFiles("contactImage");
        // service 단으로 진입하여 실질적으로 문의 사항을 등록시킬 비즈니스로직 수행 (이후 이메일로 직접적으로 문의 메일을 보낼 로직 추가 필요)
        mService.contactInquiry(contactImage, contactRequest);

        return new RedirectView("/gds/contact");
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
		if(!mService.checkPw(userId, userPw)) {
			model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
			return "common/error";
		}
		int result = mService.deleteMember(userId);
		if(result > 0) {
			session.invalidate();
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
			@ModelAttribute UpdateRequest member,
			@RequestParam(value = "profileImage", required = false) MultipartFile file,
			Model model) throws IOException{
		String userId = member.getUserId();
		 // 새 프로필 이미지가 있는 경우 저장 처리
	    if (file != null && !file.isEmpty()) {
	        String uploadDir = "C:\\Users\\user1\\Desktop\\backend\\bootprojectworkspace\\JachuiHouse\\JachuiHouse\\src\\main\\webapp\\resources\\image"; // 원하는 경로로 설정
	        String originalFilename = file.getOriginalFilename();
	        String newFileName = UUID.randomUUID() + "_" + originalFilename;
	          
	        // 이미지 저장 (예외는 GlobalExceptionHandler에서 처리)
	        file.transferTo(Path.of(uploadDir, newFileName));
	    
	        // 이미지 변경이 없는 경우, 기존 이미지 유지
	    	 mService.updateProfileImage(userId, newFileName); 
	    }
		
		int result = mService.updateMember(member);
		String userRole = (String)session.getAttribute("userRole");
		if(result > 0) {
			if("M".equals(userRole)) {
				return "redirect:/member/myPage";
			}
		}
	    return "common/error";
	}
	
	//회원 관리 조회
	@GetMapping("/list")
	public String memberList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		try {
			List<Member> mList = mService.selectListAll(currentPage);
			int totalCount = mService.getTotalCount();
			Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage);
			
			if(!mList.isEmpty()) {
				model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				model.addAttribute("mList", mList);
				return "member/list";
			}else {
				model.addAttribute("errorMessage", "데이터가 존재하지 않습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
		
	}
	
	//회원 관리 검색
	@GetMapping("/search")
	public String memberSearch(
			@RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", defaultValue="1") int currentPage
			, Model model) {
		try {
			int totalCount = mService.getTotalCountByKeyword(searchKeyword);
			List<Member> searchList = mService.searchListByKeyword(searchKeyword, currentPage);
			
			Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage);
				model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				
				model.addAttribute("searchList", searchList);
				model.addAttribute("searchKeyword", searchKeyword);
				
				return "member/search";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
				return "common/error";
		}
	}
	
}
