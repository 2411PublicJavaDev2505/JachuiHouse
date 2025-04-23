package com.house.jachui.estate.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.house.jachui.estate.model.service.ImageService;
import com.house.jachui.estate.model.vo.EstateFile;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ImageController {
	
	private final ImageService iService;

	@GetMapping("/file/list")
	public List<EstateFile> showImages(int estateNo) {
		return iService.selectImageList(estateNo);
				
	}
}
