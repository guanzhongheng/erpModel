package com.hh.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hh.ssm.common.DictUtils;
import com.hh.ssm.dao.*;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.*;
import com.hh.ssm.entity.*;
import com.hh.ssm.service.IInventoryService;
import com.hh.ssm.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
@Service
public class InventoryServiceImpl implements IInventoryService {
    @Autowired
    private InventoryMapper inventoryMapper;
    @Autowired
    private RawMaterialMapper rawMaterialMapper;
    @Autowired
    private RawOutInfoMapper rawOutInfoMapper;
    @Autowired
    private RawOutDetailInfoMapper rawOutDetailInfoMapper;
    @Autowired
    private DeliveryListMapper deliveryListMapper;

    @Override
    public Inventory get(String id) {
        return inventoryMapper.get(id);
    }


    @Override
    public List<Inventory> findAllList() {
        return inventoryMapper.findAllList();
    }

    @Override
    public int insert(Inventory inventory) {
        return inventoryMapper.insert(inventory);
    }

    @Override
    public int insertBatch(List<Inventory> inventorys) {
        return inventoryMapper.insertBatch(inventorys);
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int updateBatch(List<InventoryVo> voList) {
        if (voList != null && !voList.isEmpty()) {
            Date current = new Date();
            List<Inventory> pos = new ArrayList<>(voList.size());
            Inventory po;
            for (InventoryVo vo : voList) {
                po = new Inventory();
                po.setId(vo.getId());
                po.setQuantity(vo.getAddNum());
                po.setUsableQuantity(vo.getAddNum());
                po.setProdCode(vo.getProCode());
                po.setProdName(vo.getProName());
                po.setCreateTime(current);
                po.setUpdateTime(current);
                pos.add(po);
            }
            return inventoryMapper.insertOrUpdateByBatch(pos);
        }
        return 0;
    }

    @Override
    public int update(InventoryVo vo) {
        Inventory po = new Inventory();
        po.setId(vo.getId());
        po.setQuantity(vo.getAddNum());
        po.setUsableQuantity(vo.getAddNum());
        po.setUpdateTime(new Date());
        return inventoryMapper.update(po);
    }

    @Override
    public int delete(Inventory inventory) {
        return inventoryMapper.delete(inventory);
    }

    @Override
    public int updateRawMaterial(RawMaterialVO vo) {
        Date current = new Date();
        Inventory inventory = new Inventory();
        inventory.setId(vo.getId());
        inventory.setUsableQuantity(vo.getAddNum());
        inventory.setQuantity(vo.getAddNum());
        inventory.setUpdateTime(current);
        return inventoryMapper.update(inventory);
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int insertRawmater(RawMaterialVO vo) {
        Date current = new Date();
        RawMaterial rawMDb = DictUtils.getRawMaterById(vo.getId());
        Long prodId = rawMDb.getId();
        if (!(rawMDb.getCode().equals(vo.getCode()) && rawMDb.getSupplier().equals(vo.getSupplier()))) {
            RawMaterial rawMaterial = new RawMaterial();
            rawMaterial.setCode(vo.getCode());
            rawMaterial.setName(vo.getName());
            rawMaterial.setSupplier(vo.getSupplier());
            rawMaterial.setAttachment(vo.getAttachment());
            rawMaterial.setCreateTime(current);
            rawMaterialMapper.insert(rawMaterial);
            DictUtils.putRawMaterial(rawMaterial);
            prodId = rawMaterial.getId();

        }
        //更新库存
        Inventory inventory = new Inventory();
        inventory.setQuantity(vo.getAddNum());
        inventory.setUsableQuantity(vo.getAddNum());
        inventory.setProdCode(vo.getCode());
        inventory.setProdName(vo.getName());
        inventory.setProdId(prodId);
        inventory.setUnit(vo.getUnit());
        inventory.setCreateTime(current);
        inventory.setUpdateTime(current);
        List<Inventory> list = new ArrayList<>();
        list.add(inventory);

        return inventoryMapper.insertOrUpdateByBatch(list);
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int updateThreadholdByBatch(List<RawMaterialVO> voList) {
        Date current = new Date();
        if (voList != null && !voList.isEmpty()) {
            List<Inventory> list = new ArrayList<>(voList.size());
            for (RawMaterialVO vo :
                    voList) {
                Inventory po = new Inventory();
                po.setId(vo.getId());
                po.setThreshold(vo.getThreshold());
                po.setUpdateTime(current);
                list.add(po);
            }

            return inventoryMapper.updateThresholdByBatch(list);
        }
        return 0;
    }

    @Override
    public List<RawmaterCheckoutDetailVo> findByRawOutCode(String rawOutCode) {
        return inventoryMapper.findRawCheckoutDetail(rawOutCode);
    }


    @Override
    public EUDataGridResult getList(int page, int rows, InventoryOperVo vo) throws Exception {
        //分页处理
        PageHelper.startPage(page, rows);
        Integer flg = null;
        String contId = null;
        if (vo != null) {
            flg = vo.getFlg();
            contId = vo.getContId();
        }
        List<InventoryVo> list = inventoryMapper.findList(contId, flg);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<InventoryVo> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public EUDataGridResult getRawMaterList(int page, int rows, RawMaterialVO vo) throws Exception {
        //分页处理
        PageHelper.startPage(page, rows);
        List<RawMaterialVO> list = inventoryMapper.findRawMaterList(vo);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<RawMaterialVO> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public EUDataGridResult getRawMaterCheckoutList(int page, int rows, RawOutInfo vo) throws Exception {
        //分页处理
        PageHelper.startPage(page, rows);
        List<RawOutInfo> list = rawOutInfoMapper.findList(vo);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<RawOutInfo> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int confirmRawMaterCheckout(List<RawmaterCheckoutDetailVo> ckLst) {
        if (ckLst != null && !ckLst.isEmpty()) {
            Date current = new Date();
            List<Inventory> invs = new ArrayList<>(ckLst.size());
            boolean isUpdate = false;
            for (RawmaterCheckoutDetailVo rcd : ckLst) {
                if (rcd.getOutNum() <= 0) {
                    return -1;
                } else if (rcd.getRawInvTotal() < rcd.getOutNum()) {
                    return -2;
                }
                if (!rcd.getOutNum().equals(rcd.getOperOutNum())) {
                    isUpdate = true;
                }
                Inventory inv = new Inventory();
                inv.setId(rcd.getInvId());
                inv.setQuantity(-rcd.getOutNum());
                inv.setUsableQuantity(-rcd.getOutNum());
                inv.setUpdateTime(current);
                invs.add(inv);
            }

            int res = inventoryMapper.updateInvNumByBatch(invs);
            if (res > 0) {
                char status = '1';
                if (isUpdate) {
                    status = '2';
                    RawOutInfo rawOutInfo = new RawOutInfo();
                    rawOutInfo.setApplicant(ckLst.get(0).getApplicant());
                    String rmtRawCode = StringUtils.genString("YCLSQD");
                    rawOutInfo.setRawmtOutCode(rmtRawCode);
                    rawOutInfo.setCreateTime(current);
                    rawOutInfo.setStatus('1');
                    rawOutInfoMapper.insert(rawOutInfo);
                    List<RawmtOutDetailInfo> detaiLst = new ArrayList<>(ckLst.size());
                    for (RawmaterCheckoutDetailVo vo :
                            ckLst) {
                        RawmtOutDetailInfo detail = new RawmtOutDetailInfo();
                        detail.setOutNum(vo.getOperOutNum());
                        detail.setRawCode(vo.getRawCode());
                        detail.setRawmtOutCode(rmtRawCode);
                        detail.setCreateTime(current);
                        detaiLst.add(detail);
                    }
                    rawOutDetailInfoMapper.insertBatch(detaiLst);
                }
                RawOutInfo rawOutInfo = new RawOutInfo();
                rawOutInfo.setRawmtOutCode(ckLst.get(0).getRawmtOutCode());
                rawOutInfo.setStatus(status);
                rawOutInfo.setUpdateTime(current);
                return rawOutInfoMapper.updateByselect(rawOutInfo);

            }

        }
        return 0;
    }

    @Transactional(isolation = Isolation.READ_COMMITTED, rollbackFor = Exception.class)
    @Override
    public int confirmProductCheckout(List<DeliveryListDetailVO> ckLst) {
        if (ckLst != null && !ckLst.isEmpty()) {
            Date current = new Date();
            List<Inventory> invs = new ArrayList<>(ckLst.size());
            for (DeliveryListDetailVO dl :
                    ckLst) {
                if (dl.getQuantity() < 0) {
                    return -1;
                } else if (dl.getQuantity() > dl.getInvTotal()) {
                    return -2;
                }
                Inventory inv = new Inventory();
                inv.setId(dl.getInvId());
                inv.setQuantity(-dl.getQuantity());
                inv.setUsableQuantity(-dl.getQuantity());
                inv.setUpdateTime(current);
                invs.add(inv);
            }
            int res = inventoryMapper.updateInvNumByBatch(invs);
            if (res > 0) {
                DeliveryList dlPo = new DeliveryList();
                dlPo.setId(ckLst.get(0).getDeliveryListId());
                dlPo.setStatus('1');
                dlPo.setUpdateTime(current);
                return deliveryListMapper.updateBySelect(dlPo);
            }
        }
        return 0;
    }

}
