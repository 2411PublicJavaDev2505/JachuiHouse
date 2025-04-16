package com.house.jachui.member.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.mapper.MemberMapper;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mMapper;
	
	@Override
	public int memberSignupJachui(Member member) {
		int result = mMapper.memberSignupJachui(member);
		return result;
	}

	@Override
	public int memberSignupRealtor(Member member) {
		int result = mMapper.memberSignupRealtor(member);
		return result;
	}

	@Override
	public int selectFindId(Member member) {
		int result = mMapper.selectFindId(member);
		return result;
	}

	@Override
	public int updateResetPw(Member member) {
		int result = mMapper.updateResetPw(member);
		return result;
	}

	@Override
	public List<Member> selectFoundId(Member member) {
		List<Member> result = mMapper.selectFoundId(member);
		return result;
	}

	@Override
	public Member selectOneByLogin(MemberLoginRequest member) {
		Member result = mMapper.selectOneByLogin(member);
		return result;
	}

	/*
	 * @Override 
	 * public Member selectOneByLogin(MemberLoginRequest member) { 
	 * Member result = mMapper.MemberLoginRequest(member); 
	 * return null; }
	 */
	@Override
	public Member selectRealtorById(String userId) {
		Member result = mMapper.selectRealtorById(userId);
		return result;
	}
	
	// 회원탈퇴
	@Override
	public int deleteMember(String userId) {
		int result = mMapper.deleteMember(userId);
		return result;
	}
	@Override
	public boolean checkPw(String userId, String userPw) {
		String check = mMapper.selectPassword(userId);
		return check != null && check.equals(userPw);
	}

	@Override
	public int updateMember(UpdateRequest member) {
		int result = mMapper.updateMember(member);
		return result;
	}

	
	// 뭔가이상해
	@Override
	public boolean insertMember(Member member) {
		int result = mMapper.insertMember(member);
		return result > 0;
	}

}