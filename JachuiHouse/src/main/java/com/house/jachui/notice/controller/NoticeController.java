package com.house.jachui.notice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.common.FileUtil;
import com.house.jachui.common.PageUtil;
import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.notice.controller.dto.NoticeModifyRequest;
import com.house.jachui.notice.model.service.NoticeService;
import com.house.jachui.notice.model.vo.NoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {
	
	private final NoticeService nService;
	private final FileUtil fileUtil;
	private final PageUtil pageUtil;

	//@RequiredArgsConstructor가 대신함
//	@Autowired
//	public NoticeController(NoticeService nService, FileUtil fileUtil, PageUtil pageUtil){
//		this.nService = nService;
//		this.fileUtil = fileUtil;
//		this.pageUtil = pageUtil;
//	}
	
	@GetMapping("/list")
	public String NoticeList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		try {
			List<NoticeVO> nList = nService.selectListAll(currentPage);
			int totalCount = nService.getTotalCount();
			Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage);
			
			if(!nList.isEmpty()) {
				model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				model.addAttribute("nList", nList);
				return "notice/list";
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
	
	@GetMapping("/search")
	public String NoticeSearch(
			@RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="currentPage", defaultValue="1") int currentPage
			, Model model) {
		try {
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchKeyword", searchKeyword);
			
			int totalCount = nService.getTotalCount(paramMap);
			List<NoticeVO> searchList = nService.searchListByKeyword(paramMap, currentPage); 
			
			Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage);
				model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				
				model.addAttribute("searchList", searchList);
				model.addAttribute("searchCondition", searchCondition);
				model.addAttribute("searchKeyword", searchKeyword);
				return "inflBoard/search";
				
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
				return "common/error";
		}
	}
	
	@GetMapping("/add")
	public String NoticeAdd() {
		return "notice/add";
	}
	
	@PostMapping("/add")
	public String NoticeAdd(
			@ModelAttribute NoticeAddRequest notice
			, @RequestParam("uploadFile") MultipartFile uploadFile
			, HttpSession session, Model model) {
			try {
				if(uploadFile != null && !uploadFile.getOriginalFilename().isBlank()) {
					Map<String, String> fileInfo = fileUtil.saveFile(uploadFile, session, "notice");
					notice.setNoticeFileName(fileInfo.get("nFilename"));
					notice.setNoticeFileRename(fileInfo.get("nFileRename"));
					notice.setNoticeFilePath(fileInfo.get("nFilepath"));
				}
				int result = nService.addNotice(notice);
				return "redirect:/notice/list";				
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", e.getMessage());
				return "common/error";
			}
	}
	
	@GetMapping("/detail/{noticeNo}")
	public String NoticeDetail(@PathVariable int noticeNo, Model model) {
		try {
			NoticeVO notice = nService.selectOneByNo(noticeNo);
			model.addAttribute("notice", notice);
			return "notice/detail";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
		
	@GetMapping("/delete")
	public String NoticeDelete(@RequestParam("noticeNo")int noticeNo, Model model) {
		try {
			int result = nService.deleteNotice(noticeNo);
			return "redirect:/notice/list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
	
	@GetMapping("/modify/{noticeNo}")
	public String NoticeModify(@PathVariable int noticeNo, Model model) {
		try {
			NoticeVO notice = nService.selectOneByNo(noticeNo);
			model.addAttribute("notice", notice);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", e.getMessage());
			return "common/error";
		}
	}
	
	@PostMapping("/modify")
	public String NoticeModify(@ModelAttribute NoticeModifyRequest notice
			, @RequestParam("reloadFile") MultipartFile reloadFile
			, HttpSession session, Model model) {
		try {
			if(reloadFile != null && !reloadFile.getOriginalFilename().isBlank()) {
				Map<String, String> fileInfo = fileUtil.saveFile(reloadFile, session, "notice");
				notice.setNoticeFileName(fileInfo.get("nFilename"));
				notice.setNoticeFileRename(fileInfo.get("nFileRename"));
				notice.setNoticeFilePath(fileInfo.get("nFilepath"));
			}
			int result = nService.updateNotice(notice);
			return "redirect:/notice/detail/"+notice.getNoticeNo();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", e.getMessage());
			return "common/error";
		}
	}
	
}
