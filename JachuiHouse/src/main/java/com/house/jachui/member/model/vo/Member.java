package com.house.jachui.member.model.vo;

import java.sql.Date;

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
//@Builder
public class Member {
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
	private String deleteYn;	
	private String approveYn;  
	private Date joinDate;		//추가 erd에도 추가하기.

}
