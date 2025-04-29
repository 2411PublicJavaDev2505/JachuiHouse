package com.house.jachui.chat.controller.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SendRequest {
	
	private String writerId;
    private String receiverId;
    private String message;
    private int roomNo;
}
