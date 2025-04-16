package com.house.jachui.member.dto;

import java.sql.Date;


import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED) // "기본 생성자"를 자동으로 생성해주되, 접근 제어자를 protected로 설정하는 것
public class SignupJachuiRequest {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userGender;
	private String userAddress;
	private Date userBirth;
	private String aloneLiving;
	private String userPostcode;
	private String userDetailAddress;
	
}