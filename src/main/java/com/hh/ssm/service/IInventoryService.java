package com.hh.ssm.service;

import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.*;
import com.hh.ssm.entity.Inventory;
import com.hh.ssm.entity.RawOutInfo;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface IInventoryService {
    Inventory get(String id);

    List<Inventory> findAllList();

    int insert(Inventory inventory);

    int insertBatch(List<Inventory> inventorys);

    int updateBatch(List<InventoryVo> voList);

    int update(InventoryVo vo);

    int delete(Inventory inventory);

    int updateRawMaterial(RawMaterialVO vo);

    int insertRawmater(RawMaterialVO vo);

    int updateThreadholdByBatch(List<RawMaterialVO> voList);

    List<RawmaterCheckoutDetailVo> findByRawOutCode(String rawOutCode);

    EUDataGridResult getList(int page, int rows, InventoryOperVo vo) throws Exception;

    EUDataGridResult getRawMaterList(int page, int rows, RawMaterialVO vo) throws Exception;

    EUDataGridResult getRawMaterCheckoutList(int page, int rows, RawOutInfo vo) throws Exception;

    int confirmRawMaterCheckout(List<RawmaterCheckoutDetailVo> ckLst);

    int confirmProductCheckout(List<DeliveryListDetailVO> ckLst);
}
