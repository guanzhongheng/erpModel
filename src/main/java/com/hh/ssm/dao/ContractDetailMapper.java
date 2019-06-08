package com.hh.ssm.dao;

import com.hh.ssm.entity.Contract;
import com.hh.ssm.entity.ContractDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface ContractDetailMapper {

    ContractDetail get(String id);

    List<ContractDetail>  getByConId(String conId);

    List<ContractDetail> findList(ContractDetail contractDetail);

    List<ContractDetail> findAllList();

    int insert(ContractDetail contractDetail);

    int insertBatch(List<ContractDetail> contractDetails);

    int update(ContractDetail contractDetail);

    int delete(Long contId);

    int deleteById(Long id);

    int updateBatch(List<ContractDetail> list);

    int insertOrUpdateByBatch(@Param("list") List<ContractDetail> list);

    int updateBatchByIds(@Param("list") List<ContractDetail> contractDetails);

    int out(List<ContractDetail> contractDetails);

    List<ContractDetail> queryByIds(List<Integer> ids);

    Long queryByContIdAndProdId(@Param("contId") Long contId,@Param("prodId") Long prodId);


}