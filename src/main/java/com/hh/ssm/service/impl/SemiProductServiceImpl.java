package com.hh.ssm.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hh.ssm.dao.RawMaterialMapper;
import com.hh.ssm.dao.SemiProductMapper;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.RawMaterialVO;
import com.hh.ssm.entity.RawMaterial;
import com.hh.ssm.entity.SemiProduct;
import com.hh.ssm.service.ISemiProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
* Author ljk
* Date  2019-05-17
*/
@Service
public class SemiProductServiceImpl implements ISemiProductService {
    @Autowired
    private SemiProductMapper semiProductMapper;
    @Autowired
    private RawMaterialMapper rawMaterialMapper;

    @Override
    public SemiProduct get(String id){
        return semiProductMapper.get(id);
    }

    @Override
    public List<SemiProduct> findAllList() {
        return semiProductMapper.findAllList();
    }

    @Override
    public int insert(SemiProduct semiProduct) {
        return semiProductMapper.insert(semiProduct);
    }

    @Override
    public int insertBatch(List<SemiProduct> semiProducts){
        return semiProductMapper.insertBatch(semiProducts);
    }

    @Override
    public int update(SemiProduct semiProduct) {
        return semiProductMapper.update(semiProduct);
    }

    @Override
    public int updateAll(SemiProduct SemiProduct) {
        return semiProductMapper.updateAll(SemiProduct);
    }

    @Override
    public int delete(String id) {
        return semiProductMapper.delete(id);
    }

    @Override
    public int deleteBatch(List<String> ids) {
        return semiProductMapper.deleteBatch(ids);
    }

    @Override
    public List<SemiProduct> findByIds(List<Long> ids) {
        return semiProductMapper.findListByIds(ids);
    }

    @Override
    public EUDataGridResult getList(int page, int rows, SemiProduct semiProduct) throws Exception {
        //分页处理
        PageHelper.startPage(page, rows);
        List<SemiProduct> list = semiProductMapper.findList(semiProduct);
        //创建一个返回值对象
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<SemiProduct> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public List<RawMaterialVO> getRawMaterialBySemiProdId(String id) {
        List<RawMaterialVO> vos = new ArrayList<>();
        SemiProduct semiProduct = get(id);
        JSONArray array = JSON.parseArray(semiProduct.getRawMaterialCons());
        if(!array.isEmpty()) {
            List<Long> ids = new ArrayList<>();
            Map<Long, String> map = new HashMap<>(array.size() + 8);
            Long rawMaterialId;
            for(int i = 0, length = array.size(); i < length; i++) {
                JSONObject object = array.getJSONObject(i);
                rawMaterialId = object.getLong("id");
                ids.add(rawMaterialId);
                if(object.containsKey("quantity") && object.containsKey("unit")) {
                    map.put(rawMaterialId,object.getString("quantity") + "," + object.getString("unit"));
                }
            }
            List<RawMaterial> list = rawMaterialMapper.findListByIds(ids);
            RawMaterial rawMaterial;
            for(int i = 0, length = list.size(); i < length; i++) {
                RawMaterialVO vo = new RawMaterialVO();
                rawMaterial = list.get(i);
                vo.setId(rawMaterial.getId());
                vo.setName(rawMaterial.getName());
                vo.setCode(rawMaterial.getCode());
                vo.setSupplier(rawMaterial.getSupplier());
                String value = map.get(rawMaterial.getId());
                if(value != null && value.contains(",") && value.split(",").length > 1) {
                    vo.setQuantity(Integer.valueOf(map.get(rawMaterial.getId()).split(",")[0]));
                    vo.setUnit(map.get(rawMaterial.getId()).split(",")[1]);
                }
                vos.add(vo);
            }
        }
        return vos;
    }

    @Override
    public List<SemiProduct> getList(SemiProduct semiProduct) throws Exception {
        return semiProductMapper.findList(semiProduct);
    }

}
