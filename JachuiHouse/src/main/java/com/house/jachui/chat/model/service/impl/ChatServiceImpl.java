package com.house.jachui.chat.model.service.impl;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.chat.controller.dto.SendRequest;
import com.house.jachui.chat.model.mapper.ChatMapper;
import com.house.jachui.chat.model.service.ChatService;
import com.house.jachui.chat.model.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService {

    private final ChatMapper chatMapper;
    private Timestamp lastCheckedTime = new Timestamp(System.currentTimeMillis());

    @Autowired
    public ChatServiceImpl(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }

    // 채팅방에 속한 메시지 조회
    @Override
    public List<Chat> getMessagesByRoom(Integer roomNo) {
        return chatMapper.getMessagesByRoom(roomNo);
    }

    // 사용자가 참여한 채팅방을 조회하기 위한 쿼리 호출
	@Override
	public String selectLastChatById(String receiverId) {
		return chatMapper.selectLastChatById(receiverId);
	}

	@Override
	public List<Chat> getChatRoomsByMyId(String userId) {
		return chatMapper.getChatRoomsByMyId(userId);
	}

	@Override
	public void insertMessage(Chat chat) {
	    chatMapper.insertMessage(chat);
	}

	@Override
	public List<Chat> getMessagesAfter(int chatRoomNo, int lastChatNo) {
	    return chatMapper.selectMessagesAfter(chatRoomNo, lastChatNo);
	}


}
