package com.house.jachui.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.house.jachui.member.controller.dto.UpdateRequest;
import com.house.jachui.member.model.vo.Member;


@Mapper
public interface MemberMapper {

	int memberSignupJachui(Member member);

	int memberSignupRealtor(Member member);

	int selectFindId(Member member);

	int updateResetPw(Member member);

	List<Member> selectFoundId(Member member);

	int deleteMember(String userId);

	String selectPassword(String userId);

	int updateMember(UpdateRequest member);

}
