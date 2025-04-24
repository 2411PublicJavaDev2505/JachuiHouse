package com.house.jachui.post.controller.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PostInsertRequest {
	private Integer postNo;
	private String userId;
	private String postType;
	private String postTitle;
	private String postContent;
}
