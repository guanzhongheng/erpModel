package com.hh.ssm.dao;

import com.hh.ssm.domain.vo.InventoryVo;
import com.hh.ssm.domain.vo.RawMaterialVO;
import com.hh.ssm.domain.vo.RawmaterCheckoutDetailVo;
import com.hh.ssm.entity.Inventory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface InventoryMapper {

    Inventory get(String id);

    List<InventoryVo> findList(@Param("contId") String conId,@Param("flg") Integer flg);

    List<RawMaterialVO> findRawMaterList(RawMaterialVO vo);

    List<Inventory> findAllList();

    int insert(Inventory inventory);

    int insertBatch(List<Inventory> inventorys);

    int insertOrUpdateByBatch(@Param("list") List<Inventory> list);

    int updateThresholdByBatch(@Param("list") List<Inventory> list);

    int update(Inventory inventory);

    int delete(Inventory inventory);

    List<RawmaterCheckoutDetailVo> findRawCheckoutDetail(String  rawOutCode);

    int updateInvNumByBatch(@Param("list")List<Inventory> invs);

    List<Inventory> getProdInventory(List<String> prodCodes);

    int updateBatchUsableQuantity(List<Inventory> inventorys);
}