package com.house.jachui.estate.controller;

import java.io.IOException;
import java.util.List;

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

import com.house.jachui.estate.controller.dto.EstateAddRequest;
import com.house.jachui.estate.controller.dto.OptionAddrequest;
import com.house.jachui.estate.model.mapper.EstateFileMapper;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.estate.model.vo.EstateFile;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chazabang")
public class EstateController {
	
	  private final EstateService estService;
	  private final EstateFileMapper fileMapper;

    @GetMapping("/list")
    public String showEstateList(Model model) {
        List<Estate> estList = estService.getEstateList();
        model.addAttribute("estList", estList);
        return "estate/list";
    }
	
	
	@GetMapping("/detail/{estateNo}")
	public String showEstateDetail(@PathVariable("estateNo") int estateNo, Model model) {
		Estate estate = estService.selectOneByNo(estateNo);
		model.addAttribute("estate",estate);
		List<EstateFile> estateImageList = fileMapper.selectImageList(estateNo);
		model.addAttribute("estateImageList", estateImageList);
		return "estate/detail";
	}
	@GetMapping("/insert")
	public String showEstateInsertForm() {
		return "estate/insert";
	}
	@PostMapping("/insert")
	public String InsertEstate(
	    @ModelAttribute EstateAddRequest estate,
	    @RequestParam(value = "optionCodes", required = false) List<Integer> optionCodes,
	    @RequestParam("images") List<MultipartFile> images,
	    HttpSession session,
	    Model model
	) throws IOException {
	    String userId = (String) session.getAttribute("userId");
	    estate.setUserId(userId);
	    
	    int result = estService.insertEstate(estate, images, optionCodes, session);
	    
	    return "redirect:/chazabang/list";
	}
}
