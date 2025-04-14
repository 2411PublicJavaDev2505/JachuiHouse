package com.house.jachui.estate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chazabang")
public class EstateController {
	
	

	@GetMapping("/list")
	public String showEstateList() {
		
		return "estate/list";
	}
	
	@GetMapping("/detail")
	public String showEstateDetail() {
		return "estate/detail";
	}
}
