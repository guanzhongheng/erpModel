package com.hh.ssm.service;

import com.hh.ssm.domain.authority.SysPermission;
import com.hh.ssm.domain.authority.SysUser;

import java.util.List;

/**
 * created on
 *
 * 认证授权服务接口
 *
 * @author  admin
 * @version  0.0.1
 */
public interface SysService {

	SysUser getSysUserByName(String username)throws Exception;

	List<SysPermission> findMenuListByUserId(String userId) throws Exception;

	List<SysPermission> findPermissionListByUserId(String userId) throws Exception;
}
