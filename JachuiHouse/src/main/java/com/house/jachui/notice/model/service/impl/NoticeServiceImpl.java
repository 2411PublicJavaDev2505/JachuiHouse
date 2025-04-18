package com.house.jachui.notice.model.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.notice.controller.dto.NoticeModifyRequest;
import com.house.jachui.notice.model.service.NoticeService;
import com.house.jachui.notice.model.store.NoticeMapper;
import com.house.jachui.notice.model.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeMapper mapper;

	@Override
	public List<NoticeVO> selectListAll(int currentPage) {
		int limit = 10;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mapper.selectListAll(rowBounds);
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	@Override
	public int addNotice(NoticeAddRequest notice) {
		return mapper.addNotice(notice);
	}

	@Override
	public NoticeVO selectOneByNo(int noticeNo) {
		return mapper.selectOneByNo(noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return mapper.deleteNotice(noticeNo);
	}

	@Override
	public int updateNotice(NoticeModifyRequest notice) {
		return mapper.updateNotice(notice);
	}

	@Override
	public int getTotalCount(String searchKeyword) {
		return mapper.getTotalCount(searchKeyword);
	}

	@Override
	public List<NoticeVO> searchListByKeyword(String searchKeyword, int currentPage) {
		return mapper.selectSearchList(searchKeyword, currentPage);
	}

}
