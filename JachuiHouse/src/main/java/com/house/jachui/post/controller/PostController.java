package com.house.jachui.post.controller;

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
import com.house.jachui.member.service.MemberService;
import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.PostVO;
import com.house.jachui.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	private PostService pService;
	
	@Autowired
	public PostController(PostService pService) {
		this.pService = pService;

	}
	
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
	
	@GetMapping("/insert")
	public String showInsertPost() {
		return "post/insert";
	}
	
	@PostMapping("/insert")//게시글 작성
	public String insertPost(Model model,
			@ModelAttribute PostInsertRequest post) {
		try {
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
}
