package com.house.jachui.member.dto;

import java.sql.Date;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class SignupRealtorRequest {

	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userAddress;
	private String aloneLiving;
	private String userPostcode;
	private String userDetailAddress;
	private String userRole;
	private String realtorName;
	private String realtorNo;
	private String fileName;
	private String fileRename;
	private String filePath;
	
}
