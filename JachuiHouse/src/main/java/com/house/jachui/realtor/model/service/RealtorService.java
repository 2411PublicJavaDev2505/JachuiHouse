package com.house.jachui.realtor.model.service;

import java.util.List;

import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.realtor.controller.dto.UpdateRealtorRequest;

public interface RealtorService {

    // 자취생/공인중개사 상세 조회 (마이페이지용)
    Member selectRealtorById(String userId);
    
	int updateRealtor(UpdateRealtorRequest realtor);


	int getTotalCount(String userId);

	List<Estate> selectEstatesById(String userId, int currentPage, int i);
	int updateProfileImage(String userId, String newFileName);
}
