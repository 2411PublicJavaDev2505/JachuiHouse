package com.house.jachui.chat.controller.dto;

import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.chat.model.vo.ChatRoom;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@ToString
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ChatWith {
	private Chat chat;
	private ChatRoom chatRoom;
	private String opponentId; // 상대방 아이디
	private String opponentName; // 상대방 이름 
	}
