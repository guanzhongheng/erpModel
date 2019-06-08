package com.hh.ssm.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hh.ssm.dao.ProductMapper;
import com.hh.ssm.dao.SemiProductMapper;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.ProductVO;
import com.hh.ssm.domain.vo.SemiProductVO;
import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.SemiProduct;
import com.hh.ssm.service.IProductService;
import org.springframework.beans.BeanUtils;
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
public class ProductServiceImpl implements IProductService {
    @Autowired
    private ProductMapper productMapper;

    @Autowired
    private SemiProductMapper semiProductMapper;

    @Override
    public Product get(String id){
        return productMapper.get(id);
    }

    @Override
    public List<Product> findAllList() { return productMapper.findAllList(); }

    @Override
    public int insert(Product product) {
        return productMapper.insert(product);
    }

    @Override
    public int insertBatch(List<Product> products){
        return productMapper.insertBatch(products);
    }

    @Override
    public int update(Product product) {
        return productMapper.update(product);
    }

    @Override
    public int updateAll(Product product) {
        return productMapper.updateAll(product);
    }
    @Override
    public int delete(String id) {
        return productMapper.delete(id);
    }

    @Override
    public int deleteBatch(List<String> ids) {
        return productMapper.deleteBatch(ids);
    }

    @Override
    public List<Product> findByIds(List<Long> ids) {
        return productMapper.findListByIds(ids);
    }

    @Override
    public EUDataGridResult getList(int page, int rows, Product product) throws Exception {
        //分页处理
        PageHelper.startPage(page, rows);
        //创建一个返回值对象
        List<Product> list = productMapper.findList(product);
        EUDataGridResult result = new EUDataGridResult();
        result.setRows(list);
        //取记录总条数
        PageInfo<Product> pageInfo = new PageInfo<>(list);
        result.setTotal(pageInfo.getTotal());
        return result;
    }

    @Override
    public List<SemiProductVO> getSemiProdByProdId(String id) throws Exception {
        List<SemiProductVO> vos = new ArrayList<>();
        Product product = get(id);
        JSONArray array = JSON.parseArray(product.getSemiProdCons());
        if(!array.isEmpty()) {
            List<Long> ids = new ArrayList<>();
            Map<Long, String> map = new HashMap<>(array.size() + 8);
            Long sProdId;
            for(int i = 0, length = array.size(); i < length; i++) {
                JSONObject object = array.getJSONObject(i);
                sProdId = object.getLong("id");
                ids.add(sProdId);
                if(object.containsKey("quantity") && object.containsKey("unit")) {
                    map.put(sProdId,object.getString("quantity") + "," + object.getString("unit"));
                }
            }
            List<SemiProduct> list = semiProductMapper.findListByIds(ids);
            SemiProduct sprod;
            for(int i = 0, length = list.size(); i < length; i++) {
                SemiProductVO vo = new SemiProductVO();
                sprod = list.get(i);
                vo.setId(sprod.getId());
                vo.setName(sprod.getName());
                vo.setCode(sprod.getCode());
                vo.setSpecification(sprod.getSpecification());
                String value = map.get(sprod.getId());
                if(value != null && value.contains(",") && value.split(",").length > 1) {
                    vo.setQuantity(Integer.valueOf(map.get(sprod.getId()).split(",")[0]));
                    vo.setUnit(map.get(sprod.getId()).split(",")[1]);
                }
                vos.add(vo);
            }
        }
        return vos;
    }

    @Override
    public List<Product> getList(Product product) throws Exception {
        return productMapper.findList(product);
    }

    @Override
    public Product find(Product product) throws Exception {
        return productMapper.find(product);
    }

}
