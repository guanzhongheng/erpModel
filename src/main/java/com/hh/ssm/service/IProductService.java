package com.hh.ssm.service;

import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.SemiProductVO;
import com.hh.ssm.entity.Contract;
import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.SemiProduct;

import java.util.List;

/**
 * Author ljk
 * Date  2019-05-17
 */
public interface IProductService {
    Product get(String id);

    List<Product> findAllList();

    int insert(Product contract);

    int insertBatch(List<Product> contracts);

    int update(Product product);

    int updateAll(Product product);

    int delete(String code);

    int deleteBatch(List<String> ids);

    List<Product> findByIds(List<Long> ids);

    EUDataGridResult getList(int page, int rows, Product product) throws Exception;

    List<SemiProductVO> getSemiProdByProdId(String id) throws Exception;

    List<Product> getList(Product product) throws Exception;

    Product find(Product product) throws Exception;

}
