package com.house.jachui.estate.model.service.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.common.FileUtil;
import com.house.jachui.estate.controller.dto.EstateAddRequest;
import com.house.jachui.estate.controller.dto.OptionAddrequest;
import com.house.jachui.estate.model.mapper.EstateFileMapper;
import com.house.jachui.estate.model.mapper.EstateMapper;
import com.house.jachui.estate.model.mapper.OptionMapper;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.estate.model.service.ImageService;
import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.estate.model.vo.EstateFile;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EstateServiceImpl implements EstateService {

    private final EstateMapper estMapper;
    private final OptionMapper optionMapper;
    private final EstateFileMapper estFileMapper;
    private final ImageService estFileService;
    private final SqlSession session;
	
    @Override
    public List<Estate> getEstateList() {
        List<Estate> list = estMapper.selectEstateList();
        for (Estate estate : list) {
            estate.setTransformPrices();
        }
        return list;
    }

    
    @Override
    public Estate selectOneByNo(int estateNo) {
    	Estate estate = estMapper.selectOneByNo(estateNo);
    	 estate.setTransformPrices();
    	return estate;
    }
    
    @Transactional
    @Override
    public int insertEstate(EstateAddRequest estate,
    						List<MultipartFile> images,
					        List<Integer> optionCodes,
					        HttpSession session
    ) throws IOException, IllegalStateException {
        
        int result = estMapper.insertEstate(estate);
        int estateNo = estate.getEstateNo();

        estFileService.saveEstateImages(estateNo, images);
        
        for(int i=0;i< optionCodes.size();i++) {
        	result += optionMapper.insertOptionList(estateNo, optionCodes.get(i));
        }

        return estateNo;
    }
}
