package com.hh.ssm.dao;

import com.hh.ssm.domain.vo.DeliveryListDetailVO;
import com.hh.ssm.domain.vo.DeliveryListVO;
import com.hh.ssm.entity.DeliveryList;
import com.hh.ssm.entity.DeliveryListDetail;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* Author ljk
* Date  2019-05-17
*/
public interface DeliveryListMapper {

    List<DeliveryListVO> findListBySelect(DeliveryListVO vo);

    List<DeliveryListVO> findList(DeliveryListVO vo);

    DeliveryList get(String deliveryCode);

    List<DeliveryListDetailVO> selectByDetailByDeliveryListId(Long id);

    int insert(DeliveryList dl);

    int insertDetailBatch(List<DeliveryListDetail> deliveryListDetails);

    List<DeliveryListDetailVO> getDetailsById(String id);

    int updateBySelect(DeliveryList dlPo);
}