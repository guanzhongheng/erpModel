package com.hh.ssm.service;

import com.hh.ssm.entity.ProductPlanInfo;

import java.util.List;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/25  4:44 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/25    create
 */
public interface IProductPlanInfoService {

    List<ProductPlanInfo> findProductPlanInfosByConId(String conId);

    int insertBatch(List<ProductPlanInfo> plans);

    int update(List<ProductPlanInfo> plans);
}