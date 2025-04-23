package com.house.jachui.member.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.member.dto.ContactRequest;
import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.MemberPasswordRequest;
import com.house.jachui.member.dto.SignupJachuiRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.dto.UpdateRealtorRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.notice.model.vo.NoticeVO;

public interface MemberService {

    // 자취생 회원가입
    boolean signupJachui(SignupJachuiRequest request);

    // 공인중개사 회원가입
    int signupRealtor(SignupRealtorRequest request);

    // 로그인
    Member selectOneByLogin(MemberLoginRequest member);

    // 자취생/공인중개사 상세 조회 (마이페이지용)
    Member selectRealtorById(String userId);

    // 아이디 찾기 - 입력 정보와 일치하는 아이디 존재 여부
    Member selectFindId(Member member);

    // 아이디 찾기 결과 - 일치하는 아이디 목록 반환
    Member selectFoundId(Member member);

    // 비밀번호 찾기
    String resetPw(MemberPasswordRequest MemberPasswordRequest);

    // 회원정보 수정
    int updateMember(UpdateRequest member);

    
    int deleteMember(String userId);

    // 비밀번호 확인 (회원탈퇴 시)
    boolean checkPw(String userId, String userPw);

	int updateRealtor(UpdateRealtorRequest realtor);

	Member selectMemberById(String userId);

	String selectNameById(String string);
	//회원 관리 리스트
	List<NoticeVO> selectListAll(int currentPage);
	//회원 관리 리스트 - 페이지네이션
	int getTotalCount();

	void contactInquiry(List<MultipartFile> contactImage, ContactRequest contactRequest);

	boolean resetPassword(String userId, String email);

	Member selectOneByIdEmail(MemberPasswordRequest memberPasswordRequest);

	Boolean sendEmailPw(String email);

	
	
}
