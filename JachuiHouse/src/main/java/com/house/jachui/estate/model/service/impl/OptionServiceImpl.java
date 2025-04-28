package com.house.jachui.estate.model.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.house.jachui.estate.controller.dto.CheckedOption;
import com.house.jachui.estate.model.mapper.OptionMapper;
import com.house.jachui.estate.model.service.OptionService;
import com.house.jachui.estate.model.vo.EstateOption;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class OptionServiceImpl implements OptionService{
	
	private final OptionMapper oMapper;

	@Override
	public List<EstateOption> selectOptionList(int estateNo) {
		return oMapper.selectOptionList(estateNo);
	}

	@Override
	public List<CheckedOption> getOptionsWithCheck(int estateNo) {
		List<Integer> selectedCodes = oMapper.getOptionCodesByEstateNo(estateNo);
	    List<EstateOption> allOptions = oMapper.selectAllOptions();

	    return allOptions.stream()
	        .map(opt -> {
	        	CheckedOption dto = new CheckedOption();
	            dto.setOptionNo(opt.getOptionNo());
	            dto.setOptionName(opt.getOptionName());
	            dto.setOptionImg(opt.getOptionImg());
	            dto.setChecked(selectedCodes.contains(opt.getOptionNo()));
	            return dto;
	        })
	        .collect(Collectors.toList());
	}
}
