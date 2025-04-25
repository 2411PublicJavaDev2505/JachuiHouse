package com.house.jachui.estate.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.estate.controller.dto.EstateAddRequest;
import com.house.jachui.estate.controller.dto.OptionAddrequest;
import com.house.jachui.estate.model.vo.Estate;

import jakarta.servlet.http.HttpSession;

public interface EstateService {

	List<Estate> getEstateList();

	Estate selectOneByNo(int estateNo);

	int insertEstate(EstateAddRequest estate, List<MultipartFile> images, List<Integer> optionCodes, HttpSession session) throws IllegalStateException, IOException;

	void deleteEstate(int estateNo);

	List<Estate> searchEstatesByAddress(String keyword);


	String selectIdByEstateNo(int estateNo);

	int updateEstate(Estate estate, List<MultipartFile> newImages, List<Integer> optionCodes,
			List<Integer> deleteImageIds, HttpSession session) throws IOException;

	int updateEstate(Estate estate, List<MultipartFile> images, List<Integer> optionCodes, HttpSession session);

}
