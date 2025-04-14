package com.house.jachui.member.service;

import java.util.List;

import com.house.jachui.member.vo.MemberVO;

public interface MemberService {

	// 자취생 회원가입
	int memberSignupJachui(MemberVO member);

	
	//List<MemberVO> findIds(MemberVO member);

	// 공인중개사 회원가입
	int memberSignupRealtor(MemberVO member);

	// 아이디찾기
	int selectFindId(MemberVO member);

	// 비밀번호 재설정
	int updateResetPw(MemberVO member);

	// 아이디찾기결과
	List<MemberVO> selectFoundId(MemberVO member);



}
