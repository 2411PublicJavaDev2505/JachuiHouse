package com.house.jachui.report.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.report.controller.dto.ReportInsertRequest;

@Mapper
public interface ReportMapper {

	int reportcInsert(ReportInsertRequest report);

}
