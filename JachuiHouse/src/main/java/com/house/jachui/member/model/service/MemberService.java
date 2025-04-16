package com.house.jachui.member.model.service;

import java.util.List;

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.vo.Member;


public interface MemberService {

	// 자취생 회원가입
	int memberSignupJachui(Member member);

	
	//List<Member> findIds(Member member);

	// 공인중개사 회원가입
	int memberSignupRealtor(Member member);

	// 아이디찾기
	int selectFindId(Member member);

	// 비밀번호 재설정
	int updateResetPw(Member member);

	// 아이디찾기결과
	List<Member> selectFoundId(Member member);
	
	int updateMember(UpdateRequest member);

	int deleteMember(String userId);
	
	Member selectOneByLogin(MemberLoginRequest member);

	Member selectRealtorById(String userId);

	boolean checkPw(String userId, String userPw);
	
}