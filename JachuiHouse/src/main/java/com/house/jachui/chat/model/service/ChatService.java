package com.house.jachui.chat.model.service;

import java.util.List;
import java.util.Map;

import com.house.jachui.chat.model.vo.Chat;

public interface ChatService {

	List<Chat> selectList(Map<String, String> map);

}
