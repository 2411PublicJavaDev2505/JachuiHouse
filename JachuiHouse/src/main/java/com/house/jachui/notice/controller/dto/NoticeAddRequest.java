package com.house.jachui.notice.controller.dto;

public class NoticeAddRequest {
	private String noticeType;
	private String noticeTitle;
	private String noticeContent;
	private String noticeFileName;
	private String noticeFileRename;
	private String noticeFilePath;
	private String userId;

	public NoticeAddRequest() {}

	public NoticeAddRequest(String noticeType, String noticeTitle, String noticeContent, String noticeFileName,
			String noticeFileRename, String noticeFilePath, String userId) {
		super();
		this.noticeType = noticeType;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeFileName = noticeFileName;
		this.noticeFileRename = noticeFileRename;
		this.noticeFilePath = noticeFilePath;
		this.userId = userId;
	}



	public String getUserId() {
		return userId;
	}



	public void setUserId(String userId) {
		this.userId = userId;
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

	public String getNoticeFileName() {
		return noticeFileName;
	}

	public void setNoticeFileName(String noticeFileName) {
		this.noticeFileName = noticeFileName;
	}

	public String getNoticeFileRename() {
		return noticeFileRename;
	}

	public void setNoticeFileRename(String noticeFileRename) {
		this.noticeFileRename = noticeFileRename;
	}

	public String getNoticeFilePath() {
		return noticeFilePath;
	}

	public void setNoticeFilePath(String noticeFilePath) {
		this.noticeFilePath = noticeFilePath;
	}



	@Override
	public String toString() {
		return "NoticeAddRequest [noticeType=" + noticeType + ", noticeTitle=" + noticeTitle + ", noticeContent="
				+ noticeContent + ", noticeFileName=" + noticeFileName + ", noticeFileRename=" + noticeFileRename
				+ ", noticeFilePath=" + noticeFilePath + ", userId=" + userId + "]";
	}

}
