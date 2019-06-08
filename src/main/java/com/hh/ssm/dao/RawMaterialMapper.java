package com.hh.ssm.dao;

import com.hh.ssm.entity.RawMaterial;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface RawMaterialMapper {

    RawMaterial get(String id);

    List<RawMaterial> findList(RawMaterial rawMaterial);

    List<RawMaterial> findAllList();

    int insert(RawMaterial rawMaterial);

    int insertBatch(List<RawMaterial> rawMaterial);

    int update(RawMaterial rawMaterial);

    int updateAll(RawMaterial rawMaterial);

    int delete(String id);

    int deleteBatch(List<String> ids);

    List<RawMaterial> findListByIds(List<Long> ids);

    RawMaterial find(RawMaterial rawMaterial);
}