package com.house.jachui.member.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.member.mapper.MemberMapper;
import com.house.jachui.member.service.MemberService;
import com.house.jachui.member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberMapper mMapper;
	
	@Override
	public int memberSignupJachui(MemberVO member) {
		int result = mMapper.memberSignupJachui(member);
		return result;
	}

	@Override
	public int memberSignupRealtor(MemberVO member) {
		int result = mMapper.memberSignupRealtor(member);
		return result;
	}

	@Override
	public int selectFindId(MemberVO member) {
		int result = mMapper.selectFindId(member);
		return result;
	}

	@Override
	public int updateResetPw(MemberVO member) {
		int result = mMapper.updateResetPw(member);
		return result;
	}

	@Override
	public List<MemberVO> selectFoundId(MemberVO member) {
		List<MemberVO> result = mMapper.selectFoundId(member);
		return result;
	}

}
