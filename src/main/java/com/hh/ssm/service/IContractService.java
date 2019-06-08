package com.hh.ssm.service;

import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.*;
import com.hh.ssm.entity.Contract;
import com.hh.ssm.entity.ContractDetail;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface IContractService {

    Contract get(Long id);

    Contract findByConCode(String contCode);

    List<ContractDetail> getDetailByConId(String code);

    List<ContractVo> findList(ContractVo contract);

    List<ContractVo> findAllList();

    int insert(ContractVo vo);

    int insertBatch(List<Contract> contracts);

    int update(ContractVo contract);

    int updateAll(Contract contract);

    int delete(String code);

    int deleteBatch(List<String> ids);

    EUDataGridResult getList(int page, int rows, ContractVo contract) throws Exception;

    int updateDetail(List<ContractDetailVo> cdList);

    EUDataGridResult listContractDetailById(Integer page, Integer rows, String id);

    List<ProductDesinVo> getProdPracticaInfolListByConId(String conId);

    int saveProductDesinInfo(ProductDesinOperVo vo);

    int updateProductDesinInfo(ProductDesinOperVo vo);

    int delteProductDesinInfo(ProductDesinOperVo vo);

}
