package com.house.jachui.estate.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class EstateVO {

	private int estateNo;
	private String estateType;
	private String estateAddress;
	private int estateFloor;
	private int estateWidth;
	private Date estateMoveinDate;
	private String MoveinNowYn;
	private String estateRentType;
	private int estateDeposit;
	private int estateMonthlyRent;
	private String userId;
	private List<EstateOptionVO>estateOptionList;
	private List<EstateFile>estateFileileList;
	
}
