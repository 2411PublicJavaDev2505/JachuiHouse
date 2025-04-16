package com.house.jachui.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	int memberSignupJachui(Member member);

	int memberSignupRealtor(Member member);

	int selectFindId(Member member);
	
	int updateResetPw(Member member);
	
	int updateMember(UpdateRequest member);
	
	int deleteMember(String userId);

	String selectPassword(String userId);

	List<Member> selectFoundId(Member member);

	Member selectOneByLogin(MemberLoginRequest member);
	
	Member selectRealtorById(String userId);

	// 뭔가이상해
	int insertMember(Member member);

}