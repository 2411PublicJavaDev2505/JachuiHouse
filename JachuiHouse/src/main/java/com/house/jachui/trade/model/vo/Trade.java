package com.house.jachui.trade.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
//@Builder
public class Trade {
	private int tradeNo;
	private String userId;
	private String tradeTitle;
	private String tradeContent;
	private String tradePrice;
	private int viewCount;
	private Date writeDate;
	private String tradeFilename;
	private String tradeFileRename;
	private String tradeFilepath;
	private String tradeYn;
	private Date tradeDate;
	private String delYn;
}