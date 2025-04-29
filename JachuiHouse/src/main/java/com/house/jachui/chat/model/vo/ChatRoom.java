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
public class ChatRoom {
	private int roomNo;
	private String itemType;
	private int itemNo;
	private String user1Id;
	private String user2Id;
	private Date createDate;
	private Timestamp updateTime;

}
