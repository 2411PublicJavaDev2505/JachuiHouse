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
	private String chatContent;
	private String chatFileName;
	private String chatFileRename;
	private String chatFilePath;
	private String chatNo;
}
