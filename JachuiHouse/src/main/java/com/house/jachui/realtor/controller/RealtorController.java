package com.house.jachui.realtor.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
			List<Estate> eList = rService.selectEstatesById(userId, currentPage, 3);
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
	// 공인중개사 정보 수정 기능
	@PostMapping("/update")
	public String realtorUpdate(HttpSession session, @ModelAttribute UpdateRealtorRequest realtor
			, Model model) {
		int result = rService.updateRealtor(realtor);
		String userRole = (String)session.getAttribute("userRole");
		if(result > 0) {
			if("R".equals(userRole)) {
				return "redirect:/realtor/myPage";
			}
		}
		return "common/error";
	}
}
