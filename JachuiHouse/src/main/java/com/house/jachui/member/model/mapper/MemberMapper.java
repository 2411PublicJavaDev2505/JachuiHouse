package com.house.jachui.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.member.dto.ContactRequest;
import com.house.jachui.member.dto.MemberAddRequest;
import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.MemberPasswordRequest;
import com.house.jachui.member.dto.SignupJachuiRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.notice.model.vo.NoticeVO;
import com.house.jachui.realtor.controller.dto.UpdateRealtorRequest;

@Mapper
public interface MemberMapper {

	int signupJachui(SignupJachuiRequest request);

	int signupRealtor(SignupRealtorRequest request);

	Member selectOneByLogin(MemberLoginRequest member);

	Member selectFindId(Member member);

	Member selectFoundId(Member member);

	String resetPw(MemberPasswordRequest memberPasswordRequest);
	
	Member selectMemberById(String userId);
	
	int updatePw(Member member);

	int updateMember(UpdateRequest member);

	int updateProfileImage(@Param("userId") String userId, @Param("profileImage") String newFileName);
	
	int deleteMember(String userId);

	String selectPassword(String userId);

	int updateRealtor(UpdateRealtorRequest realtor);


	
	//회원 관리 조회
	List<Member> selectListAll(RowBounds rowBounds);
	//회원 관리 조회 - 페이지네이션
	int getTotalCount();

	Object contactInquiry(List<MultipartFile> contactImage, ContactRequest contactRequest);

	void updatePassword(String userId, String tempPassword);

	Member selectOneByIdEmail(MemberPasswordRequest memberPasswordRequest);

	void sendEmailPw();

	int updateUserPassword(String userId, String encryptedPw);

	// 아이디찾기 페이지에서 자취생/공인중개사 선택 시 
	Member findMemberByEmailOrName1(
	        @Param("userEmail") String userEmail, 
	        @Param("userName") String userName
	    );



	//회원 관리 검색 - 페이지네이션
	int getTotalCountByKeyword(@Param("searchKeyword") String searchKeyword);
	//회원 관리 검색
	List<Member> selectSearchList(@Param("searchKeyword") String searchKeyword, @Param("currentPage") int currentPage, RowBounds rowBounds);

	//관리자 승인
	int updateApproveYn(String userId);

	Member findMemberByEmailOrName(String userEmail, String userName);

	// 자취생, 공인중개사 id 중복확인
	int overlappedID(String userId);
	
	// 회원가입 email 중복확인
	int overlappedEmail(String email);

	int addMember(MemberAddRequest member);
	// 채팅방 조회
	String getChatByUserId(String otherUserId);
}