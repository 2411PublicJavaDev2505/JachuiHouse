package com.house.jachui.chat.model.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.house.jachui.chat.model.mapper.ChatRoomMapper;
import com.house.jachui.chat.model.service.ChatRoomService;
import com.house.jachui.chat.model.vo.Chat;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService {

    private final ChatRoomMapper chatRoomMapper;

    @Override
    public Integer findChatRoom(Map<String, String> map) {
        return chatRoomMapper.findChatRoom(map);
    }

    @Override
    public List<Chat> getChatRoomsByUserId(String userId) {
        return chatRoomMapper.getChatRoomsByUserId(userId);
    }

    @Override
    public int createEstateChatRoom(String user1Id, String user2Id, int estateNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("user1Id", user1Id);
        params.put("user2Id", user2Id);
        params.put("itemType", "estate");
        params.put("itemNo", estateNo);
        Integer existingChatRoomNo = chatRoomMapper.findChatRoomByUsersAndItem(params);
        if (existingChatRoomNo != null) {
            System.out.println("Existing chat room found: CHAT_ROOM_NO=" + existingChatRoomNo + " for estateNo=" + estateNo);
            return existingChatRoomNo;
        }

        System.out.println("Creating new chat room for estateNo=" + estateNo + ", user1Id=" + user1Id + ", user2Id=" + user2Id);
        chatRoomMapper.createEstateChatRoom(params);
        Integer newChatRoomNo = chatRoomMapper.findChatRoomByUsersAndItem(params);
        if (newChatRoomNo == null) {
            throw new RuntimeException("Failed to create or find chat room for estateNo=" + estateNo);
        }
        System.out.println("New chat room created: CHAT_ROOM_NO=" + newChatRoomNo + " for estateNo=" + estateNo);
        return newChatRoomNo;
    }

    @Override
    public int createTradeChatRoom(String user1Id, String user2Id, int tradeNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("user1Id", user1Id);
        params.put("user2Id", user2Id);
        params.put("itemType", "trade");
        params.put("itemNo", tradeNo);
        Integer existingChatRoomNo = chatRoomMapper.findChatRoomByUsersAndItem(params);
        if (existingChatRoomNo != null) {
            System.out.println("Existing chat room found: CHAT_ROOM_NO=" + existingChatRoomNo + " for tradeNo=" + tradeNo);
            return existingChatRoomNo;
        }

        System.out.println("Creating new chat room for tradeNo=" + tradeNo + ", user1Id=" + user1Id + ", user2Id=" + user2Id);
        chatRoomMapper.createTradeChatRoom(params);
        Integer newChatRoomNo = chatRoomMapper.findChatRoomByUsersAndItem(params);
        if (newChatRoomNo == null) {
            throw new RuntimeException("Failed to create or find chat room for tradeNo=" + tradeNo);
        }
        System.out.println("New chat room created: CHAT_ROOM_NO=" + newChatRoomNo + " for tradeNo=" + tradeNo);
        return newChatRoomNo;
    }

    @Override
    public Integer findChatRoomByUsers(String writerId, String receiverId) {
        Map<String, String> params = new HashMap<>();
        params.put("user1Id", writerId);
        params.put("user2Id", receiverId);
        return chatRoomMapper.findChatRoomByUsers(params);
    }

    @Override
    public boolean checkChatRoomExists(int chatRoomNo) {
        Integer count = chatRoomMapper.countChatRoomByRoomNo(chatRoomNo);
        System.out.println("Checking chat room existence: CHAT_ROOM_NO=" + chatRoomNo + ", exists=" + (count != null && count > 0));
        return count != null && count > 0;
    }

	@Override
	public List<Chat> getChatRoomsByMyId(String userId) {
		return chatRoomMapper.getChatRoomsByMyId(userId);
	}
}