package com.house.jachui.member.dto;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class ContactRequest {

	private String userId;
	private String userEmail;
	private String title;     // 문의 제목
    private String content; 

	
}
