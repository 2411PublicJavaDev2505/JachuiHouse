package com.house.jachui.estate.model.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

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
}
