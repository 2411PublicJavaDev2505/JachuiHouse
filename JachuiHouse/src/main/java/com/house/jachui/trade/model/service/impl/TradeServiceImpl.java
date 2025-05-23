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
	public int getTotalCount(String searchKeyword, String category) {
		return mapper.getTotalCount(searchKeyword, category);
	}

	@Override
	public List<Trade> searchListByKeyword(String searchKeyword, String category, int currentPage) {
		int limit = 8;
		int offset = (currentPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		return mapper.selectSearchList(searchKeyword, category, rowBounds);
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
	
	@Override
	public int countViewUpdate(int tradeNo) {
	    return mapper.countViewUpdate(tradeNo);
	}
	
	@Override
	public int updateTradeYn(int tradeNo, char tradeYn) {
	    return mapper.updateTradeYn(tradeNo, tradeYn);
	}

	@Override
	public List<Trade> getTradeByUserId(String userId) {
		return mapper.getTradeByUserId(userId);
	}
	
	@Override
	public String selectIdByTradeNo(int tradeNo) {
		return mapper.selectIdByTradeNo(tradeNo);
	}
	
}
