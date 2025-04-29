package com.house.jachui.chat.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.vo.Chat;

@Mapper
public interface ChatMapper {

	List<Chat> getMessagesByRoom(Integer roomNo);

	int sendChat(SendRequest sendRequest);

	List<Chat> selectNewMessagesAfter(Map<String, Object> map);

	List<Chat> selectNewMessages(Map<String, Object> map);
	
	List<Chat> getChatByUserId(String userId);

	int getTotalCount(String userId);

	List<Chat> selectChatByUserId(String userId, RowBounds rowBounds);

	String selectLastChatById(String receiverId);

}
