package com.house.jachui.notice.controller;

import java.io.File;
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
import com.house.jachui.member.model.vo.Member;
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
	public String noticeList(@RequestParam(value="page", defaultValue="1") int currentPage, Model model) {
		try {
			List<NoticeVO> nList = nService.selectListAll(currentPage);
			int totalCount = nService.getTotalCount();
			Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage, 10);
			
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
	public String noticeSearch(
			@RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", defaultValue="1") int currentPage
			, Model model) {
		try {
			
			int totalCount = nService.getTotalCountByKeyword(searchKeyword);
			List<NoticeVO> searchList = nService.searchListByKeyword(searchKeyword, currentPage); 
			
			Map<String, Integer> pageInfo = pageUtil.generatePageInfo(totalCount, currentPage, 10);
				model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				
				model.addAttribute("searchList", searchList);
				model.addAttribute("searchKeyword", searchKeyword);
				return "notice/search";
				
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
				return "common/error";
		}
	}
	
	@GetMapping("/add")
	public String noticeAdd() {
		return "notice/add";
	}
	
	@PostMapping("/add")
	public String noticeAdd(
			@ModelAttribute NoticeAddRequest notice
			, @RequestParam("uploadFile") MultipartFile uploadFile
			, HttpSession session, Model model) {

			try {
				// 1. 파일 저장 처리
				if(uploadFile != null && !uploadFile.getOriginalFilename().isBlank()) {
					Map<String, String> fileInfo = fileUtil.saveFile(uploadFile, session, "notice");
					notice.setNoticeFileName(fileInfo.get("nFilename"));
					notice.setNoticeFileRename(fileInfo.get("nFileRename"));
					notice.setNoticeFilePath("/resources/nUploadFiles/"+fileInfo.get("nFileRename"));
				}
				
		         //2. 세션에서 userId 가져와서 세팅
				String userId = (String) session.getAttribute("userId");
		        if (userId != null) {
		        notice.setUserId(userId);          
		        } else {
		            model.addAttribute("errorMessage", "로그인이 필요합니다.");
		            return "common/error";
		        }

		        // 3. 저장
		        int result = nService.addNotice(notice);

				return "redirect:/notice/list";				
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("errorMessage", e.getMessage());
				return "common/error";
			}
	}

	
	@GetMapping("/detail/{noticeNo}")
	public String noticeDetail(@PathVariable int noticeNo, Model model) {
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
	public String noticeDelete(@RequestParam("noticeNo")int noticeNo, Model model) {
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
	public String noticeModify(@PathVariable int noticeNo, Model model) {
		try {
			NoticeVO notice = nService.selectOneByNo(noticeNo);
			model.addAttribute("notice", notice);
			return "notice/modify";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", e.getMessage());
			return "common/error";
		}
	}
	
	@PostMapping("/modify")
	public String noticeModify(@ModelAttribute NoticeModifyRequest notice
			, @RequestParam("reloadFile") MultipartFile reloadFile
			, HttpSession session, Model model) {
		try {
			// 📌 1. 파일 정보 확인 로그
			System.out.println("📦 업로드한 파일 이름: " + reloadFile.getOriginalFilename());
			
	        // 파일 새로 업로드한 경우
	        if (reloadFile != null && !reloadFile.getOriginalFilename().isBlank()) {
	            Map<String, String> fileInfo = fileUtil.saveFile(reloadFile, session, "notice");
	            
				// 📌 2. 파일 저장 결과 확인 로그
				System.out.println("✅ 저장된 파일 원본명: " + fileInfo.get("nFilename"));
				System.out.println("✅ 저장된 파일 리네임: " + fileInfo.get("nFileRename"));
	            
	            notice.setNoticeFileName(fileInfo.get("nFilename"));
	            notice.setNoticeFileRename(fileInfo.get("nFileRename"));
	            notice.setNoticeFilePath("/resources/nUploadFiles/"+fileInfo.get("nFileRename"));
	        } else {
				System.out.println("📎 새 파일 없음. 기존 파일 유지할 예정");
	        	
	            // 기존 첨부파일 정보를 그대로 유지
	            NoticeVO originNotice = nService.selectOneByNo(notice.getNoticeNo());
	            
				// 📌 3. 기존 파일 정보 확인 로그
				System.out.println("📂 기존 파일명: " + originNotice.getNoticeFileName());
				System.out.println("📂 기존 파일리네임: " + originNotice.getNoticeFileRename());
				System.out.println("📂 기존 파일경로: " + originNotice.getNoticeFilePath());
	            
	            notice.setNoticeFileName(originNotice.getNoticeFileName());
	            notice.setNoticeFileRename(originNotice.getNoticeFileRename());
	            notice.setNoticeFilePath(originNotice.getNoticeFilePath());
	        }
	        
//			if(reloadFile != null && !reloadFile.getOriginalFilename().isBlank()) {
//	            // 파일 저장 처리
//				Map<String, String> fileInfo = fileUtil.saveFile(reloadFile, session, "notice");
//
//	            // 저장된 파일 정보 설정
//				notice.setNoticeFileName(fileInfo.get("nFilename"));
//				notice.setNoticeFileRename(fileInfo.get("nFileRename"));
//				notice.setNoticeFilePath(fileInfo.get("nFilepath"));
//			}
	        
			// 📌 4. 최종 저장될 Notice 객체 확인
			System.out.println("📝 최종 notice 객체: " + notice);
	        
	        // 공지사항 수정 처리
			int result = nService.updateNotice(notice);
			return "redirect:/notice/detail/"+notice.getNoticeNo();
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMsg", e.getMessage());
			return "common/error";
		}
	}
	
	
	
}
