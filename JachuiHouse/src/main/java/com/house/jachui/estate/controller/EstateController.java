package com.house.jachui.estate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.estate.model.vo.Estate;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chazabang")
public class EstateController {
	
	  private final EstateService estService;

    @GetMapping("/list")
    public String showEstateList(Model model) {
        List<Estate> estList = estService.getEstateList();
        model.addAttribute("estList", estList);
        System.out.println(estList);
        return "estate/list";
    }
	
	
	@GetMapping("/detail/{estateNo}")
	public String showEstateDetail(@PathVariable("estateNo") int estateNo, Model model) {
		Estate estate = estService.selectOneByNo(estateNo);
		model.addAttribute("estate",estate);
		System.out.println(estate);
		return "estate/detail";
	}
}
