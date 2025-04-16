package com.house.jachui.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UpdateRequest {
	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userAddress;
	private String realtorName;
}
