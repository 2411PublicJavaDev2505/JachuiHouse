package com.house.jachui.post.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.PostVO;
import com.house.jachui.post.service.PostService;

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
	public String insertPost(Model model,
			@ModelAttribute PostInsertRequest post) {
		try {
			System.out.println(post);
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
	
	@GetMapping("/detail")//게시글 상세 조회
	public String showPostDetail(Model model,
			@RequestParam("postNo") int postNo) {
		try {
			PostVO result = pService.selectOneDetail(postNo);
			if(result != null) {
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
}
