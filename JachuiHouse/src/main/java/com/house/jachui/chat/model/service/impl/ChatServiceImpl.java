package com.house.jachui.chat.model.service.impl;

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

    @Autowired
    public ChatServiceImpl(ChatMapper chatMapper) {
        this.chatMapper = chatMapper;
    }

    // 채팅방에 속한 메시지 조회
    @Override
    public List<Chat> getMessagesByRoom(Integer roomNo) {
        return chatMapper.getMessagesByRoom(roomNo);
    }

    // 메시지 전송
    @Override
    public int sendChatMessage(SendRequest sendRequest) {
        return chatMapper.sendChat(sendRequest);
    }

    // 새로운 메시지 가져오기
    @Override
    public List<Chat> fetchNewMessages(Map<String, Object> map) {
        return chatMapper.selectNewMessagesAfter(map);
    }

    // 사용자가 참여한 채팅방을 조회하기 위한 쿼리 호출
  
}
