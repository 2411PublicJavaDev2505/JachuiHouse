package com.house.jachui.member.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.house.jachui.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	List<MemberVO> findIds(MemberVO member);
	
	int memberSignupJachui(MemberVO member);

}
