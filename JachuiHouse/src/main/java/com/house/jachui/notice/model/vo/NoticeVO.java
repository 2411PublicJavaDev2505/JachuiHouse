package com.house.jachui.notice.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	
	private int noticeNo;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeWriteDate;
	private Date noticeModifyDate;
	private String noticeFileName;
	private String noticeFileRename;
	private String noticeFilePath;
	private String userId;
	
}
