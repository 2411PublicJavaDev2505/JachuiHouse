package com.house.jachui.member.store.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.house.jachui.member.store.MemberStore;
import com.house.jachui.member.vo.MemberVO;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public int memberSignupJachui(SqlSession session, MemberVO member) {
		int result = session.insert("MemberMapper.memberSignupJachui", member);
		return result;
	}

	@Override
	public List<MemberVO> findIds(SqlSession session, MemberVO member) {
		List<MemberVO> result = session.selectList("MemberMapper.findIds", member);
		return result;
	}

}
