package com.hh.ssm.service;

import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.entity.RawMaterial;
import com.hh.ssm.entity.RawOutInfo;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface IRawMaterialService {
    RawMaterial get(String id);

    List<RawMaterial> findList(RawMaterial rawMaterial);

    List<RawMaterial> findAllList();

    int insert(RawMaterial rawMaterial);

    int insertBatch(List<RawMaterial> rawMaterials);

    int update(RawMaterial rawMaterial);

    int updateAll(RawMaterial rawMaterial);

    int delete(String code);

    int deleteBatch(List<String> ids);

    EUDataGridResult getList(int page, int rows, RawMaterial rawMaterial) throws Exception;

    RawMaterial find(RawMaterial rawMaterial);

}
