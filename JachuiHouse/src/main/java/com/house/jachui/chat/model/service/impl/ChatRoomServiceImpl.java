package com.house.jachui.chat.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.house.jachui.chat.model.mapper.ChatRoomMapper;
import com.house.jachui.chat.model.service.ChatRoomService;
import com.house.jachui.chat.model.vo.Chat;
import com.house.jachui.chat.model.vo.ChatRoom;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService {

    private final ChatRoomMapper chatRoomMapper;

    @Override
    public Integer findChatRoom(Map<String, String> map) {
        // chatRoomMapper에서 해당 채팅방을 찾는 쿼리 호출
        return chatRoomMapper.findChatRoom(map);
    }

    @Override
    public Integer createChatRoom(Map<String, String> map) {
        // chatRoomMapper에서 채팅방을 생성하는 쿼리 호출
        return chatRoomMapper.createChatRoom(map);
    }

    @Override
    public List<ChatRoom> getChatRoomsByUserId(String userId) {
        // chatRoomMapper에서 사용자의 채팅방 목록을 조회하는 쿼리 호출
        return chatRoomMapper.getChatRoomsByUserId(userId);
    }
}
