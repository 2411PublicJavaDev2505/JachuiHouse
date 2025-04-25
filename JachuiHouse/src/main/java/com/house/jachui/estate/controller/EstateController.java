package com.house.jachui.estate.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

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
import com.house.jachui.estate.model.mapper.EstateFileMapper;
import com.house.jachui.estate.model.mapper.OptionMapper;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.estate.model.vo.EstateFile;
import com.house.jachui.estate.model.vo.EstateOption;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chazabang")
public class EstateController {
	
	  private final EstateService estService;
	  private final EstateFileMapper fileMapper;
	  private final OptionMapper oMapper;

    @GetMapping("/list")
    public String showEstateList(@RequestParam(value = "keyword", required = false) String keyword,
            Model model) {
				List<Estate> estList;
				if (keyword != null && !keyword.trim().isEmpty()) {
				estList = estService.searchEstatesByAddress(keyword);
				} else {
				estList = estService.getEstateList();
				}

        for (Estate est : estList) {
            List<EstateFile> fileList = fileMapper.selectImageList(est.getEstateNo());
            est.setEstateFileList(fileList);
        }
        model.addAttribute("estList", estList);
        model.addAttribute("keyword", keyword);
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
	
	@GetMapping("/delete/{estateNo}")
	public String DeleteEstateByNo(@PathVariable("estateNo") int estateNo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
	    Estate estate = estService.selectOneByNo(estateNo);
	    if (estate != null && userId.equals(estate.getUserId())) {
	    	fileMapper.deleteFilesByEstateNo(estateNo);
	    	oMapper.deleteOptionByEstateNo(estateNo);
	        estService.deleteEstate(estateNo);
	    }
	    return "redirect:/chazabang/deletecomplete";
	}
	@GetMapping("/deletecomplete")
	public String DeleteComplete() {
		return "estate/deleteComplete";
	}
	
	@GetMapping("/modify/{estateNo}")
	public String showEstateUpdateForm(@PathVariable("estateNo") int estateNo, Model model) {
	    Estate estate = estService.selectOneByNo(estateNo);
	    model.addAttribute("estate", estate);
	    List<EstateFile> estateImageList = fileMapper.selectImageList(estateNo);
	    model.addAttribute("estateImageList", estateImageList);
	    return "estate/update";
	}

	@PostMapping("/update")
	public String updateEstate(@ModelAttribute Estate  estate,
	                           @RequestParam(value = "optionCodes", required = false) List<Integer> optionCodes,
	                           @RequestParam("images") List<MultipartFile> images,
	                           HttpSession session,
	                           Model model) throws IOException {
	    String userId = (String) session.getAttribute("userId");
	    estate.setUserId(userId);
	    
	    int result = estService.updateEstate(estate, images, optionCodes, session);
	    
	    return "redirect:/chazabang/detail/" + estate.getEstateNo();
	}

}
