package com.house.jachui.chat.model.vo;

import java.sql.Date;
import java.sql.Timestamp;

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
	private int chatRoomNo;
	private String writerId;
	private String message;
	private String isRead;
	private Date createDate;
	private Timestamp chatTime;
	private String otherUserRole;
}
