package com.hh.ssm.dao;

import com.hh.ssm.domain.vo.ContractVo;
import com.hh.ssm.entity.Contract;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface ContractMapper {

    Contract get(Long id);

    Contract findByConCode(String code);

    List<ContractVo> findList(ContractVo contract);

    List<ContractVo> findAllList();

    int insert(Contract contract);

    int insertBatch(List<Contract> contracts);

    int update(Contract contract);

    int delete(String code);

    int deleteBatch(List<String> ids);

    void updateStatusById(Long id);
}