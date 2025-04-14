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
	public List<Trade> selectPersonalList(String userId, int currentPage) {
		return mapper.selectPersonalList(userId, currentPage);
	}

	@Override
	public List<Trade> selectListAll(int currentPage) {
		 return mapper.selectListAll(currentPage);
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	@Override
	public Trade selectOneByNo(int tradeNo) {
		 return mapper.selectOneByNo(tradeNo);
	}

	@Override
	public Integer countViewUpdate(int tradeNo) {
		return mapper.countViewUpdate(tradeNo);
	}

	@Override
	public List<Trade> selectSearchList(Map<String, String> paramMap, int currentPage) {
		return mapper.selectSearchList(paramMap, currentPage);
	}

	@Override
	public int getTotalCount(Map<String, String> paramMap) {
		return mapper.getTotalCountWithCondition(paramMap);
	}

	@Override
	public int insertTrade(TradeAddRequest trade) {
		return mapper.insertTrade(trade);
	}

	@Override
	public int updateTrade(TradeAddRequest trade) {
		return mapper.updateTrade(trade);
	}

	@Override
	public int deleteTrade(int tradeNo) {
		return mapper.deleteTrade(tradeNo);
	}

	@Override
	public String getuserId(String userId) {
		return mapper.getuserId(userId);
	}


}