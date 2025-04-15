package com.house.jachui.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.model.vo.Member;


@Mapper
public interface MemberMapper {

	int memberSignupJachui(Member member);

	int memberSignupRealtor(Member member);

	int selectFindId(Member member);

	int updateResetPw(Member member);

	List<Member> selectFoundId(Member member);

	Member selectOneByLogin(MemberLoginRequest member);


}
