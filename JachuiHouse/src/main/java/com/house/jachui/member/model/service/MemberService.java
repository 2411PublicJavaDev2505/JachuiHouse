package com.house.jachui.member.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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

public interface MemberService {

	// 자취생 회원가입
    int signupJachui(SignupJachuiRequest request);

    // 공인중개사 회원가입
    int signupRealtor(SignupRealtorRequest request);

    // 로그인
    Member selectOneByLogin(MemberLoginRequest member);

    // 아이디 찾기 - 입력 정보와 일치하는 아이디 존재 여부
    Member selectFindId(Member member);

    // 아이디 찾기 결과 - 일치하는 아이디 목록 반환
    Member selectFoundId(Member member);

    // 비밀번호 찾기
    String resetPw(MemberPasswordRequest MemberPasswordRequest);

	// 사용자 정보 조회
	Member getMemberById(String userId);
	
	// 비밀번호 업데이트
	boolean updatePw(String userId, String encodedPw);
	
    // 회원정보 수정
    int updateMember(UpdateRequest member);

    
    int deleteMember(String userId);

    // 비밀번호 확인 (회원탈퇴 시)
    boolean checkPw(String userId, String userPw);

	Member selectMemberById(String userId);

	//회원 관리 조회
	List<Member> selectListAll(int currentPage);
	//회원 관리 조회 - 페이지네이션
	int getTotalCount();

	void contactInquiry(List<MultipartFile> contactImage, ContactRequest contactRequest);

	boolean resetPassword(String userId, String email);

	Member selectOneByIdEmail(MemberPasswordRequest memberPasswordRequest);

	Boolean sendEmailPw(MemberPasswordRequest memberPasswordRequest);

	boolean updatePassword(String userId, String userPw);
		
	//회원 관리 검색 - 페이지네이션
	int getTotalCountByKeyword(@Param("searchKeyword")String searchKeyword);
	
	//회원 관리 검색
	List<Member> searchListByKeyword(String searchKeyword, int currentPage);
	int updateProfileImage(String userId, String newFileName);
	//관리자 승인
	int approveMember(String userId);

	int getTotalCount(String userId);
	
	// 아이디찾기 페이지에서 자취생/공인중개사 선택 시 
	String getFindIdErrorMessage(Member member);

	Member selectFindId1(Member member);

	// 자취생, 공인중개사 id 중복확인
	int overlappedID(String userId) throws Exception;
	
     // 자취생, 공인중개사 email 중복확인
  	int overlappedEmail(String userId) throws Exception;


	//공인중개사 파일 저장 처리
	int addMember(MemberAddRequest member);

}

