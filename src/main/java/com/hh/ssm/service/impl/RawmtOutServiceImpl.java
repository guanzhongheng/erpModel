package com.hh.ssm.service.impl;

import com.hh.ssm.dao.InventoryMapper;
import com.hh.ssm.dao.RawOutDetailInfoMapper;
import com.hh.ssm.dao.RawOutInfoMapper;
import com.hh.ssm.domain.customize.ActiveUser;
import com.hh.ssm.entity.Inventory;
import com.hh.ssm.entity.RawOutInfo;
import com.hh.ssm.entity.RawmtOutDetailInfo;
import com.hh.ssm.service.IRawmtOutService;
import com.hh.ssm.util.Const;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
* Author ljk
* Date  2019-05-17
*/
@Service
public class RawmtOutServiceImpl implements IRawmtOutService {

    @Autowired
    private InventoryMapper inventoryMapper;
    @Autowired
    private RawOutInfoMapper rawOutInfoMapper;
    @Autowired
    private RawOutDetailInfoMapper rawOutDetailInfoMapper;

    @Override
    public int out(RawOutInfo info) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmssSSS");
        info.setRawmtOutCode(Const.RAW_MT_OUT_PREFIX + sdf.format(new Date()));
        info.setStatus('0');
        ActiveUser user = (ActiveUser)SecurityUtils.getSubject().getPrincipal();
        info.setApplicant(user.getUsername());
        Map<String, Object> map = info.getMap();
        List<RawmtOutDetailInfo> details = new ArrayList<>();
        //校验原材料出库数不大于库存可用量
        List<String> codes = new ArrayList<>();
        for(Map.Entry<String, Object> entry : map.entrySet()) {
            codes.add(entry.getKey());
            RawmtOutDetailInfo detail = new RawmtOutDetailInfo();
            detail.setRawmtOutCode(info.getRawmtOutCode());
            detail.setOutNum((Integer)entry.getValue());
            detail.setRawCode(entry.getKey());
            details.add(detail);
        }
        List<Inventory> invs = inventoryMapper.getProdInventory(codes);
        if(invs != null && invs.size() > 0 && invs.size() == map.size()) {
            for(Inventory inv : invs) {
                if(inv.getUsableQuantity() < (Integer)map.get(inv.getProdCode())) {
                    //可用库存不足
                    return -1;
                }
                inv.setUsableQuantity(inv.getUsableQuantity() - (Integer)map.get(inv.getProdCode()));
            }
        }else{
            //可用库存不足
            return -1;
        }
        //库存预扣除
        inventoryMapper.updateBatchUsableQuantity(invs);
        //新增原材料出库申请单
        rawOutInfoMapper.insert(info);
        //新增出库单明细
        rawOutDetailInfoMapper.insertBatch(details);
        return 1;
    }

}
