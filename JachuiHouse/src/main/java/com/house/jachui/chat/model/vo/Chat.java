package com.house.jachui.chat.model.vo;

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
public class Chat {
	private int chatNo;
	private String writerId;
	private Date chatSendDate;
	private String chatContent;
	private String chatFileName;
	private String chatFilePath;
	private String chatFileRename;
	private String recieverId;
}
