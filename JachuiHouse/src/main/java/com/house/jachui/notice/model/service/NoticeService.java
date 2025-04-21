package com.house.jachui.notice.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.notice.controller.dto.NoticeModifyRequest;
import com.house.jachui.notice.model.vo.NoticeVO;

public interface NoticeService {

	List<NoticeVO> selectListAll(int currentPage);

	int getTotalCount();

	int addNotice(NoticeAddRequest notice);

	NoticeVO selectOneByNo(int noticeNo);

	int deleteNotice(int noticeNo);

	int updateNotice(NoticeModifyRequest notice);

	int getTotalCountByKeyword(@Param("searchKeyword")String searchKeyword);

	List<NoticeVO> searchListByKeyword(String searchKeyword, int currentPage);

}
