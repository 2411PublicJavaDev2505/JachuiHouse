package com.house.jachui.report.controller;

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

import com.house.jachui.common.FileUtil;
import com.house.jachui.common.PageUtil;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.post.service.PostService;
import com.house.jachui.report.controller.dto.CreportInsertRequest;
import com.house.jachui.report.controller.dto.PreportInsertRequest;
import com.house.jachui.report.service.ReportService;
import com.house.jachui.report.vo.ReportVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/report")
public class ReportController {

	private final ReportService rService;
//	private final PostService pService;
	
	@GetMapping("/cinsert")
	public String showReportcInsert(Model model) {
		
		
		try {
			return "/post/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";	
		}
	}
	
	@PostMapping("/cinsert")
	public String reportcInsert(Model model,
			@ModelAttribute CreportInsertRequest report,
			HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		report.setUserId(userId);
		
		try {
			int result = rService.reportcInsert(report);
			if(result > 0) {
				return "redirect:/";
			}else {
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
	
	@GetMapping("/pinsert")
	public String showReportpInsert(Model model) {
		try {
			return "/post/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";	
		}
	}
	
	@PostMapping("/pinsert")
	public String reportpInsert(Model model,
			@ModelAttribute PreportInsertRequest report,
			HttpSession session) {
		
		String userId = (String)session.getAttribute("userId");
		report.setUserId(userId);
		
		try {
			int result = rService.reportpInsert(report);
			if(result > 0) {
				return "redirect:/";
			}else {
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
	
	//신고 관리 조회
	@GetMapping("/list")
	public String reportList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		try {
			List<ReportVO> rList = rService.selectListAll(currentPage);
			int totalCount = rService.getTotalCount();
			Map<String, Integer> pageInfo = PageUtil.generatePageInfo(totalCount, currentPage);
			
			if(!rList.isEmpty()) {
				model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				model.addAttribute("rList", rList);
				return "report/list";
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
}
