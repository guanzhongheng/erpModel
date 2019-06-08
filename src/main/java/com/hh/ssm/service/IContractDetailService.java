package com.hh.ssm.service;

import com.hh.ssm.entity.ContractDetail;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface IContractDetailService {
    ContractDetail get(String id);

    List<ContractDetail> findList(ContractDetail contractDetail);

    List<ContractDetail> findAllList();

    int insert(ContractDetail contractDetail);

    int insertBatch(List<ContractDetail> contractDetails);

    int update(ContractDetail contractDetail);

    int delete(ContractDetail contractDetail);

    int updateBatch(List<ContractDetail> list);
}
