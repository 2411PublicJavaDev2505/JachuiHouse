package com.house.jachui.chat.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.vo.Chat;

@Mapper
public interface ChatMapper {

	List<Chat> selectList(Map<String, String> map);

	int sendChat(SendRequest chat);

	List<Chat> selectNewMessages(Map<String, Object> map);
	
	List<Chat> getChatByUserId(String userId);

	int getTotalCount(String userId);

	List<Chat> selectChatByUserId(String userId, RowBounds rowBounds);

	String selectLastChatById(String receiverId);

}
