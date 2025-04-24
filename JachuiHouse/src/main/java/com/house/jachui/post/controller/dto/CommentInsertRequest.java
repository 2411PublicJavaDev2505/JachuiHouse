package com.house.jachui.post.controller.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentInsertRequest {
	private int commentNo;
	private String userId;
	private String commentContent;
	private Date writeDate;
	private Date updateDate;
	private int postNo;
}
