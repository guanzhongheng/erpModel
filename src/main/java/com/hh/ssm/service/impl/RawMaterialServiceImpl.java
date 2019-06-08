package com.hh.ssm.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hh.ssm.dao.InventoryMapper;
import com.hh.ssm.dao.RawMaterialMapper;
import com.hh.ssm.domain.customize.ActiveUser;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.entity.Inventory;
import com.hh.ssm.entity.RawMaterial;
import com.hh.ssm.entity.RawOutInfo;
import com.hh.ssm.entity.RawmtOutDetailInfo;
import com.hh.ssm.service.IRawMaterialService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.util.Map;

/**
* Author ljk
* Date  2019-05-17
*/
@Service
public class RawMaterialServiceImpl implements IRawMaterialService {
    @Autowired
    private RawMaterialMapper rawMaterialMapper;

    @Autowired
    private InventoryMapper inventoryMapper;

    @Override
    public RawMaterial get(String id){
        return rawMaterialMapper.get(id);
    }

    @Override
    public List<RawMaterial> findList(RawMaterial rawMaterial) {
        return rawMaterialMapper.findList(rawMaterial);
    }

    @Override
    public List<RawMaterial> findAllList() {
        return rawMaterialMapper.findAllList();
    }

    @Override
    public int insert(RawMaterial rawMaterial) {
        return rawMaterialMapper.insert(rawMaterial);
    }

    @Override
    public int insertBatch(List<RawMaterial> rawMaterials){
        return rawMaterialMapper.insertBatch(rawMaterials);
    }

    @Override
    public int update(RawMaterial rawMaterial) {
        return rawMaterialMapper.update(rawMaterial);
    }

    @Override
    public int updateAll(RawMaterial rawMaterial) {
        return rawMaterialMapper.updateAll(rawMaterial);
    }

    @Override
    public int delete(String id) {
        return rawMaterialMapper.delete(id);
    }

    @Override
    public int deleteBatch(List<String> ids) {
        return rawMaterialMapper.deleteBatch(ids);
    }

    @Override
    public EUDataGridResult getList(int page, int rows, RawMaterial rawMaterial) throws Exception {
        //分页处理
        PageHelper.startPage(page, rows);
        List<RawMaterial> list = rawMaterialMapper.findList(rawMaterial);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<RawMaterial> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public RawMaterial find(RawMaterial rawMaterial) {
        return rawMaterialMapper.find(rawMaterial);
    }
}
