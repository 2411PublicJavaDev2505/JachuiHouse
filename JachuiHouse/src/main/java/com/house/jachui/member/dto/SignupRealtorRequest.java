package com.house.jachui.member.dto;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SignupRealtorRequest {

	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userAddress;
	private String aloneLiving;
	private String userPostcode;
	private String userDetailAddress;
	private String userRole;
	private String realtorName;
	private String realtorNo;
	
}
