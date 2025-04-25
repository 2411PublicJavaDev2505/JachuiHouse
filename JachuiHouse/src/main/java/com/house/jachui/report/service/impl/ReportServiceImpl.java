package com.house.jachui.report.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.report.controller.dto.CreportInsertRequest;
import com.house.jachui.report.controller.dto.PreportInsertRequest;
import com.house.jachui.report.mapper.ReportMapper;
import com.house.jachui.report.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService{
	
	private ReportMapper rMapper;
	
	@Autowired
	public ReportServiceImpl(ReportMapper rMapper) {
		this.rMapper = rMapper;
	}
	
	@Override
	public int reportcInsert(CreportInsertRequest report) {
		int result = rMapper.reportcInsert(report);
		return result;
	}
	@Override
	public int reportpInsert(PreportInsertRequest report) {
		int result = rMapper.reportpInsert(report);
		return result;
	}

}
