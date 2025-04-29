package com.house.jachui.member.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberAddRequest {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userGender;
	private String userAddress;
	private String userPostcode;  //추가 erd에도 추가하기.
	private String userDetailAddress;  //추가 erd에도 추가하기.
	private String aloneLiving;
	private String userRole;
	private String realtorName;
	private String realtorNo;
	private String deleteYn;	
	private String approveYn;  
	private String profileImage; // 이미지 관련 추가
	private String fileName;
	private String fileRename;
	private String filePath;
	
	public MemberAddRequest() {}
	
	public MemberAddRequest(String userId, String userPw, String userName, String userEmail, String userPhone,
			String userGender, String userAddress, String userPostcode, String userDetailAddress, String aloneLiving,
			String userRole, String realtorName, String realtorNo, String deleteYn, String approveYn,
			String profileImage, String fileName, String fileRename, String filePath) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userGender = userGender;
		this.userAddress = userAddress;
		this.userPostcode = userPostcode;
		this.userDetailAddress = userDetailAddress;
		this.aloneLiving = aloneLiving;
		this.userRole = userRole;
		this.realtorName = realtorName;
		this.realtorNo = realtorNo;
		this.deleteYn = deleteYn;
		this.approveYn = approveYn;
		this.profileImage = profileImage;
		this.fileName = fileName;
		this.fileRename = fileRename;
		this.filePath = filePath;
	}

}
