package com.hh.ssm.dao;

import com.hh.ssm.entity.ProdRecord;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface ProdRecordMapper {

    ProdRecord get(String id);

    List<ProdRecord> findList(ProdRecord prodRecord);

    List<ProdRecord> findAllList();

    int insert(ProdRecord prodRecord);

    int insertBatch(List<ProdRecord> prodRecords);

    int update(ProdRecord prodRecord);

    int delete(ProdRecord prodRecord);

}