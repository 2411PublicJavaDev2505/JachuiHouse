package com.house.jachui.chat.model.service;

import java.util.List;
import java.util.Map;

import com.house.jachui.chat.model.vo.Chat;

public interface ChatRoomService {

	Integer findChatRoom(Map<String, String> map);

	Integer createChatRoom(Map<String, String> map);

	List<Chat> getChatRoomsByUserId(String userId);

}
