package com.house.jachui.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.vo.Chat;

import jakarta.servlet.http.HttpSession;

public interface ChatService {

	List<Chat> getMessagesByRoom(Integer roomNo);

	int sendChatMessage(SendRequest sendRequest);

	List<Chat> fetchNewMessages(Map<String, Object> map);

	String selectLastChatById(String receiverId);

	List<Chat> getChatRoomsByMyId(String userId);
}
