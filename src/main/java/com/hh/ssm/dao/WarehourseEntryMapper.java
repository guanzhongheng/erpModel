package com.hh.ssm.dao;

import com.hh.ssm.entity.WarehourseEntry;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface WarehourseEntryMapper {

    WarehourseEntry get(String id);

    List<WarehourseEntry> findList(WarehourseEntry warehourseEntry);

    List<WarehourseEntry> findAllList();

    int insert(WarehourseEntry warehourseEntry);

    int insertBatch(List<WarehourseEntry> warehourseEntrys);

    int update(WarehourseEntry warehourseEntry);

    int delete(WarehourseEntry warehourseEntry);

}