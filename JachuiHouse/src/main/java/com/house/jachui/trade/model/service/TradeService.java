package com.house.jachui.trade.model.service;

import java.util.List;
import java.util.Map;

import com.house.jachui.trade.controller.dto.TradeAddRequest;
import com.house.jachui.trade.controller.dto.TradeUpdateRequest;
import com.house.jachui.trade.model.vo.Trade;

public interface TradeService {

	List<Trade> selectListAll(int currentPage);

	List<Trade> searchListByKeyword(String searchKeyword, int currentPage);

	Trade selectOneByNo(int tradeNo);

	int getTotalCount();
	
	int getTotalCount(String searchKeyword);

	int insertTrade(TradeAddRequest trade);
	
	int updateTrade(TradeUpdateRequest trade);
	
	int deleteTrade(int tradeNo);




}
