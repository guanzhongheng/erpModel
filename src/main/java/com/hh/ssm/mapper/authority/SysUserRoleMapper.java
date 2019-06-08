package com.hh.ssm.mapper.authority;

import com.hh.ssm.domain.authority.SysUserRole;
import com.hh.ssm.domain.authority.SysUserRoleExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserRoleMapper {
	
	//扩展的mapper接口方法
	int deleteBatchByUserId(String[] ids);

    int deleteBatchByRoleId(String[] ids);

    int countByExample(SysUserRoleExample example);

    int deleteByExample(SysUserRoleExample example);

    int deleteByPrimaryKey(String id);

    int insert(SysUserRole record);

    int insertSelective(SysUserRole record);

    List<SysUserRole> selectByExample(SysUserRoleExample example);

    SysUserRole selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") SysUserRole record, @Param("example") SysUserRoleExample example);

    int updateByExample(@Param("record") SysUserRole record, @Param("example") SysUserRoleExample example);

    int updateByPrimaryKeySelective(SysUserRole record);

    int updateByPrimaryKey(SysUserRole record);
}