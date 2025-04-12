package com.house.jachui.member.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.member.service.MemberService;
import com.house.jachui.member.store.MemberStore;
import com.house.jachui.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberStore mStore;
	@Autowired
	private SqlSession session;
	
	@Override
	public int memberSignupJachui(MemberVO member) {
		int result = mStore.memberSignupJachui(session, member);
		return result;
	}

}
