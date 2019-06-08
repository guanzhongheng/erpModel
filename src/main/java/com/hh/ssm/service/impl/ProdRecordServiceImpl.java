package com.hh.ssm.service.impl;

import com.hh.ssm.dao.ProdRecordMapper;
import com.hh.ssm.entity.ProdRecord;
import com.hh.ssm.service.IProdRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
@Service
public class ProdRecordServiceImpl implements IProdRecordService {
    @Autowired
    private ProdRecordMapper prodRecordMapper;

    @Override
    public ProdRecord get(String id){
        return prodRecordMapper.get(id);
    }

    @Override
    public List<ProdRecord> findList(ProdRecord prodRecord) {
        return prodRecordMapper.findList(prodRecord);
    }

    @Override
    public List<ProdRecord> findAllList() {
        return prodRecordMapper.findAllList();
    }

    @Override
    public int insert(ProdRecord prodRecord) {
        return prodRecordMapper.insert(prodRecord);
    }

    @Override
    public int insertBatch(List<ProdRecord> prodRecords){
        return prodRecordMapper.insertBatch(prodRecords);
    }

    @Override
    public int update(ProdRecord prodRecord) {
        return prodRecordMapper.update(prodRecord);
    }

    @Override
    public int delete(ProdRecord prodRecord) {
        return prodRecordMapper.delete(prodRecord);
    }

}
