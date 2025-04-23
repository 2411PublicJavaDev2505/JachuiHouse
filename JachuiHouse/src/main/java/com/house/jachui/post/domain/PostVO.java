package com.house.jachui.post.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
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
