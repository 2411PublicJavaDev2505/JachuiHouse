package com.house.jachui.estate.model.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.estate.controller.dto.EstateAddRequest;
import com.house.jachui.estate.controller.dto.OptionAddrequest;
import com.house.jachui.estate.model.vo.Estate;

public interface EstateService {

	List<Estate> getEstateList();

	Estate selectOneByNo(int estateNo);

	int insertEstate(EstateAddRequest estate, MultipartFile images, OptionAddrequest options) throws IllegalStateException, IOException;

}
