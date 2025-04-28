package com.house.jachui.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.vo.Chat;

import jakarta.servlet.http.HttpSession;

public interface ChatService {

	List<Chat> selectList(Map<String, String> map);

	int sendChat(SendRequest chat, List<MultipartFile> images);

	List<Chat> getChatByUserId(String userId);

}
