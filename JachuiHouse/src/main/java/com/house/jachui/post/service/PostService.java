package com.house.jachui.post.service;

import java.util.List;

import com.house.jachui.post.controller.dto.CommentInsertRequest;
import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.CommentVO;
import com.house.jachui.post.domain.PostVO;

public interface PostService {

	List<PostVO> selectList();//게시글 전체 조회

	int insertPost(PostInsertRequest post);//게시글 작성

	PostVO selectOneDetail(int postNo);// 게시글 상세 조회//댓글조회

	int deletePost(int postNo);//게시글 삭제

	PostVO updateOneDetail(int postNo);//게시글 수정 GET

	int postUpdate(PostInsertRequest post);//게시글 수정 POST
	
	int insertcomment(CommentInsertRequest comment);//댓글 작성

	List<CommentVO> selectcList(); //댓글 조회

	int deleteComment(int commentNo);//댓글 삭제








}
	
	

