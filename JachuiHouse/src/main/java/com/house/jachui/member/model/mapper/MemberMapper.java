package com.house.jachui.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.SignupJachuiRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.dto.UpdateRealtorRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.notice.model.vo.NoticeVO;

@Mapper
public interface MemberMapper {

	int signupJachui(SignupJachuiRequest request);

	int signupRealtor(SignupRealtorRequest request);

	Member selectOneByLogin(MemberLoginRequest member);

	Member selectRealtorById(String userId);

	Member selectFindId(Member member);

	Member selectFoundId(Member member);

	String resetPw(String userId, String userEmail);

	int updateMember(UpdateRequest member);

	int deleteMember(String userId);

	String selectPassword(String userId);

	int updateRealtor(UpdateRealtorRequest realtor);

	Member selectMemberById(String userId);
	
	//회원 관리 조회
	List<Member> selectListAll(RowBounds rowBounds);
	//회원 관리 조회 - 페이지네이션
	int getTotalCount();


	//회원 관리 검색 - 페이지네이션
	int getTotalCountByKeyword(@Param("searchKeyword") String searchKeyword);
	//회원 관리 검색
	List<Member> selectSearchList(@Param("searchKeyword") String searchKeyword, @Param("currentPage") int currentPage, RowBounds rowBounds);

}