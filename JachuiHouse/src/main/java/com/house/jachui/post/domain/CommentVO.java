package com.house.jachui.post.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class CommentVO {
	private int commentNo;
	private String userId;
	private String commentContent;
	private Date writeDate;
	private Date updateDate;
	private int postNo;
}
