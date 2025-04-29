package com.house.jachui.report.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.report.controller.dto.CreportInsertRequest;
import com.house.jachui.report.controller.dto.PreportInsertRequest;
import com.house.jachui.report.mapper.ReportMapper;
import com.house.jachui.report.service.ReportService;
import com.house.jachui.report.vo.ReportVO;

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

	
	//신고관리 조회
	@Override
	public List<ReportVO> selectListAll(int currentPage) {
		int limit = 10;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return rMapper.selectListAll(rowBounds);
	}
	//신고관리 페이지네이션
	@Override
	public int getTotalCount() {
		return rMapper.getTotalCount();
	}
	//신고반려
	@Override
	public int deleteReport(String reportNo) {
		return rMapper.deleteReport(reportNo);
	}
	//신고관리 검색 페이지네이션
	@Override
	public int getTotalCountByKeyword(@Param("searchKeyword")String searchKeyword) {
		return rMapper.getTotalCountByKeyword(searchKeyword);
	}
	//신고관리 검색 
	@Override
	public List<ReportVO> searchListByKeyword(String searchKeyword, int currentPage) {
		int limit = 10;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return rMapper.selectSearchList(searchKeyword, currentPage, rowBounds);
	}

}
