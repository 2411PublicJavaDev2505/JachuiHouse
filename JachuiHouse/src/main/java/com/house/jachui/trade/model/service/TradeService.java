package com.house.jachui.trade.model.service;

import java.util.List;
import java.util.Map;

import com.house.jachui.trade.controller.dto.TradeAddRequest;
import com.house.jachui.trade.model.vo.Trade;

public interface TradeService {


	
	Trade selectOneByNo(int tradeNo);
	
	List<Trade> getAllTradeList();

	int getTotalCount();

	List<Trade> printAllTradeList(int currentPage);


}
