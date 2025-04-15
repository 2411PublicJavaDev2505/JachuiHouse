package com.house.jachui.estate.model.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.house.jachui.estate.model.mapper.EstateMapper;
import com.house.jachui.estate.model.service.EstateService;
import com.house.jachui.estate.model.vo.Estate;

@Service
public class EstateServiceImpl implements EstateService {

    private final EstateMapper estateMapper;

    @Autowired
    public EstateServiceImpl(EstateMapper estateMapper) {
        this.estateMapper = estateMapper;
    }

    @Override
    public List<Estate> getEstateList() {
        return estateMapper.selectEstateList();
    }
}
