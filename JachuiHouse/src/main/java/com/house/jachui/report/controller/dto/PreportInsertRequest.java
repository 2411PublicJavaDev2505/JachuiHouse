package com.house.jachui.report.controller.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PreportInsertRequest {
	private int reportNo;
	private String userId;
	private Date reportDate;
	private String reportContent;
	private String reportReason;
	private int postNo;
}
