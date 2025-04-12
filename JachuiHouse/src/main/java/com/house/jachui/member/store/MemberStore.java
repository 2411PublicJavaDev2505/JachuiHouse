package com.house.jachui.member.store;

import org.apache.ibatis.session.SqlSession;

import com.house.jachui.member.vo.MemberVO;

public interface MemberStore {

	int memberSignupJachui(SqlSession session, MemberVO member);

}
