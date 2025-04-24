package com.house.jachui.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.jachui.common.FileUtil;
import com.house.jachui.common.PageUtil;
import com.house.jachui.post.service.PostService;
import com.house.jachui.report.controller.dto.ReportInsertRequest;
import com.house.jachui.report.service.ReportService;

import lombok.RequiredArgsConstructor;



@Controller
@RequiredArgsConstructor
@RequestMapping("/report")
public class ReportController {

	private final ReportService rService;
	
	
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
			@ModelAttribute ReportInsertRequest report) {
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
}
