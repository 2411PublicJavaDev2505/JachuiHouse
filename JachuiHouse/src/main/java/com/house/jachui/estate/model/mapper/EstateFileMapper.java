package com.house.jachui.estate.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.estate.model.vo.EstateFile;

@Mapper
public interface EstateFileMapper {


	List<EstateFile> selectImageList(int estateNo);


	void insertEstateImage(EstateFile file);


	void deleteFilesByEstateNo(int estateNo);


}
