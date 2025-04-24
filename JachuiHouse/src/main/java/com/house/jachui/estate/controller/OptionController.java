package com.house.jachui.estate.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.house.jachui.estate.model.service.OptionService;
import com.house.jachui.estate.model.vo.EstateOption;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class OptionController {

	private final OptionService oService;
	
	@GetMapping("/option/list")
	public List<EstateOption> selectOptionList(int estateNo) {
		return oService.selectOptionList(estateNo);
	}
}
