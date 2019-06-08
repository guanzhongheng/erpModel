package com.hh.ssm.service.impl;

import com.hh.ssm.dao.WarehourseEntryMapper;
import com.hh.ssm.entity.WarehourseEntry;
import com.hh.ssm.service.IWarehourseEntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
@Service
public class WarehourseEntryServiceImpl implements IWarehourseEntryService {
    @Autowired
    private WarehourseEntryMapper warehourseEntryMapper;

    @Override
    public WarehourseEntry get(String id){
        return warehourseEntryMapper.get(id);
    }

    @Override
    public List<WarehourseEntry> findList(WarehourseEntry warehourseEntry) {
        return warehourseEntryMapper.findList(warehourseEntry);
    }

    @Override
    public List<WarehourseEntry> findAllList() {
        return warehourseEntryMapper.findAllList();
    }

    @Override
    public int insert(WarehourseEntry warehourseEntry) {
        return warehourseEntryMapper.insert(warehourseEntry);
    }

    @Override
    public int insertBatch(List<WarehourseEntry> warehourseEntrys){
        return warehourseEntryMapper.insertBatch(warehourseEntrys);
    }

    @Override
    public int update(WarehourseEntry warehourseEntry) {
        return warehourseEntryMapper.update(warehourseEntry);
    }

    @Override
    public int delete(WarehourseEntry warehourseEntry) {
        return warehourseEntryMapper.delete(warehourseEntry);
    }

}
