package com.house.jachui.estate.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.estate.model.vo.EstateOption;

@Mapper
public interface OptionMapper {

	List<EstateOption> selectOptionList(int estateNo);

}
