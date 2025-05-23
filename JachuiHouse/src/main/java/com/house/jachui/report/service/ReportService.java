package com.house.jachui.report.service;


import java.util.List;

import com.house.jachui.report.controller.dto.CreportInsertRequest;
import com.house.jachui.report.controller.dto.PreportInsertRequest;
import com.house.jachui.report.vo.ReportVO;


public interface ReportService {
	//댓글 신고
	int reportcInsert(CreportInsertRequest report);
	//게시글 신고
	int reportpInsert(PreportInsertRequest report);
	
	//신고관리 조회
	List<ReportVO> selectListAll(int currentPage);
	//신고관리 조회 페이지네이션
	int getTotalCount();
	//신고반려
	int deleteReport(String reportNo);
	//신고관리 검색 페이지네이션
	int getTotalCountByKeyword(String searchKeyword);
	//신고관리 검색 
	List<ReportVO> searchListByKeyword(String searchKeyword, int currentPage);

}
