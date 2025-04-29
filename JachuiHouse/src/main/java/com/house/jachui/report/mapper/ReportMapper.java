package com.house.jachui.report.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.house.jachui.report.controller.dto.CreportInsertRequest;
import com.house.jachui.report.controller.dto.PreportInsertRequest;
import com.house.jachui.report.vo.ReportVO;

@Mapper
public interface ReportMapper {

	int reportcInsert(CreportInsertRequest report);

	int reportpInsert(PreportInsertRequest report);

	//신고관리 조회
	List<ReportVO> selectListAll(RowBounds rowBounds);
	//신고관리 페이지네이션
	int getTotalCount();
	//신고반려
	int deleteReport(String reportNo);
	//신고관리 검색 페이지네이션
	int getTotalCountByKeyword(String searchKeyword);
	//신고관리 검색 
	List<ReportVO> selectSearchList(String searchKeyword, int currentPage, RowBounds rowBounds);

}
