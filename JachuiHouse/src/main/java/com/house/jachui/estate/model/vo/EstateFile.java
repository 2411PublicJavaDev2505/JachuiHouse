package com.house.jachui.estate.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EstateFile {

	private int estateFileNo;
	private String estateFileName;
	private String estateFilePath;
	private String estateFileRename;
	private int estateNo;
	private int estateFileOrder;
}
