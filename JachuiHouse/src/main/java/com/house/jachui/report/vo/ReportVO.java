package com.house.jachui.report.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ReportVO {
	private int reportNo;
	private String userId;
	private Date reportDate;
	private String reportContent;
	private String reportReason;
	private int postNo;
}
