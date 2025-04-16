package com.house.jachui.notice.controller.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeModifyRequest {
	private int noticeNo;
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFileName;
	private String noticeFileRename;
	private String noticeFilePath;
	private String userId;
	
	public NoticeModifyRequest() {}

	public NoticeModifyRequest(int noticeNo, String noticeType, String noticeTitle, String noticeContent,
			String noticeFileName, String noticeFileRename, String noticeFilePath, String userId) {
		super();
		this.noticeNo = noticeNo;
		this.noticeType = noticeType;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeFileName = noticeFileName;
		this.noticeFileRename = noticeFileRename;
		this.noticeFilePath = noticeFilePath;
		this.userId = userId;
	}
	
	

}
