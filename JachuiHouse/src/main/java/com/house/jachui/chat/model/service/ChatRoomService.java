package com.house.jachui.chat.model.service;

import java.util.List;
import java.util.Map;

import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.chat.model.vo.ChatRoom;

public interface ChatRoomService {

	Integer findChatRoom(Map<String, String> map);


	List<Chat> getChatRoomsByUserId(String userId);

	int createEstateChatRoom(String user1Id, String user2Id, int estateNo);

	int createTradeChatRoom(String writerId, String receiverId, int tradeNo);

	Integer findChatRoomByUsers(String writerId, String receiverId);

	boolean checkChatRoomExists(int roomNo);

	List<ChatRoom> getChatRoomsByMyId(String userId);

}
