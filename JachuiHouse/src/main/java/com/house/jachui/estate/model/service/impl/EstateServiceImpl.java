package com.house.jachui.estate.model.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.common.FileUtil;
import com.house.jachui.estate.controller.dto.EstateAddRequest;
import com.house.jachui.estate.controller.dto.OptionAddrequest;
import com.house.jachui.estate.model.mapper.EstateMapper;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.estate.model.vo.EstateFile;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EstateServiceImpl implements EstateService {

    private final EstateMapper estMapper;
    private final SqlSession session;
    private final FileUtil fileutil;
	
	private String webPath = "/images/estate/";
	private String folderPath = "C:/uploadImage/chazabang/";
    
    @Override
    public List<Estate> getEstateList() {
        return estMapper.selectEstateList();
    }
    
    @Override
    public Estate selectOneByNo(int estateNo) {
    	Estate estate = estMapper.selectOneByNo(estateNo);
    	return estate;
    }
    @Override
    public int insertEstate(EstateAddRequest estate,
    						List<MultipartFile> images,
					        List<Integer> optionCodes,
					        HttpSession session
    ) throws IOException, IllegalStateException {
        
        int result = estMapper.insertEstate(estate);
        int estateNo = estate.getEstateNo();

        if (images != null) {
            for (MultipartFile file : images) {
                Map<String, String> saved = fileutil.saveFile(file, session, "estate");
            }
        }
        return estateNo;
    }
}
