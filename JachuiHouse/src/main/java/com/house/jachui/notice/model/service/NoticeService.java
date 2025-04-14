package com.house.jachui.notice.model.service;

import java.util.List;

import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.notice.model.vo.NoticeVO;

public interface NoticeService {

	List<NoticeVO> selectListAll(int currentPage);

	int getTotalCount();

	int addNotice(NoticeAddRequest notice);

}
