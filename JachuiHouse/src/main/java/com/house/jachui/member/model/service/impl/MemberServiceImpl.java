package com.house.jachui.member.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.model.mapper.MemberMapper;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;

@Service
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

}