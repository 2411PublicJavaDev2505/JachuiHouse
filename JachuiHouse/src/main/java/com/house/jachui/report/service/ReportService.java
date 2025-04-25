package com.house.jachui.report.service;


import com.house.jachui.report.controller.dto.CreportInsertRequest;
import com.house.jachui.report.controller.dto.PreportInsertRequest;


public interface ReportService {
	//댓글 신고
	int reportcInsert(CreportInsertRequest report);
	//게시글 신고
	int reportpInsert(PreportInsertRequest report);

}
