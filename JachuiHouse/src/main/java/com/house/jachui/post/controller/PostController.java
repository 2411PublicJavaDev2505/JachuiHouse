package com.house.jachui.post.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.house.jachui.common.FileUtil;
import com.house.jachui.common.PageUtil;
import com.house.jachui.post.controller.dto.CommentInsertRequest;
import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.CommentVO;
import com.house.jachui.post.domain.PostVO;
import com.house.jachui.post.service.PostService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/post")
public class PostController {
	
	private final PostService pService;
    private final PageUtil page;
    private final FileUtil file;
	private String toTalCount;
	private List<PostVO> searchList;
	
	@GetMapping("/list")//게시글 전체 정보 조회
	public String showPostList(
			@RequestParam(value="page", defaultValue="1") int currentPage,
			Model model) {
		try {
			List<PostVO> pList = pService.selectList(currentPage);
			int totalCount = pService.getTotalCount();
			Map<String, Integer> pageInfo = PageUtil.generatePageInfo(totalCount, currentPage, 8);
			if(!pList.isEmpty()) {
				model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("pList", pList);
				return "post/list";
			}else {
				model.addAttribute("errorMessage", "데이터가 존재하지 않습니다.");
				return "common/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error.jsp";
		}
	}
	
	@GetMapping("/insert")//게시글 작성 (GET)
	public String showInsertPost(Model model) {
		try {
			return "post/insert";
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
	
	@PostMapping("/insert")//게시글 작성 (POST)
	public String insertPost(HttpSession session, Model model,
			@ModelAttribute PostInsertRequest post) {
		try {
			
			String userId = (String)session.getAttribute("userId");
			post.setUserId(userId);
			int result = pService.insertPost(post);
			if(result > 0) {
				return "redirect:/post/list";
			}else {
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
	
	@GetMapping("/detail")//게시글 상세 조회//댓글조회
	public String showPostDetail(Model model,
			@RequestParam("postNo") int postNo) {
		try {
			PostVO result = pService.selectOneDetail(postNo);
			
			if(result != null) {
				List<CommentVO> cList = pService.selectcList();
				model.addAttribute("cList", cList);
				model.addAttribute("result", result);
				return "post/detail";
			}else {
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
	
	@GetMapping("/delete")//게시글 삭제
	public String deletePost(Model model, 
			@RequestParam("postNo") int postNo) {
		try {
			int result = pService.deletePost(postNo);
			if(result > 0) {
				return "redirect:/post/list";
			}else {
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}

	@GetMapping("/update")//게시글 수정하기 GET
	public String showPostUpdate(Model model,
			@RequestParam(value = "postNo", required = false) Integer postNo) {
		
			PostVO post = pService.updateOneDetail(postNo);
			model.addAttribute("result", post);
			return "post/update";
	
	}
	
	@PostMapping("/update")//게시글 수정하기 POST
	public String postUpdate(Model model,
			@ModelAttribute PostInsertRequest post) {
		try {
			int result = pService.postUpdate(post);
			if(result > 0) {
				return "redirect:/post/detail?postNo="+post.getPostNo();
			}else {
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
	
	
	
	@ResponseBody
	@GetMapping("/cList")//댓글 조회
	public List<CommentVO> showCommentList(Model model) {
		return pService.selectcList();
//		try {
//			List<CommentVO> cList = pService.selectcList();
//			model.addAttribute("cList", cList);
//			return "post/detail";
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//			model.addAttribute("errorMessage", e.getMessage());
//			return "common/error.jsp";
//		}
	}
	@ResponseBody
	@PostMapping("/cinsert")
	public String insertComment(Model model, @ModelAttribute CommentInsertRequest comment) {
	    try {
	        System.out.println(comment);
	        if (comment.getCommentContent().length() == 0) {
	            return "fail"; // 실패
	        }

	        int result = pService.insertcomment(comment);
	        if (result > 0) {
	            return "success"; //  성공시 success 문자열만
	        } else {
	            return "fail";
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("errorMessage", e.getMessage());
	        return "fail";
	    }
	}
	
	@GetMapping("/cdelete")//댓글 삭제
	public String deleteComment(Model model, 
			@ModelAttribute CommentInsertRequest comment) {
		try {
			int result = pService.deleteComment(comment.getCommentNo());
			if(result > 0) {
				return "redirect:/post/detail?postNo="+comment.getPostNo();
			}else {
				return "common/error";
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			model.addAttribute("errorMessage", e.getMessage());
			return "common/error";
		}
	}
	
	@GetMapping("/search")
	public String postSearch(Model model,
			@RequestParam("searchKeyword") String searchKeyword,
	        @RequestParam("category") String category,
	        @RequestParam(value="page", defaultValue="1") int currentPage) {
			
		try {
			int totalCount = pService.getTotalCount(searchKeyword, category);
			List<PostVO> searchList = pService.searchListByKeyword(searchKeyword, category, currentPage);
			
			if(searchList == null || searchList.isEmpty()) {
				model.addAttribute("searchList", null);
				model.addAttribute("errorMessage", "검색 결과가 없습니다.");
			}else {
				Map<String, Integer> pageInfo = page.generatePageInfo(totalCount, currentPage, 8);
				model.addAttribute("maxPage", pageInfo.get("maxPage"));
				model.addAttribute("startNavi", pageInfo.get("startNavi"));
				model.addAttribute("endNavi", pageInfo.get("endNavi"));
				
				model.addAttribute("searchList", searchList);
			}
			
			model.addAttribute("searchKeyword", searchKeyword);
			model.addAttribute("category", category);
			model.addAttribute("currentPage", currentPage);
			
			return "post/search";
			
		} catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "검색 중 오류 발생: " + e.getMessage());
            return "common/error";

		}
	}
	
	//관리자가 비번 없이 게시글 삭제 - 근데 post가 원래 없었는데 가능한가?
	@PostMapping("/delete-by-admin")
	@ResponseBody
	public String deletePost(@RequestParam("postNo") int postNo) {
		int result = pService.deletePost(postNo);
		return (result>0) ? "sucess" : "fail";
	}
	
	//관리자가 비번 없이 댓글 삭제
	@PostMapping("/cdelete-by-admin")
	@ResponseBody
	public String deleteComment(@RequestParam("commentNo") int commentNo) {
		int result = pService.deleteComment(commentNo);
		return (result>0) ? "sucess" : "fail";
	}
	
}
