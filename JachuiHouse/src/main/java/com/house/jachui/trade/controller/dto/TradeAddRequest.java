package com.house.jachui.trade.controller.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TradeAddRequest {
	private int tradeNo;
	private String userId;
	private String tradeTitle;
	private String tradeContent;
	private String tradePrice;
	private String tradeFilename;
	private String tradeFileRename;
	private String tradeFilepath;
}

