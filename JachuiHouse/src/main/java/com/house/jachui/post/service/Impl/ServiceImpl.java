package com.house.jachui.post.service.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.post.controller.dto.PostInsertRequest;
import com.house.jachui.post.domain.PostVO;
import com.house.jachui.post.mapper.PostMapper;
import com.house.jachui.post.service.PostService;

@Service
public class ServiceImpl implements PostService{
	
	private PostMapper pMapper;
	private SqlSession session;
	
	@Autowired
	public void MemberServiceLogic(PostMapper pMapper, SqlSession session) {
		this.pMapper = pMapper;
		this.session = session;
	}
	//게시글 전체 조회
	@Override
	public List<PostVO> selectList() {
		List<PostVO> pList = pMapper.selectList(session);
		return pList;
	}
	//게시글 작성
	@Override
	public int insertPost(PostInsertRequest post) {
		int result = pMapper.insertPost(session, post);
		return result;
	}

	
}
