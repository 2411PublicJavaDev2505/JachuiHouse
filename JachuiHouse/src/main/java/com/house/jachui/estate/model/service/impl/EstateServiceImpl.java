package com.house.jachui.estate.model.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

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

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EstateServiceImpl implements EstateService {

    private final EstateMapper estMapper;
    private final SqlSession session;
	
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
	public int insertEstate(EstateAddRequest estate, MultipartFile images, OptionAddrequest options) throws IllegalStateException, IOException {
		int result = estMapper.insertEstate(estate);
		if(result == 0) 
		return 0;
		
		int estateNo = estate.getEstateNo();
		
		if(images.getSize() > 0) {
			EstateFile file = new EstateFile();
			file.setEstateFilePath(webPath);
			file.setEstateNo(estateNo);
			file.setEstateFileOrder(0);
			
			String fileName = file.getEstateFileName();
			String fileRename = FileUtil.fileRename(fileName);
			file.setEstateFileName(fileName);
			file.setEstateFileRename(fileRename);
			result = estMapper.insertEstateFile(file);
			images.transferTo(new File(folderPath+file.getEstateFileRename()));
		}
		return result;
	}
}
