package com.house.jachui.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.vo.Chat;

import jakarta.servlet.http.HttpSession;

public interface ChatService {

	List<Chat> getMessagesByRoom(Integer roomNo);

	String selectLastChatById(String receiverId);

	List<Chat> getChatRoomsByMyId(String userId);

	List<Chat> getMessagesAfter(int chatRoomNo, int lastChatNo);

	void insertMessage(Chat chat);
}
