package com.hh.ssm.dao;

import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.SemiProduct;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface ProductMapper {

    Product get(String id);

    List<Product> findList(Product product);

    List<Product> findAllList();

    int insert(Product product);

    int insertBatch(List<Product> products);

    int update(Product product);

    int updateAll(Product product);

    int delete(String id);

    int deleteBatch(List<String> ids);

    List<Product> findListByIds(List<Long> ids);

    Product find(Product product);
}