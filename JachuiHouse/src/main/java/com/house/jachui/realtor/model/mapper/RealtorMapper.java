package com.house.jachui.realtor.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.estate.model.vo.Estate;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.realtor.controller.dto.UpdateRealtorRequest;

@Mapper
public interface RealtorMapper {

	Member selectRealtorById(String userId);

	int updateRealtor(UpdateRealtorRequest realtor);

	List<Estate> selectEstatesById(String userId);

	int getTotalCount();

}
