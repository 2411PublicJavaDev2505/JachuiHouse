package com.house.jachui.report.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.report.controller.dto.CreportInsertRequest;
import com.house.jachui.report.controller.dto.PreportInsertRequest;

@Mapper
public interface ReportMapper {

	int reportcInsert(CreportInsertRequest report);

	int reportpInsert(PreportInsertRequest report);

}
