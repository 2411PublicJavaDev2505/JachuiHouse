package com.house.jachui.estate.controller.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EstateAddRequest {
	
	private int estateNo;
	private String estateType;
	private String estateAddress;
	private int estateFloor;
	private int estateWidth;
	private Date estateMoveinDate;
	private String moveinNowYN;
	private String estateRentType;
	private int estateDeposit;
	private int estateMonthlyRent;
	private String userId;
}
