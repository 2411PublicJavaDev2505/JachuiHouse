package com.house.jachui.member.model.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.house.jachui.member.dto.MemberLoginRequest;
import com.house.jachui.member.dto.SignupJachuiRequest;
import com.house.jachui.member.dto.UpdateRequest;
import com.house.jachui.member.dto.SignupRealtorRequest;
import com.house.jachui.member.model.mapper.MemberMapper;
import com.house.jachui.member.model.service.MemberService;
import com.house.jachui.member.model.vo.Member;

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
}
