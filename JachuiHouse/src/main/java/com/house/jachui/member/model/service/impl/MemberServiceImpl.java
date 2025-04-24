package com.house.jachui.member.model.service.impl;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.member.dto.ContactRequest;
import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.MemberPasswordRequest;
import com.house.jachui.member.dto.SignupJachuiRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.mapper.MemberMapper;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.notice.model.vo.NoticeVO;
import com.house.jachui.realtor.controller.dto.UpdateRealtorRequest;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	
    private final MemberMapper mMapper;
    private final JavaMailSender javaMailSender;
    private final PasswordEncoder passwordEncoder;

    // 자취생 회원가입
    @Override
    public boolean signupJachui(SignupJachuiRequest request) {
        return mMapper.signupJachui(request) > 0;
    }

    // 공인중개사 회원가입
    @Override
    public int signupRealtor(SignupRealtorRequest request) {
        return mMapper.signupRealtor(request);
    }

    // 로그인 처리
    @Override
    public Member selectOneByLogin(MemberLoginRequest member) {
        return mMapper.selectOneByLogin(member);
    }

    @Override
    public Member selectFindId(Member member) {
        return mMapper.selectFindId(member);
    }

    // 아이디 목록 반환
    @Override
    public Member selectFoundId(Member member) {
        return mMapper.selectFoundId(member);
    }

    // 비밀번호 재설정
    @Override
	public String resetPw(MemberPasswordRequest memberPasswordRequest) {
    	return mMapper.resetPw(memberPasswordRequest);
	}
    
    @Override
    public Member getMemberById(String userId) {
        return mMapper.selectMemberById(userId);
    }
    
    @Override
    public boolean updatePw(String userId, String userPw) {
        Member member = new Member();
        member.setUserId(userId);
        member.setUserPw(userPw);
        int result = mMapper.updatePw(member);
        return result > 0;
    }
    
 // 문의 메일 기능 api
 	@Override
 	public void contactInquiry(List<MultipartFile> contactImage, ContactRequest contactRequest) {
 		mMapper.contactInquiry(contactImage, contactRequest);
 		
 	}

    @Override
    public int updateMember(UpdateRequest member) {
        return mMapper.updateMember(member);
    }

    @Override
    public int deleteMember(String userId) {
        return mMapper.deleteMember(userId);
    }

    // 비밀번호 확인
    @Override
    public boolean checkPw(String userId, String userPw) {
        String check = mMapper.selectPassword(userId);
        return check != null && check.equals(userPw);
    }

	// 자취생 마이페이지
	@Override
	public Member selectMemberById(String userId) {
		Member member = mMapper.selectMemberById(userId);
		return member;
	}

	//회원 관리 리스트
	@Override
	public List<Member> selectListAll(int currentPage) {
		int limit = 10;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mMapper.selectListAll(rowBounds);
	}
	//회원 관리 조회 - 페이지네이션
	@Override
	public int getTotalCount() {
		return mMapper.getTotalCount();
	}

	@Override
	public boolean resetPassword(String userId, String email) {
		// 1. 사용자 존재 및 이메일 확인
		Member member = mMapper.selectMemberById(userId);
		if(member == null || !member.getUserEmail().equals(email)) {
			return false;
		}
		
		// 2. 임시 비밀번호 생성
		String tempPassword = UUID.randomUUID().toString().substring(0, 10);
		
		// 3. DB에 비밀번호 업데이트 (암호화 필요시 여기에 적용)
		mMapper.updatePassword(userId, tempPassword);
		
		// 4. 이메일 전송
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(email);
			message.setSubject("[자취하우스] 임시 비밀번호 안내");
			message.setText("임시 비밀번호: " + tempPassword + "\n로그인 후 비밀번호를 변경해주세요.");
			javaMailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
	}

	@Override
	public Member selectOneByIdEmail(MemberPasswordRequest memberPasswordRequest) {
		Member member = mMapper.selectOneByIdEmail(memberPasswordRequest);
		return member;
	}

	@Override
	public Boolean sendEmailPw(MemberPasswordRequest memberPasswordRequest) {
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(memberPasswordRequest.getUserEmail()); // 받는 사람 이메일
			message.setFrom("cothgud@gmail.com"); // 발신자 이메일
			message.setSubject("[자취하우스] 임시 비밀번호 안내");
			message.setText("비밀번호 재설정 링크: http://localhost:7777/member/createNewPw?userId="+memberPasswordRequest.getUserId());
			javaMailSender.send(message);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updatePassword(String userId, String userPw) {
		PasswordEncoder encoder = new BCryptPasswordEncoder();
		String encryptedPw = encoder.encode(userPw);
	    return mMapper.updateUserPassword(userId, encryptedPw) > 0;
	}


	//회원 관리 검색 - 페이지네이션
	@Override
	public int getTotalCountByKeyword(@Param("searchKeyword")String searchKeyword) {
		return mMapper.getTotalCountByKeyword(searchKeyword);
	}
	//회원 관리 검색
	@Override
	public List<Member> searchListByKeyword(String searchKeyword, int currentPage) {
		int limit = 10;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mMapper.selectSearchList(searchKeyword, currentPage, rowBounds);
	}

	//관리자 승인
	@Override
	public int approveMember(String userId) {
		return mMapper.updateApproveYn(userId);
	}

	@Override
	public int updateProfileImage(String userId, String newFileName) {	
		return mMapper.updateProfileImage(userId, newFileName);
	}

	@Override
	public int getTotalCount(String userId) {
		return mMapper.getTotalCount();
	}

	



}
