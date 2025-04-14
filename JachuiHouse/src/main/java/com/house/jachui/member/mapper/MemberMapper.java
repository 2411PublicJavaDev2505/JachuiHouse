package com.house.jachui.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.house.jachui.member.vo.MemberVO;

@Mapper
public interface MemberMapper {

	int memberSignupJachui(MemberVO member);

	int memberSignupRealtor(MemberVO member);

	int selectFindId(MemberVO member);

	int updateResetPw(MemberVO member);

	List<MemberVO> selectFoundId(MemberVO member);

}
