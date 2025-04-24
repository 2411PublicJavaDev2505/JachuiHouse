package com.house.jachui.post.controller;

import java.util.List;

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
	
	@Autowired
	private PostService pService;
	
	@GetMapping("/list")//게시글 전체 정보 조회
	public String showPostList(Model model) {
		try {
			List<PostVO> pList = pService.selectList();
			model.addAttribute("pList", pList);
		return "post/list";
		} catch (Exception e) {
			// TODO: handle exception
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
			return "/post/update";
	
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
	
	@PostMapping("/cinsert")//댓글 작성 (POST)
	public String insertComment(Model model,
			@ModelAttribute CommentInsertRequest comment) {
		try {
			System.out.println("확인");
			System.out.println(comment);
			int result = pService.insertcomment(comment);
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
	
}
