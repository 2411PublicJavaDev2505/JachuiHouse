package com.house.jachui.estate.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.estate.model.vo.Estate;

@Mapper
public interface EstateMapper {

	List<Estate> selectEstateList();

}
