package com.hh.ssm.service.impl;

import com.hh.ssm.dao.ProductPlanInfoMapper;
import com.hh.ssm.entity.ProductPlanInfo;
import com.hh.ssm.service.IProductPlanInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/25  4:47 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/25    create
 */
@Service
public class ProductPlanInfoServiceImpl implements IProductPlanInfoService {
    @Autowired
    private ProductPlanInfoMapper productPlanInfoMapper;
    @Override
    public List<ProductPlanInfo> findProductPlanInfosByConId(String conId) {
        List<ProductPlanInfo> list = productPlanInfoMapper.findAllByContId(Long.valueOf(conId));
        return list;
    }

    @Override
    public int insertBatch(List<ProductPlanInfo> plans) {
        return productPlanInfoMapper.insertBatch(plans);
    }

    @Override
    public int update(List<ProductPlanInfo> plans) {
        return 0;
    }
}