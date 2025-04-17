package com.house.jachui.trade.model.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.house.jachui.trade.controller.dto.TradeAddRequest;
import com.house.jachui.trade.model.vo.Trade;

@Mapper
public interface TradeMapper {

	Trade selectOneByNo(int tradeNo);

	List<Trade> selectListAll();

	List<Trade> selectAllTrade(int currentPage);

	int getTotalCount();




}