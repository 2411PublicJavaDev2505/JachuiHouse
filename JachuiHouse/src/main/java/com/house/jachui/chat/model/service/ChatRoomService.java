package com.house.jachui.chat.model.service;

import java.util.List;
import java.util.Map;

import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.chat.model.vo.ChatRoom;

public interface ChatRoomService {

	Integer findChatRoom(Map<String, String> map);

	Integer createChatRoom(Map<String, String> map);

	List<ChatRoom> getChatRoomsByUserId(String userId);


}
