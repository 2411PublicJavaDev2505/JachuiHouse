package com.house.jachui.member.store.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.house.jachui.member.store.MemberStore;
import com.house.jachui.member.vo.MemberVO;

@Repository
public class MemberStoreLogic implements MemberStore{

	@Override
	public int memberSignupJachui(SqlSession session, MemberVO member) {
		int result = session.insert("MemberMapper.insertMember", member);
		return result;
	}

}
