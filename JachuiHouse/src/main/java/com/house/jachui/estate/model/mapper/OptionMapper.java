package com.house.jachui.estate.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.estate.controller.dto.OptionAddrequest;
import com.house.jachui.estate.model.vo.EstateOption;

@Mapper
public interface OptionMapper {

	List<EstateOption> selectOptionList(int estateNo);

	int insertOptionList (int estateNo, int optionCode );

	void deleteOptionByEstateNo(int estateNo);

	void insertOptionCode(int estateNo, Integer code);
}
