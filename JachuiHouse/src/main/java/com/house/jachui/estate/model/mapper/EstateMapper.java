package com.house.jachui.estate.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.estate.controller.dto.EstateAddRequest;
import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.estate.model.vo.EstateFile;

@Mapper
public interface EstateMapper {

	List<Estate> selectEstateList();

	Estate selectOneByNo(int estateNo);

	int insertEstate(EstateAddRequest estate);

	void deleteEstate(int estateNo);

	List<Estate> searchByAddress(String string);

	int updateEstate(Estate estate);

	String selectIdByEstateNo(int estateNo);

	void deleteEstateOptions(int estateNo);

	void insertEstateOption(int estateNo, Integer code);

}
