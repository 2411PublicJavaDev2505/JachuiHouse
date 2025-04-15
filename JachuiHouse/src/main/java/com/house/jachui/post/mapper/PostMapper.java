package com.house.jachui.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.house.jachui.post.controller.dto.CommentInsertRequest;
import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.PostVO;

@Mapper
public interface PostMapper {

	List<PostVO> selectList(); //게시글 전체 조회

	int insertPost(PostInsertRequest post);//게시글 작성

	PostVO selectOneDetail(int postNo);//게시글 상세 조회

	int deletePost(int postNo);//게시글 삭제

	int insertComment(CommentInsertRequest comment);//댓글 등록

}
