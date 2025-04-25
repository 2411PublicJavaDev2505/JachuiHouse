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


	@Override
	public void deleteEstate(int estateNo) {
		estMapper.deleteEstate(estateNo);		
	}


	@Override
	public List<Estate> searchEstatesByAddress(String keyword) {
		return estMapper.searchByAddress("%" + keyword + "%");
	}


	@Override
	public int updateEstate(Estate estate, List<MultipartFile> newImages, List<Integer> optionCodes, List<Integer> deleteImageIds, HttpSession session) throws IOException {
	    // 1. 매물 기본 정보 업데이트
	    int result = estMapper.updateEstate(estate);

	    // 2. 기존 옵션 삭제 후 재등록
	    optionMapper.deleteEstateOptions(estate.getEstateNo());
	    if (optionCodes != null && !optionCodes.isEmpty()) {
	        for (Integer code : optionCodes) {
	        	optionMapper.insertEstateOption(estate.getEstateNo(), code);
	        }
	    }

	    // 3. 삭제할 이미지가 있다면 삭제
	    if (deleteImageIds != null && !deleteImageIds.isEmpty()) {
	    	estFileService.deleteImageByIdList(deleteImageIds);
	    }

	    // 4. 새 이미지가 있다면 저장
	    if (newImages != null && !newImages.isEmpty()) {
	    	estFileService.saveNewImages(estate.getEstateNo(), newImages);
	    }

	    return result;
	}


	@Override
	public String selectIdByEstateNo(int estateNo) {
		return estMapper.selectIdByEstateNo(estateNo);
	}

	@Override
	public int updateEstate(Estate estate, List<MultipartFile> images, List<Integer> optionCodes, HttpSession session) {
		// TODO Auto-generated method stub
		return 0;
	}
}
