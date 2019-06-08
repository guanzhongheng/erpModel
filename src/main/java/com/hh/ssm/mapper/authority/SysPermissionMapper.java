package com.hh.ssm.mapper.authority;

import com.hh.ssm.domain.authority.SysPermission;
import com.hh.ssm.domain.authority.SysPermissionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysPermissionMapper {
	
	List<SysPermission> findPermission(String ids[]);

    int countByExample(SysPermissionExample example);

    int deleteByExample(SysPermissionExample example);

    int deleteByPrimaryKey(Long id);

    int insert(SysPermission record);

    int insertSelective(SysPermission record);

    List<SysPermission> selectByExample(SysPermissionExample example);

    SysPermission selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") SysPermission record, @Param("example") SysPermissionExample example);

    int updateByExample(@Param("record") SysPermission record, @Param("example") SysPermissionExample example);

    int updateByPrimaryKeySelective(SysPermission record);

    int updateByPrimaryKey(SysPermission record);
}