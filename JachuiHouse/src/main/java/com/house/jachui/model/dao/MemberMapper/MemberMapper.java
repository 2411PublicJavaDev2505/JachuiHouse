package com.house.jachui.model.dao.MemberMapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.member.vo.MemberVO;

@Mapper
public interface MemberMapper {
	List<MemberVO> findIds(MemberVO member);
}
