package com.hh.ssm.dao;

import com.hh.ssm.entity.WarehourseDefective;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface WarehourseDefectiveMapper {

    WarehourseDefective get(String id);

    List<WarehourseDefective> findList(WarehourseDefective warehourseDefective);

    List<WarehourseDefective> findAllList();

    int insert(WarehourseDefective warehourseDefective);

    int insertBatch(List<WarehourseDefective> warehourseDefectives);

    int update(WarehourseDefective warehourseDefective);

    int delete(WarehourseDefective warehourseDefective);

}