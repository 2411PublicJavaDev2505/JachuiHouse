package com.house.jachui.notice.model.vo;

import java.util.Date;

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
	
	public NoticeVO() {}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public Date getNoticeWriteDate() {
		return noticeWriteDate;
	}

	public void setNoticeWriteDate(Date noticeWriteDate) {
		this.noticeWriteDate = noticeWriteDate;
	}

	public Date getNoticeModifyDate() {
		return noticeModifyDate;
	}

	public void setNoticeModifyDate(Date noticeModifyDate) {
		this.noticeModifyDate = noticeModifyDate;
	}

	public String getNoticeFileName() {
		return noticeFileName;
	}

	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}

	public String getNoticeFilePath() {
		return noticeFilePath;
	}

	public void setNoticeFilePath(String noticeFilePath) {
		this.noticeFilePath = noticeFilePath;
	}

	public String getNoticeFileRename() {
		return noticeFileRename;
	}

	public void setNoticeFileRename(String noticeFileRename) {
		this.noticeFileRename = noticeFileRename;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "noticeVO [noticeNo=" + noticeNo + ", noticeType=" + noticeType + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeWriteDate=" + noticeWriteDate + ", noticeModifyDate="
				+ noticeModifyDate + ", noticeFileName=" + noticeFileName + ", noticeFilePath=" + noticeFilePath
				+ ", noticeFileRename=" + noticeFileRename + ", userId=" + userId + "]";
	}
	
	

}
