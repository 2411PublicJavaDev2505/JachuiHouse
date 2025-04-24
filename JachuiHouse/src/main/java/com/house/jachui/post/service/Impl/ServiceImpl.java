package com.house.jachui.post.service.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.post.controller.dto.CommentInsertRequest;
import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.CommentVO;
import com.house.jachui.post.domain.PostVO;
import com.house.jachui.post.mapper.PostMapper;
import com.house.jachui.post.service.PostService;

@Service
public class ServiceImpl implements PostService{
	
	private PostMapper pMapper;

	
	@Autowired
	public void MemberServiceLogic(PostMapper pMapper, SqlSession session) {
		this.pMapper = pMapper;

	}
	//게시글 전체 조회
	@Override
	public List<PostVO> selectList() {
		List<PostVO> pList = pMapper.selectList();
		return pList;
	}
	//게시글 작성
	@Override
	public int insertPost(PostInsertRequest post ) {
		int result = pMapper.insertPost(post);
		return result;
	}
	//게시글 상세 조회 //댓글조회
	@Override
	public PostVO selectOneDetail(int postNo) {
		PostVO result = pMapper.selectOneDetail(postNo);
		return result;
	}
	//게시글 삭제
	@Override
	public int deletePost(int postNo) {
		int result = pMapper.deletePost(postNo);
		return result;
	}
	//게시글 수정 GET
	@Override
	public PostVO updateOneDetail(int postNo) {
		PostVO result = pMapper.updateOneDetail(postNo);
		return result;
	}
	//게시글 수정 POST
	@Override
	public int postUpdate(PostInsertRequest post) {
		int result = pMapper.postUpdate(post);
		return result;
	}
	//댓글작성
	@Override
	public int insertcomment(CommentInsertRequest comment) {
		int result = pMapper.insertComment(comment);
		return result;
	}
	//댓글 조회
	@Override
	public List<CommentVO> selectcList() {
		List<CommentVO> cList = pMapper.selectcList();
		return cList;
	}
	//댓글 삭제
	@Override
	public int deleteComment(int commentNo) {
		int result = pMapper.deleteComment(commentNo);
		return result;
	}


	

	
}
