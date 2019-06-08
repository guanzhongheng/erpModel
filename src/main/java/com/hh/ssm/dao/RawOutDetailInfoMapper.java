package com.hh.ssm.dao;

import com.hh.ssm.entity.RawmtOutDetailInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RawOutDetailInfoMapper {

    RawmtOutDetailInfo findById(Long id);

    int insertBatch(@Param("list") List<RawmtOutDetailInfo> list);

    int insert(RawmtOutDetailInfo rawmtOutDetailInfo);
}
