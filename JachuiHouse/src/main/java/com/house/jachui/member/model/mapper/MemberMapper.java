package com.house.jachui.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.member.dto.ContactRequest;
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

	List<NoticeVO> selectListAll(RowBounds rowBounds);

	int getTotalCount();

	Object contactInquiry(List<MultipartFile> contactImage, ContactRequest contactRequest);


}