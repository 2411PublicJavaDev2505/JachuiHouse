package com.house.jachui.realtor.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.common.PageUtil;
import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.post.service.PostService;
import com.house.jachui.realtor.controller.dto.UpdateRealtorRequest;
import com.house.jachui.realtor.model.service.RealtorService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/realtor")
@RequiredArgsConstructor
public class RealtorController {

	private final PostService pService;
	
	private final RealtorService rService;
	//회원 관리 리스트 - 페이지네이션
	private final PageUtil pageUtil;
	
	//공인중개사 마이페이지 이동
	@GetMapping("/myPage")
	public String showRealtorMypageForm(HttpSession session, Model model
			,@RequestParam(value="page", defaultValue="1") int currentPage) {
		String userRole = (String)session.getAttribute("userRole");
		if("R".equals(userRole)) {
			String userId = (String)session.getAttribute("userId");
			Member member = rService.selectRealtorById(userId);
			List<Estate> eList = rService.selectEstatesById(userId, currentPage);
			int totalCount = rService.getTotalCount(userId);
			Map<String, Integer>pageInfo = pageUtil.generatePageInfo(totalCount, currentPage);
			model.addAttribute("maxPage", pageInfo.get("maxPage"));
			model.addAttribute("startNavi", pageInfo.get("startNavi"));
			model.addAttribute("endNavi", pageInfo.get("endNavi"));
			model.addAttribute("eList", eList);
			if(member != null) {
				model.addAttribute("member", member);
				return "realtor/mypage";
			}
		}
		return "realtor/page";
	}
	
	// 공인중개사 채팅 목록
	@GetMapping("/chatlist")
	public String showRealtorChatList() {
		return "realtor/chatlist";
	}
	// 공인중개사 정보 수정 페이지로 이동
	@GetMapping("/update")
	public String showRealtorUpdate(HttpSession session, Model model) {
		String userId = (String)session.getAttribute("userId");
		Member member = rService.selectRealtorById(userId);
		if(member != null) {
			model.addAttribute("member", member);
			return "realtor/update";
		}
		return "common/error";
	}
	
	//에러메시지가 뜨는이유, userRole로 본인확인을 하려면 Request, mapper에 userRole관련된 코드가 있어야 하는지
	@PostMapping("/update")
	public String realtorUpdate(
			HttpSession session,
	        @ModelAttribute UpdateRealtorRequest realtor,
	        @RequestParam(value = "profileImage", required = false) MultipartFile file,
	        Model model) throws IOException {

	    String userId = realtor.getUserId(); // realtor 객체에서 userId를 가져온다고 가정
	    // 새 프로필 이미지가 있는 경우 저장 처리
	    if (file != null && !file.isEmpty()) {
	        String uploadDir = "C:\\Users\\user1\\Desktop\\backend\\bootprojectworkspace\\JachuiHouse\\JachuiHouse\\src\\main\\webapp\\resources\\image"; // 이미지 저장 경로
	        String originalFilename = file.getOriginalFilename();
	        String newFileName = UUID.randomUUID() + "_" + originalFilename;

	        // 이미지 저장
	        file.transferTo(Path.of(uploadDir, newFileName));

	        // 새 이미지 파일명 DB에 반영
	        rService.updateProfileImage(userId, newFileName);
	    }

	    // 공인중개사 정보 수정
	    int result = rService.updateRealtor(realtor);
	    String userRole = (String) session.getAttribute("userRole");

	    if (result > 0) {
	        if ("R".equals(userRole)) {
	            return "redirect:/realtor/myPage";
	        }
	    }

	    return "common/error";
	}
}
