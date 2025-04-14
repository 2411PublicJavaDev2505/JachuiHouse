package com.house.jachui.member.service;

import java.util.List;

import com.house.jachui.member.vo.MemberVO;

public interface MemberService {

	int memberSignupJachui(MemberVO member);

	List<MemberVO> findIds(MemberVO member);

	int memberSignupRealtor(MemberVO member);

	int selectFindId(MemberVO member);

	int updateResetPw(MemberVO member);



}
