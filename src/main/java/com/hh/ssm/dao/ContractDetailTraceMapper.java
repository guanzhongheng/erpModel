package com.hh.ssm.dao;

import com.hh.ssm.entity.ContractDetailTrace;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface ContractDetailTraceMapper {

    List<ContractDetailTrace>  getByConId(String conId);

    int insert(ContractDetailTrace trace);

    int insertBatch(List<ContractDetailTrace> traces);

}