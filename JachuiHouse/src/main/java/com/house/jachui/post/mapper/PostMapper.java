package com.house.jachui.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.PostVO;

@Mapper
public interface PostMapper {

	List<PostVO> selectList(SqlSession session); //게시글 전체 조회

	int insertPost(SqlSession session, PostInsertRequest post);//게시글 작성

}
