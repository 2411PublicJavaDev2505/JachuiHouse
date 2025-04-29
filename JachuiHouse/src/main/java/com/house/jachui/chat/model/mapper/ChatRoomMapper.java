package com.house.jachui.chat.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.chat.model.vo.ChatRoom;

@Mapper
public interface ChatRoomMapper {

	List<Chat> getChatRoomsByUserId(String userId);
	
	Integer findChatRoom(Map<String, String> map);

	Integer createChatRoom(Map<String, String> map);

	Integer findChatRoomByUsersAndItem(Map<String, Object> params);

	void createEstateChatRoom(Map<String, Object> params);

	void createTradeChatRoom(Map<String, Object> params);

	Integer findChatRoomByUsers(Map<String, String> params);

	Integer countChatRoomByRoomNo(int roomNo);

	List<ChatRoom> getChatRoomsByMyId(String userId);

}
