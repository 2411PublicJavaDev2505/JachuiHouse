package com.house.jachui.report.service;

import org.springframework.stereotype.Service;

import com.house.jachui.report.controller.dto.ReportInsertRequest;

@Service
public interface ReportService {

	int reportcInsert(ReportInsertRequest report);

}
