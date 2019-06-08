package com.hh.ssm.dao;

import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.SemiProduct;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface SemiProductMapper {

    SemiProduct get(String id);

    List<SemiProduct> findList(SemiProduct semiProduct);

    List<SemiProduct> findAllList();

    int insert(SemiProduct semiProduct);

    int insertBatch(List<SemiProduct> semiProducts);

    int update(SemiProduct semiProduct);

    int updateAll(SemiProduct semiProduct);

    int delete(String id);

    int deleteBatch(List<String> ids);

    List<SemiProduct> findListByIds(List<Long> ids);

}