package com.house.jachui.post.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PostVO {
	private int postNo;
	private String userId;
	private String postType;
	private String postTitle;
	private String postContent;
	private Date writeDate;
	private Date updateDate;
}
