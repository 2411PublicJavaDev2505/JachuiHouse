package com.house.jachui.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;

import com.house.jachui.post.controller.dto.CommentInsertRequest;
import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.CommentVO;
import com.house.jachui.post.domain.PostVO;


@Mapper
public interface PostMapper {

	List<PostVO> selectList(); //게시글 전체 조회

	int insertPost(PostInsertRequest post);//게시글 작성

	PostVO selectOneDetail(int postNo);//게시글 상세 조회//댓글조회

	int deletePost(int postNo);//게시글 삭제

	PostVO updateOneDetail(int postNo);//게시글 수정 GET

	int postUpdate(PostInsertRequest post);//게시글 수정 POST

	int insertComment(CommentInsertRequest comment);//댓글 작성

	List<CommentVO> selectcList();//댓글 조회

	int deleteComment(int commentNo);//댓글 삭제





}
