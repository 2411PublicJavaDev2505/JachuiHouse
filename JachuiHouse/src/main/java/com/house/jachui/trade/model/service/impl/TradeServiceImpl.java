package com.house.jachui.trade.model.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.trade.controller.dto.TradeAddRequest;
import com.house.jachui.trade.controller.dto.TradeUpdateRequest;
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
	public List<Trade> selectListAll(int currentPage) {
		int limit = 8;
		int offset = (currentPage-1)*limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mapper.selectListAll(rowBounds);
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
	}

	@Override
	public int getTotalCount(String searchKeyword) {
		return mapper.getTotalCount(searchKeyword);
	}

	@Override
	public List<Trade> searchListByKeyword(String searchKeyword, int currentPage) {
		return mapper.selectSearchList(searchKeyword, currentPage);
	}

	@Override
	public int insertTrade(TradeAddRequest trade) {
		return mapper.insertTrade(trade);
	}

	@Override
	public int updateTrade(TradeUpdateRequest trade) {
		return mapper.updateTrade(trade);
	}

	@Override
	public int deleteTrade(int tradeNo) {
		return mapper.deleteTrade(tradeNo);
	}


	



}