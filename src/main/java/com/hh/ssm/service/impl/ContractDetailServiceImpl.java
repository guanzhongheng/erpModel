package com.hh.ssm.service.impl;

import com.hh.ssm.dao.ContractDetailMapper;
import com.hh.ssm.dao.ContractMapper;
import com.hh.ssm.entity.ContractDetail;
import com.hh.ssm.service.IContractDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
@Service
public class ContractDetailServiceImpl implements IContractDetailService {
    @Autowired
    private ContractDetailMapper contractDetailMapper;
    @Autowired
    private ContractMapper contractMapper;

    @Override
    public ContractDetail get(String id){
        return contractDetailMapper.get(id);
    }

    @Override
    public List<ContractDetail> findList(ContractDetail contractDetail) {
        return contractDetailMapper.findList(contractDetail);
    }

    @Override
    public List<ContractDetail> findAllList() {
        return contractDetailMapper.findAllList();
    }

    @Override
    public int insert(ContractDetail contractDetail) {
        return contractDetailMapper.insert(contractDetail);
    }

    @Override
    public int insertBatch(List<ContractDetail> contractDetails){
        return contractDetailMapper.insertBatch(contractDetails);
    }

    @Override
    public int update(ContractDetail contractDetail) {
        return contractDetailMapper.update(contractDetail);
    }

    @Override
    public int delete(ContractDetail contractDetail) {
        return contractDetailMapper.delete(contractDetail.getContId());
    }

    @Override
    public int updateBatch(List<ContractDetail> list) {
        try{
            contractDetailMapper.updateBatch(list);
            contractMapper.updateStatusById(list.get(0).getContId());
        }catch (Exception e){
            e.printStackTrace();
            return -1;
        }
        return 1;
    }

}
