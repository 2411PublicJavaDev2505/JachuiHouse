package com.house.jachui.estate.model.service;

import java.util.List;

import com.house.jachui.estate.controller.dto.CheckedOption;
import com.house.jachui.estate.model.vo.EstateOption;

public interface OptionService {

	List<EstateOption> selectOptionList(int estateNo);

	List<CheckedOption> getOptionsWithCheck(int estateNo);

}
