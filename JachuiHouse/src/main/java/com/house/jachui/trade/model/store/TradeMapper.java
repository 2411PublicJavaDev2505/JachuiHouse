package com.house.jachui.trade.model.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.trade.controller.dto.TradeAddRequest;
import com.house.jachui.trade.model.vo.Trade;

@Mapper
public interface TradeMapper {

	List<Trade> selectPersonalList(String userId, int currentPage);

	List<Trade> selectListAll(int currentPage);

	int getTotalCount();

	Trade selectOneByNo(int tradeNo);

	Integer countViewUpdate(int tradeNo);

	List<Trade> selectSearchList(Map<String, String> paramMap, int currentPage);

	int getTotalCountWithCondition(Map<String, String> paramMap);

	int insertTrade(TradeAddRequest trade);

	int updateTrade(TradeAddRequest trade);

	int deleteTrade(int tradeNo);

	String getuserId(String userId);

}