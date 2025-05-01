package com.house.jachui.realtor.model.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
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
	public int getTotalCount(String userId) {
		return rMapper.getChatTotalCount(userId);
	}

	@Override
	public List<Estate> selectEstatesById(String userId, int currentPage, int i) {
		int limit = 3;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return rMapper.selectEstatesById(userId, rowBounds);
	}

	@Override
	public int updateProfileImage(String userId, String newFileName) {
		return rMapper.updateProfileImage(userId, newFileName);
		
	}

}
