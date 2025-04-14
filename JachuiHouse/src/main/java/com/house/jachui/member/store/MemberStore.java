package com.house.jachui.member.store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.house.jachui.member.vo.MemberVO;

public interface MemberStore {

	int memberSignupJachui(SqlSession session, MemberVO member);

	List<MemberVO> findIds(SqlSession session, MemberVO member);

}
