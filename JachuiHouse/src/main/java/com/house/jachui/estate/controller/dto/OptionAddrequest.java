package com.house.jachui.estate.controller.dto;

import java.util.List;

import com.house.jachui.estate.model.vo.EstateOption;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class OptionAddrequest {

	private int optionNo;
	private int estateNo;
	private List<EstateOption>estateOptionList;
}
