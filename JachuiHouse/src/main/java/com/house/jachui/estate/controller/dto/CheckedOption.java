package com.house.jachui.estate.controller.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CheckedOption {

	private int optionNo;
    private String optionName;
    private String optionImg;
    private boolean checked;
}
