package com.hh.ssm.dao;

import com.hh.ssm.entity.RawOutInfo;

import java.util.List;

public interface RawOutInfoMapper {

    RawOutInfo findById(Long id);

    int insert(RawOutInfo rawOutInfo);

    int updateByselect(RawOutInfo rawOutInfo);

    List<RawOutInfo> findList(RawOutInfo rawOutInfo);
}
