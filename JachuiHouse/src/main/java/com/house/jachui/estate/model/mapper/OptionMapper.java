package com.house.jachui.estate.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.house.jachui.estate.controller.dto.OptionAddrequest;
import com.house.jachui.estate.model.vo.EstateOption;

@Mapper
public interface OptionMapper {


	List<EstateOption> selectAllOptions();

	List<EstateOption> selectOptionList(int estateNo);

	List<Integer> getOptionCodesByEstateNo(int estateNo);

	void deleteOptionByEstateNo(int estateNo);

	void insertOptionCode(int estateNo, Integer optionNo);

	int insertOptionList(@Param("estateNo") int estateNo, @Param("optionNo") int optionNo);
}
