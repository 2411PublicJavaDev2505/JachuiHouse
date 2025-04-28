package com.house.jachui.chat.model.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.mapper.ChatMapper;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
	
	private final ChatMapper cMapper;
	
//	@Autowired
//	public ChatServiceImpl(ChatMapper cMapper, SqlSession session) {
//		this.cMapper = cMapper;
//		this.session = session;
//	}

	@Override
	public List<Chat> selectList(Map<String, String> map) {
		return cMapper.selectList(map);
	}

	@Override
	public int sendChat(SendRequest chat, List<MultipartFile> images) {
		return cMapper.sendChat(chat);
	}

	@Override
	public List<Chat> selectNewMessages(Map<String, Object> map) {
		return cMapper.selectNewMessages(map);
	}
		
	public List<Chat> getChatByUserId(String userId) {
		return cMapper.getChatByUserId(userId);
	}


}
