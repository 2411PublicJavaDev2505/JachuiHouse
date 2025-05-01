package com.house.jachui.member.controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

import com.house.jachui.common.FileUtil;
import com.house.jachui.chat.controller.dto.ChatWith;
import com.house.jachui.chat.model.service.ChatRoomService;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.chat.model.vo.ChatRoom;
import com.house.jachui.common.PageUtil;
import com.house.jachui.member.dto.ContactRequest;
import com.house.jachui.member.dto.MemberAddRequest;
import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.MemberPasswordRequest;
import com.house.jachui.member.dto.SignupJachuiRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.post.domain.PostVO;
import com.house.jachui.post.service.PostService;
import com.house.jachui.trade.model.service.TradeService;
import com.house.jachui.trade.model.vo.Trade;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/member")
@RequiredArgsConstructor
public class MemberController {
	
	private final PostService pService;
	private final TradeService tService;
	private final MemberService mService;
	private final ChatService cService; 
	private final ChatRoomService chatRoomService;
	//회원 관리 리스트 - 페이지네이션
	private final PageUtil pageUtil;
	
	private final FileUtil fileUtil;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
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
				model.addAttribute("success", "가입이 완료되었습니다.");
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
		int result = mService.signupJachui(request);
		
		if(result > 0) {
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
	
	// 공인중개사 회원가입 처리	(파일 업로드 포함)
	@PostMapping("/signupRealtor")
    public String memberSignupRealtor(
            @ModelAttribute SignupRealtorRequest request,
            @RequestParam(value = "mUploadFiles", required = false) MultipartFile uploadFile,
            HttpSession session, Model model) {
        try {
            // 1. 파일 저장 처리 (사업자등록증)
            if (uploadFile != null && !uploadFile.getOriginalFilename().isBlank()) {
                Map<String, String> fileInfo = fileUtil.saveFile(uploadFile, session, "member");
                request.setFileName(fileInfo.get("mFilename"));
                request.setFileRename(fileInfo.get("mFileRename"));
                request.setFilePath("/resources/mUploadFiles/" + fileInfo.get("mFileRename"));
            }

			/*
			 * // 2. 비밀번호 암호화 String encodedPassword =
			 * passwordEncoder.encode(request.getUserPw());
			 * request.setUserPw(encodedPassword);
			 */

            // 3. 회원가입 처리
            int result = mService.signupRealtor(request);

            if (result > 0) {
                session.setAttribute("welcomeMsg", "회원가입이 완료되었습니다!");
                return "member/login";
            } else {
                model.addAttribute("errorMessage", "회원가입에 실패했습니다.");
                return "common/error";
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", e.getMessage());
            return "common/error";
        }
    }
	
	
	// 공인중개사 회원가입 id 중복확인
	@GetMapping("idCheck")
	@ResponseBody //JSON 응답.
	public int overlappedID(@RequestParam("userId") String userId) throws Exception{  // Ajax에서 보낸 userId 파라미터 받기.
		return mService.overlappedID(userId);
	}
	
//	// 자취생 회원가입 id 중복확인
//		@GetMapping("idCheck")
//		@ResponseBody //JSON 응답.
//		public int overlappedID1(@RequestParam("userId") String userId) throws Exception{  // Ajax에서 보낸 userId 파라미터 받기.
//			return mService.overlappedID(userId);
//		}
	
	// 회원가입 email 중복확인
		@GetMapping("emailCheck")
		@ResponseBody //JSON 응답.
		public int overlappedEmail(@RequestParam("userEmail") String userId) throws Exception{  // Ajax에서 보낸 userId 파라미터 받기.
			return mService.overlappedEmail(userId);
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
			,RedirectAttributes redirectAttributes) {
		Member result = mService.selectFindId(member);
		if(result != null) {
			// 성공 시 홈으로 리다이렉트 
			redirectAttributes.addFlashAttribute("successMessage", "아이디: " + result.getUserId());
			return "redirect:/";
		}else {
			// 실패 시 에러 메시지 추가 후 아이디찾기 페이지로 리다이렉트
			String errorMessage = mService.getFindIdErrorMessage(member);
			redirectAttributes.addFlashAttribute("errorMessage", errorMessage);
			return "redirect:/findId";
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
			mService.sendEmailPw(memberPasswordRequest);
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
	
	// 비밀번호 재설정 페이지로 이동
	@GetMapping("/createNewPw")
	public String showCreateNewPwPage(@RequestParam("userId") String userId, Model model) {
		model.addAttribute("userId", userId);
		return "member/createNewPw";
	}
	
	
	// 비밀번호 재설정 처리
	@PostMapping("/createNewPw")
	public String insertNewPw(
			@RequestParam("userId") String userId,
			@RequestParam("userPwCheck") String userPwCheck,
			@RequestParam("userPwCheck2") String userPwCheck2,
			HttpSession session,
			Model model) {
		
		// 1. 세션에서 userId 가져오기. 현재 비밀번호 맞는지 체크.
//		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			model.addAttribute("error", "비밀번호 재설정 링크가 유효하지 않습니다.");
			return "member/resetPw";
		}
		
		// 2. 현재 비밀번호 확인
		
		// 3. 새 비밀번호, 새 비밀번호 확인 맞는지 비밀번호 체크
		if(!userPwCheck.equals(userPwCheck2)) { // 새비밀번호, 새비밀번호 확인이 서로 다름 
			model.addAttribute("error", "새 비밀번호와 새 비밀번호 확인 서로 일치하지 않습니다.");
			return "member/createNewPw?userId="+userId;
		}
		
		// 4. 새 비밀번호 유효성 검사
		if (!userPwCheck.matches("^[a-zA-Z0-9]{8,20}$")) {
	        model.addAttribute("error", "새 비밀번호는 영어 소문자, 대문자, 숫자만 입력 가능하며 8~20자리여야 합니다.");
	        return "member/createNewPw?userId="+userId;
	    }
		
		// 5. 비밀번호 암호화 및 DB 비밀번호 변경
		String hashPw = passwordEncoder.encode(userPwCheck);
		boolean result = mService.updatePw(userId, userPwCheck);
		
		if (result) {
			// 6. 완료 메시지 및 로그아웃
			session.invalidate();
			model.addAttribute("success", "비밀번호 변경 완료. 다시 로그인해주세요.");
			return "member/login";
		} else {
			model.addAttribute("error", "비밀번호 변경에 실패했습니다.");
			return "member/createNewPw";
		}
		
//			boolean result = mService.updatePassword(userId, userPw);
//			
//			if(result) {
//				return "redirect:/member/login";
//			} else {
//				model.addAttribute("error", "비밀번호 변경에 실패했습니다.");
//				return "member/createNewPw";
//			}
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
			model.addAttribute("errorMsg", "존재하지 않는 회원입니다.");
			return "member/findId";
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
	
	// 자취생 마이페이지
	@GetMapping("/myPage")
	public String showAloneDetail(
			HttpSession session,
			Model model) {
			String userRole = (String)session.getAttribute("userRole");
			if("M".equals(userRole)) {
				Set<Integer> roomSet = new HashSet<>();
				String userId = (String)session.getAttribute("userId");
				Member member = mService.selectMemberById(userId);
				List<ChatWith> chatWithList = new ArrayList<>();
				List<Chat> cList = cService.getChatRoomsByMyId(userId);
				List<PostVO> pList = pService.getPostsByUserId(userId);
				List<Trade> tList = tService.getTradeByUserId(userId);
				for (Chat chat : cList) {
				    ChatRoom room = chatRoomService.getChatRoomByNo(chat.getChatRoomNo());
				    int chatRoomNo = room.getChatRoomNo();
				    // 이미 처리한 채팅방이면 건너뛰기
				    if (roomSet.contains(chatRoomNo)) {
				        continue;
				    }
				    roomSet.add(chatRoomNo); // 처리한 채팅방 저장
				    String opponentId = room.getUser1Id().equals(userId) ? room.getUser2Id() : room.getUser1Id();
				    // 상대방 정보 조회
				    Member opponent = mService.selectMemberById(opponentId);
				    String opponentName = opponent != null ? opponent.getUserName() : "알 수 없음";

				    ChatWith cwl = new ChatWith(chat, room, opponentId, opponentName);
				    chatWithList.add(cwl);
				}
				model.addAttribute("chatWithList", chatWithList);
				model.addAttribute("tList", tList);
				model.addAttribute("member", member);
				model.addAttribute("pList", pList);
				model.addAttribute("cList", cList);
				return "member/myPage";
			}else {
				model.addAttribute("errorMsg", "서비스가 완료되지 않았습니다.");
		        return "common/error";
			}
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
	        RedirectAttributes redirectAttributes) {
	    
	    if (!mService.checkPw(userId, userPw)) {
	        redirectAttributes.addFlashAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
	        return "redirect:/member/delete";  
	    }
	    
	    int result = mService.deleteMember(userId);
	    if (result > 0) {
	        session.invalidate();
	        return "redirect:/";
	    } else {
	        redirectAttributes.addFlashAttribute("errorMsg", "서비스가 완료되지 않았습니다.");
	        return "redirect:/member/delete"; 
	    }
	}
	// 예산계산기
	@GetMapping("/accountBook")
	public String showAccountBook() {
		return "member/accountBook";
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
			for (Member m : mList) {
				System.out.println(">>> member: " + m);
			}
			int totalCount = mService.getTotalCount();
			Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage,10);
			
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
			
			Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage,10);
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
	
	//관리자가 비번 없이 삭제
	@PostMapping("/delete-by-admin")
	@ResponseBody
	public String deleteMemberByAdmin(@RequestParam("userId") String userId) {
		System.out.println("삭제 요청 받은 userId: " + userId); 
		int result = mService.deleteMember(userId);
		return (result > 0) ? "success" : "fail";
	}

	//관리자 승인
	@PostMapping("/approve")
	@ResponseBody
	public String approveMember(@RequestParam("userId") String userId) {
	    int result = mService.approveMember(userId);
	    return result > 0 ? "success" : "fail";
	}

	
}
