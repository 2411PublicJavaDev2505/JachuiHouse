package com.house.jachui.realtor.model.service.impl;

import java.util.List;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.member.model.mapper.MemberMapper;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.realtor.controller.dto.UpdateRealtorRequest;
import com.house.jachui.realtor.model.mapper.RealtorMapper;
import com.house.jachui.realtor.model.service.RealtorService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RealtorServiceImpl implements RealtorService{
	
	private final RealtorMapper rMapper;

	@Override
	public Member selectRealtorById(String userId) {
		return rMapper.selectRealtorById(userId);
	}

	@Override
	public int updateRealtor(UpdateRealtorRequest realtor) {
		int result = rMapper.updateRealtor(realtor);
		return result;
	}

	@Override
	public List<Estate> selectEstatesById(String userId, int currentPage) {
		return rMapper.selectEstatesById(userId);
	}

	@Override
	public int getTotalCount(String userId) {
		return rMapper.getTotalCount();
	}

}
