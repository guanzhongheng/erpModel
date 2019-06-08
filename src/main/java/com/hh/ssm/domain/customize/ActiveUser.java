package com.hh.ssm.domain.customize;

import com.hh.ssm.domain.authority.SysPermission;

import java.util.List;


/**
 * created on 2019年5月15日
 *
 * 用户身份信息，存入session 由于tomcat将session会序列化在本地硬盘上，所以使用Serializable接口
 *
 * @author  admin
 * @version  0.0.1
 */
public class ActiveUser implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String userId;//用户id（主键）
	private String username;// 用户名称
	private String userStatus;// 用户状态
	private String roleName;// 角色名称
	private String roleStatus;// 角色状态
	private List<SysPermission> menus;// 菜单
	private List<SysPermission> permissions;// 权限

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}


	public List<SysPermission> getMenus() {
		return menus;
	}

	public void setMenus(List<SysPermission> menus) {
		this.menus = menus;
	}

	public List<SysPermission> getPermissions() {
		return permissions;
	}

	public void setPermissions(List<SysPermission> permissions) {
		this.permissions = permissions;
	}

	public String getUserStatus() {
		return userStatus;
	}

	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleStatus() {
		return roleStatus;
	}

	public void setRoleStatus(String roleStatus) {
		this.roleStatus = roleStatus;
	}

}
