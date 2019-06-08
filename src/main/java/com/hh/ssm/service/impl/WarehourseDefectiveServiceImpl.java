package com.hh.ssm.service.impl;

import com.hh.ssm.dao.WarehourseDefectiveMapper;
import com.hh.ssm.entity.WarehourseDefective;
import com.hh.ssm.service.IWarehourseDefectiveService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
@Service
public class WarehourseDefectiveServiceImpl implements IWarehourseDefectiveService {
    @Autowired
    private WarehourseDefectiveMapper warehourseDefectiveMapper;

    @Override
    public WarehourseDefective get(String id){
        return warehourseDefectiveMapper.get(id);
    }

    @Override
    public List<WarehourseDefective> findList(WarehourseDefective warehourseDefective) {
        return warehourseDefectiveMapper.findList(warehourseDefective);
    }

    @Override
    public List<WarehourseDefective> findAllList() {
        return warehourseDefectiveMapper.findAllList();
    }

    @Override
    public int insert(WarehourseDefective warehourseDefective) {
        return warehourseDefectiveMapper.insert(warehourseDefective);
    }

    @Override
    public int insertBatch(List<WarehourseDefective> warehourseDefectives){
        return warehourseDefectiveMapper.insertBatch(warehourseDefectives);
    }

    @Override
    public int update(WarehourseDefective warehourseDefective) {
        return warehourseDefectiveMapper.update(warehourseDefective);
    }

    @Override
    public int delete(WarehourseDefective warehourseDefective) {
        return warehourseDefectiveMapper.delete(warehourseDefective);
    }

}
