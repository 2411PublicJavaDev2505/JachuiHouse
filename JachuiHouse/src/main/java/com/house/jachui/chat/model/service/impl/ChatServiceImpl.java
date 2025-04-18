package com.house.jachui.chat.model.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.house.jachui.chat.model.mapper.ChatMapper;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;
@Service
public class ChatServiceImpl implements ChatService {
	
	private ChatMapper cMapper;
	private SqlSession session;

	@Override
	public List<Chat> selectList(Map<String, String> map) {
		return cMapper.selectList(session, map);
		
	}

}
