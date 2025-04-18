package com.house.jachui.estate.model.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    
    @Transactional
    @Override
    public int insertEstate(EstateAddRequest estate,
    						List<MultipartFile> images,
					        List<Integer> optionCodes,
					        HttpSession session
    ) throws IOException, IllegalStateException {
        
        int result = estMapper.insertEstate(estate);
        int estateNo = estate.getEstateNo();
        System.out.println(estateNo);

        if (images != null) {
            for (MultipartFile file : images) {
                Map<String, String> saved = fileutil.saveFile(file, session, "estate");
                EstateFile estateFile = new EstateFile();
                estateFile.setEstateNo(estateNo);
                estateFile.setEstateFileName(saved.get("original"));
                estateFile.setEstateFileRename(saved.get("saved"));
                estateFile.setEstateFilePath(webPath); // 혹은 실제 URL
                estFileMapper.insertEstateFile(estateFile);
            }
        }
        for(int i=0;i< optionCodes.size();i++) {
        	result += optionMapper.insertOptionList(estateNo, optionCodes.get(i));
        }

        return estateNo;
    }
}
