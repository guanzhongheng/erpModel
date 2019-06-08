package com.hh.ssm.service;

import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.RawMaterialVO;
import com.hh.ssm.entity.Product;
import com.hh.ssm.entity.SemiProduct;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface ISemiProductService {
    SemiProduct get(String id);

    List<SemiProduct> findAllList();

    int insert(SemiProduct semiProduct);

    int insertBatch(List<SemiProduct> semiProducts);

    int update(SemiProduct semiProduct);

    int updateAll(SemiProduct semiProduct);

    int delete(String code);

    int deleteBatch(List<String> ids);

    List<SemiProduct> findByIds(List<Long> ids);

    EUDataGridResult getList(int page, int rows, SemiProduct semiProduct) throws Exception;

    List<RawMaterialVO> getRawMaterialBySemiProdId(String id);

    List<SemiProduct> getList(SemiProduct semiProduct) throws Exception;
}
