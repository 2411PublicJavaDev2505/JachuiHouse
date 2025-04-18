package com.house.jachui.estate.model.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.estate.model.vo.EstateFile;

@Mapper
public interface EstateFileMapper {

	void insertEstateFile(EstateFile estateFile);

}
