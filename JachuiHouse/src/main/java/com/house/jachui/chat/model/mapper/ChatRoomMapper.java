package com.house.jachui.chat.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.chat.model.vo.Chat;

@Mapper
public interface ChatRoomMapper {

	Integer findChatRoom(Map<String, String> map);

	Integer createChatRoom(Map<String, String> map);

	List<Chat> getChatRoomsByUserId(String userId);

}
