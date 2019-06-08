package com.hh.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hh.ssm.dao.ContractDetailMapper;
import com.hh.ssm.dao.DeliveryListMapper;
import com.hh.ssm.dao.InventoryMapper;
import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.DeliveryListDetailVO;
import com.hh.ssm.domain.vo.DeliveryListVO;
import com.hh.ssm.entity.ContractDetail;
import com.hh.ssm.entity.DeliveryList;
import com.hh.ssm.entity.DeliveryListDetail;
import com.hh.ssm.entity.Inventory;
import com.hh.ssm.service.IDeliveryListService;
import com.hh.ssm.util.ResultUtil;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
* Author ljk
* Date  2019-05-17
*/
@Service
public class DeliveryListServiceImpl implements IDeliveryListService {
    @Autowired
    private DeliveryListMapper deliveryListMapper;

    @Autowired
    private ContractDetailMapper contractDetailMapper;

    @Autowired
    private InventoryMapper inventoryMapper;

    @Override
    public EUDataGridResult getList(Integer page, Integer rows, DeliveryListVO vo) {
        PageHelper.startPage(page, rows);
        List<DeliveryListVO> vos = deliveryListMapper.findList(vo);
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(vos);
        //取记录总条数
        PageInfo<DeliveryListVO> pageInfo = new PageInfo<>(vos);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public EUDataGridResult findListBySelect(Integer page, Integer rows, DeliveryListVO vo) {
        PageHelper.startPage(page, rows);
        List<DeliveryListVO> vos = deliveryListMapper.findListBySelect(vo);
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(vos);
        //取记录总条数
        PageInfo<DeliveryListVO> pageInfo = new PageInfo<>(vos);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public DeliveryList get(String deliveryCode) {
        return deliveryListMapper.get(deliveryCode);
    }

    @Override
    public CustomResult insert(DeliveryListVO vo) {
        DeliveryList dl = new DeliveryList();
        BeanUtils.copyProperties(vo, dl);
        dl.setCreateTime(new Date(System.currentTimeMillis()));
        List<Map<String, Object>> list = vo.getDetails();
        /*
         * 校验1:产品出库数不大于合同未完成数量
         */
        //合同明细ID集合
        List<Integer> ids = new ArrayList<>();
        //产品Code集合
        List<String> prodCodes = new ArrayList<>();
        //合同产品与出库数量的对应关系
        Map<String, Integer> contProd = new HashMap<>(16);
        //产品与出库数量对应关系
        Map<String, Integer> prodNum = new HashMap<>(16);
        StringBuilder contIds = new StringBuilder();
        String contId, prodId, prodCode; Integer addNum;
        for(int i = 0, length = list.size(); i < length; i++) {
            Map<String, Object> map = list.get(i);
            contId = String.valueOf(map.get("contId"));
            prodId = String.valueOf(map.get("prodId"));
            prodCode = String.valueOf(map.get("prodCode"));
            addNum = Integer.valueOf((String) map.get("addNum"));
            if(!contIds.toString().contains(contId)) {
                contIds.append(contId).append(",");
            }
            if(!prodCodes.contains(prodCode)) {
                prodCodes.add(prodCode);
            }
            if(contProd.containsKey(contId + "," +prodId)) {
                addNum += contProd.get(contId + "," +prodId);
            }
            contProd.put(contId + "," +prodId, addNum);
            ids.add((Integer) map.get("id"));
            addNum = Integer.valueOf((String) map.get("addNum"));
            if(prodNum.containsKey(prodCode)) {
                addNum += prodNum.get(prodCode);
            }
            prodNum.put(prodCode, addNum);
        }
        List<ContractDetail> contractDetails =  contractDetailMapper.queryByIds(ids);
        for(int i = 0, length = contractDetails.size(); i < length; i++) {
            ContractDetail contractDetail = contractDetails.get(i);
            if(contractDetail.getUnQuantity() < contProd.get(contractDetail.getContId() + "," + contractDetail.getProdId())) {
                return ResultUtil.dealResult(-1, 101, "产品出库数大于合同数！");
            }
            contractDetail.setUnQuantity(contractDetail.getUnQuantity() - contProd.get(contractDetail.getContId() + "," + contractDetail.getProdId()));
        }
        /*
         * 校验2：出库数不大于库存可用数
         */
        List<Inventory> inventoryList = inventoryMapper.getProdInventory(prodCodes);
        if(inventoryList != null && inventoryList.size() > 0) {
            for(Inventory inventory : inventoryList) {
                if(inventory.getUsableQuantity() < prodNum.get(inventory.getProdCode())) {
                    return ResultUtil.dealResult(-1, 101, "产品库存不足！");
                }
                inventory.setUsableQuantity(inventory.getUsableQuantity() - prodNum.get(inventory.getProdCode()));
            }
        }else{
            return ResultUtil.dealResult(-1, 101, "产品库存不足！");
        }

        dl.setContracts(contIds.toString());
        //更新合同明细未完成数量
        contractDetailMapper.out(contractDetails);
        //库存预扣除
        inventoryMapper.updateBatchUsableQuantity(inventoryList);
        //新增出库单
        deliveryListMapper.insert(dl);
        //新增出库单明细
        Long deliveryListId = dl.getId();
        List<DeliveryListDetail> deliveryListDetails = new ArrayList<>();
        for(int i = 0, length = list.size(); i < length; i++) {
            Map<String, Object> map = list.get(i);
            DeliveryListDetail deliveryListDetail = new DeliveryListDetail();
            deliveryListDetail.setContId(Long.valueOf(map.get("contId") +""));
            deliveryListDetail.setProdId(Long.valueOf(map.get("prodId") + ""));
            deliveryListDetail.setQuantity(Integer.valueOf(map.get("addNum")+""));
            deliveryListDetail.setProdUnit((String) map.get("prodUnit"));
            deliveryListDetail.setDeliveryListId(deliveryListId);
            deliveryListDetails.add(deliveryListDetail);
        }
        deliveryListMapper.insertDetailBatch(deliveryListDetails);
        return ResultUtil.dealResult(1, 101, "");
    }

    @Override
    public List<DeliveryListDetailVO> getDetailsById(String id) {
        return deliveryListMapper.getDetailsById(id);
    }

    @Override
    public List<DeliveryListDetailVO> selectByDetailByDeliveryListId(Long id) {
        return deliveryListMapper.selectByDetailByDeliveryListId(id);
    }
}
