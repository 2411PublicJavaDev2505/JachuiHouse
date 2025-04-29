package com.house.jachui.chat.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.chat.model.vo.ChatRoom;

@Mapper
public interface ChatRoomMapper {

	Integer findChatRoom(Map<String, String> map);

	Integer createChatRoom(Map<String, String> map);

	List<ChatRoom> getChatRoomsByUserId(String userId);

}
