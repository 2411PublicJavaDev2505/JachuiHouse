package com.house.jachui.member.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userGender;
	private String userAddress;
	private Date userBirth;
	private String userPostcode;  //추가 erd에도 추가하기.
	private String userDetailAddress;  //추가 erd에도 추가하기.
	private String aloneLiving;
	private String userRole;
	private String realtorName;
	private String realtorNo;
	private String deleteYn;	// 이건 내가 넣어야하는건지 물어보기
	private String approveYn;  // 이건 내가 넣어야하는건지 물어보기
	private Date joinDate;		//추가 erd에도 추가하기.

}