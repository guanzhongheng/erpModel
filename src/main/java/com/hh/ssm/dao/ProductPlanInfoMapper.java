package com.hh.ssm.dao;

import com.hh.ssm.entity.ProductPlanInfo;

import java.util.List;

public interface ProductPlanInfoMapper {

    int insertBatch(List<ProductPlanInfo> list);

    int deleteByContId(Long contId);

    List<ProductPlanInfo> findAllByContId(Long contId);
}
