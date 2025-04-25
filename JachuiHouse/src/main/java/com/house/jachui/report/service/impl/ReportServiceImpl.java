package com.house.jachui.report.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.report.controller.dto.ReportInsertRequest;
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
	public int reportcInsert(ReportInsertRequest report) {
		int result = rMapper.reportcInsert(report);
		return result;
	}

}
