package com.house.jachui.member.dto;

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
public class MemberPasswordRequest {
	private String userEmail;
	private String userId;
	
}
