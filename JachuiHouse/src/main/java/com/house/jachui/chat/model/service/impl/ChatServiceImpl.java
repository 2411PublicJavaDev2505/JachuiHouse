package com.house.jachui.chat.model.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	public List<Chat> getChatByUserId(String userId) {
		return cMapper.getChatByUserId(userId);
	}

	@Override
	public int getTotalCount(String userId) {
		return cMapper.getTotalCount(userId);
	}

	@Override
	public List<Chat> selectChatByUserId(String userId, int currentPage, int i) {
		int limit = 3;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return cMapper.selectChatByUserId(userId, rowBounds);
	}

	@Override
	public List<Chat> selectNewMessagesAfter(Map<String, Object> map) {
		return cMapper.selectNewMessagesAfter(map);
	}

}
