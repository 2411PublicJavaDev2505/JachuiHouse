package com.house.jachui.member.model.vo;

import java.sql.Date;

public class Member {
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userGender;
	private String userAddress;
	private Date userBirth;
	private String userPostcode;  //추가 erd에도 추가하기.
	private String userDetailAddress;  //추가 erd에도 추가하기.
	private String aloneLiving;
	private String userRole;
	private String realtorName;
	private String realtorNo;
	private String deleteYn;	// 이건 내가 넣어야하는건지 물어보기
	private String approveYn;  // 이건 내가 넣어야하는건지 물어보기
	private Date joinDate;		//추가 erd에도 추가하기.
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserPostcode() {
		return userPostcode;
	}
	public void setUserPostcode(String userPostcode) {
		this.userPostcode = userPostcode;
	}
	public String getUserDetailAddress() {
		return userDetailAddress;
	}
	public void setUserDetailAddress(String userDetailAddress) {
		this.userDetailAddress = userDetailAddress;
	}
	public String getAloneLiving() {
		return aloneLiving;
	}
	public void setAloneLiving(String aloneLiving) {
		this.aloneLiving = aloneLiving;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public String getRealtorName() {
		return realtorName;
	}
	public void setRealtorName(String realtorName) {
		this.realtorName = realtorName;
	}
	public String getRealtorNo() {
		return realtorNo;
	}
	public void setRealtorNo(String realtorNo) {
		this.realtorNo = realtorNo;
	}
	public String getDeleteYn() {
		return deleteYn;
	}
	public void setDeleteYn(String deleteYn) {
		this.deleteYn = deleteYn;
	}
	public String getApproveYn() {
		return approveYn;
	}
	public void setApproveYn(String approveYn) {
		this.approveYn = approveYn;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	@Override
	public String toString() {
		return "Member [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail=" + userEmail
				+ ", userPhone=" + userPhone + ", userGender=" + userGender + ", userAddress=" + userAddress
				+ ", userBirth=" + userBirth + ", userPostcode=" + userPostcode + ", userDetailAddress="
				+ userDetailAddress + ", aloneLiving=" + aloneLiving + ", userRole="
				+ userRole + ", realtorName=" + realtorName + ", realtorNo=" + realtorNo + ", deleteYn=" + deleteYn
				+ ", approveYn=" + approveYn + ", joinDate=" + joinDate + "]";
	}

	
}
