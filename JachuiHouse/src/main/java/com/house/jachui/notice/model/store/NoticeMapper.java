package com.house.jachui.notice.model.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.house.jachui.notice.controller.dto.NoticeAddRequest;
import com.house.jachui.notice.controller.dto.NoticeModifyRequest;
import com.house.jachui.notice.model.vo.NoticeVO;

@Mapper
public interface NoticeMapper {

	List<NoticeVO> selectListAll(RowBounds rowBounds);

	int getTotalCount();

	int addNotice(NoticeAddRequest notice);

	NoticeVO selectOneByNo(int noticeNo);

	int deleteNotice(int noticeNo);

	int updateNotice(NoticeModifyRequest notice);

	int getTotalCountByKeyword(@Param("searchKeyword") String searchKeyword);

	List<NoticeVO> selectSearchList(@Param("searchKeyword") String searchKeyword, @Param("currentPage") int currentPage,  RowBounds rowBounds);

}
