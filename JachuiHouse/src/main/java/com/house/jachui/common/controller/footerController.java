package com.house.jachui.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class footerController {
	
	@GetMapping("/info")
	public String showInfo() {
		return "company/info";
	}
	
	@GetMapping("/terms")
	public String showTerms() {
		return "company/terms";
	}
	
	@GetMapping("/location")
	public String showLocation() {
		return "company/location";
	}
	
	@GetMapping("/ad")
	public String showAd() {
		return "company/ad";
	}
	
	// 확인하고 다 하면 이거 지우기 (에러페이지임)
	@GetMapping("/error")
	public String error() {
		return "common/error";
	}

}
