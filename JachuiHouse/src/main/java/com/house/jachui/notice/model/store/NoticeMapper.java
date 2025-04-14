package com.house.jachui.notice.model.store;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.notice.model.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	List<NoticeVO> selectListAll(int noticeNo);

	int getTotalCount();

	int addNotice(NoticeAddRequest notice);

}
