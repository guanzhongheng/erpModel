package com.hh.ssm.service;

import com.hh.ssm.domain.customize.CustomResult;
import com.hh.ssm.domain.customize.EUDataGridResult;
import com.hh.ssm.domain.vo.DeliveryListDetailVO;
import com.hh.ssm.domain.vo.DeliveryListVO;
import com.hh.ssm.entity.DeliveryList;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface IDeliveryListService {

    EUDataGridResult getList(Integer page, Integer rows, DeliveryListVO vo);

    EUDataGridResult findListBySelect(Integer page, Integer rows, DeliveryListVO vo);

    DeliveryList get(String deliveryCode);

    CustomResult insert(DeliveryListVO vo);

    List<DeliveryListDetailVO> getDetailsById(String id);

    List<DeliveryListDetailVO> selectByDetailByDeliveryListId(Long id);
}
