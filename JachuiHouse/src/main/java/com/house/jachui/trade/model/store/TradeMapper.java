package com.house.jachui.trade.model.store;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.house.jachui.trade.controller.dto.TradeAddRequest;
import com.house.jachui.trade.controller.dto.TradeUpdateRequest;
import com.house.jachui.trade.model.vo.Trade;

@Mapper
public interface TradeMapper {

	List<Trade> selectListAll(RowBounds rowBounds);

	List<Trade> selectSearchList(String searchKeyword, String category, RowBounds rowBounds);

	Trade selectOneByNo(int tradeNo);
	
	int getTotalCount();

	int getTotalCount(String searchKeyword, String category);

	int insertTrade(TradeAddRequest trade);

	int updateTrade(TradeUpdateRequest trade);

	int deleteTrade(int tradeNo);
	
	int countViewUpdate(int tradeNo);



	int updateTradeYn(@Param("tradeNo") int tradeNo, @Param("tradeYn") char tradeYn);

	List<Trade> getTradeByUserId(String userId);
	
}
