package com.house.jachui.chat.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

import com.house.jachui.chat.model.vo.Chat;

@Mapper
public interface ChatMapper {

	List<Chat> selectList(SqlSession session, Map<String, String> map);

}
