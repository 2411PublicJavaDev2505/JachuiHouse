package com.house.jachui.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/footer")
public class footerController {
	
	@GetMapping("/info")
	public String showInfo() {
		return "footer/info";
	}
	
	@GetMapping("/terms")
	public String showTerms() {
		return "footer/terms";
	}
	
	@GetMapping("/location")
	public String showLocation() {
		return "footer/location";
	}
	
	@GetMapping("/ad")
	public String showAd() {
		return "footer/ad";
	}

}
