package com.house.jachui.notice.model.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.notice.model.service.NoticeService;
import com.house.jachui.notice.model.store.NoticeMapper;
import com.house.jachui.notice.model.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeMapper mapper;

	@Override
	public List<NoticeVO> selectListAll(int noticeNo) {
		return mapper.selectListAll(noticeNo);
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	@Override
	public int addNotice(NoticeAddRequest notice) {
		return mapper.addNotice(notice);
	}

}
