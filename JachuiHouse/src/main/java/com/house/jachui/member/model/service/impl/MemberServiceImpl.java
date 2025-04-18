package com.house.jachui.member.model.service.impl;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.SignupJachuiRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.dto.UpdateRealtorRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.model.mapper.MemberMapper;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;
import com.house.jachui.notice.model.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

    private final MemberMapper mMapper;

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
    public Member selectRealtorById(String userId) {
        return mMapper.selectRealtorById(userId);
    }

    @Override
    public Member selectFindId(Member member) {
        return mMapper.selectFindId(member);
    }

    // 아이디 목록 반환
    @Override
    public List<Member> selectFoundId(Member member) {
        return mMapper.selectFoundId(member);
    }

    // 비밀번호 재설정
    @Override
    public int updateResetPw(Member member) {
        return mMapper.updateResetPw(member);
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

	@Override
	public int updateRealtor(UpdateRealtorRequest realtor) {
		int result = mMapper.updateRealtor(realtor);
		return result;
	}

	// 자취생 마이페이지
	@Override
	public Member selectMemberById(String userId) {
		Member member = mMapper.selectMemberById(userId);
		return member;
	}

	//회원 관리 리스트
	@Override
	public List<NoticeVO> selectListAll(int currentPage) {
		int limit = 10;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mMapper.selectListAll(rowBounds);
	}

	@Override
	public int getTotalCount() {
		return mMapper.getTotalCount();
	}
}
