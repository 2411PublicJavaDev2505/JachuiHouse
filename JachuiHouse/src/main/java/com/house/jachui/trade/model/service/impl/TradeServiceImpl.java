package com.house.jachui.trade.model.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.trade.controller.dto.TradeAddRequest;
import com.house.jachui.trade.model.service.TradeService;
import com.house.jachui.trade.model.store.TradeMapper;
import com.house.jachui.trade.model.vo.Trade;

@Service
public class TradeServiceImpl implements TradeService {

	private final TradeMapper mapper;
	
	@Autowired
    public TradeServiceImpl(TradeMapper mapper) {
		this.mapper = mapper;
    }
	
	@Override
	public Trade selectOneByNo(int tradeNo) {
		 return mapper.selectOneByNo(tradeNo);
	}

	@Override
	public List<Trade> getAllTradeList() {
		 return mapper.selectListAll();
	}

	@Override
	public List<Trade> printAllTradeList(int currentPage) {
		return mapper.selectAllTrade(currentPage);
	}


	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}



}