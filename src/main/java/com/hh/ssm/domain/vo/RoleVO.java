package com.hh.ssm.domain.vo;

import com.hh.ssm.domain.common.PageList;

public class RoleVO extends PageList {

    private String roleId;

    private String roleName;

    private String available;

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

}