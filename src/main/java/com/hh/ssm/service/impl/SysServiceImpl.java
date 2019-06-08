package com.hh.ssm.service.impl;

import com.hh.ssm.domain.authority.SysPermission;
import com.hh.ssm.domain.authority.SysPermissionExample;
import com.hh.ssm.domain.authority.SysUser;
import com.hh.ssm.domain.authority.SysUserExample;
import com.hh.ssm.mapper.authority.SysPermissionMapper;
import com.hh.ssm.mapper.authority.SysPermissionMapperCustom;
import com.hh.ssm.mapper.authority.SysUserMapper;
import com.hh.ssm.service.SysService;
import com.hh.ssm.util.CollectionsFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * created on
 *
 * 认证和授权的服务接口
 *
 * @author  admin
 * @version  0.0.1
 */
@Service
public class SysServiceImpl implements SysService {

	@Autowired
	private SysUserMapper sysUserMapper;
	
	@Autowired
	private SysPermissionMapperCustom sysPermissionMapperCustom;
	
	@Autowired
	private SysPermissionMapper sysPermissionMapper;
	
	@Override
	public List<SysPermission> findMenuListByUserId(String userId) throws Exception {
		return sysPermissionMapperCustom.findMenuListByUserId(userId);
	}

	@Override
	public List<SysPermission> findPermissionListByUserId(String userId) throws Exception {
		
		String permission = this.sysPermissionMapperCustom.findPermissionByUserId(userId);
		if(permission != null){
			String[] permissionIds = permission.split(",");
			List<Long> ids = CollectionsFactory.newArrayList();
			for(int i=0;i<permissionIds.length;i++){
				ids.add(Long.valueOf(permissionIds[i]));
			}
			SysPermissionExample example = new SysPermissionExample();
			SysPermissionExample.Criteria criteria = example.createCriteria();
			criteria.andIdIn(ids);
			return sysPermissionMapper.selectByExample(example);
		}
		return null;
	}

	@Override
	public SysUser getSysUserByName(String username) throws Exception {
		try {
			return sysUserMapper.selectByUserAccount(username);
		}catch (Exception e){
			e.printStackTrace();
			return  null;
		}
	}
}
