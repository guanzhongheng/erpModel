package com.hh.ssm.domain.authority;

import com.hh.ssm.domain.common.PageList;

import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

public class SysUser extends PageList implements Serializable {
	
	@Size(max=50, message="用户编号过长！")
	private String id;

	@Size(max=50, message="用户名过长！")
    private String username;

	@Size(max=50, message="用户工号过长！")
	private String userNumber;

	@Size(max=50, message="密码过长！")
    private String password;

	@Size(max=50, message="姓名过长！")
	private String name;

	@Size(max=36, message="角色编号非法！")
	private String roleId;

	// 角色名称
	private String roleName;

	// 最后登录时间
	private String lastLogin;

	// 最后登录ip地址
    private String ip;

    // 账号状态
    private String status;

    // 备注信息
    private String bz;

    private String email;

    private String phone;

    private String number;

	private String createTime;

	private String updateTime;

	private String loseTime;

	private Date dateLoseTime;

	public Date getDateLoseTime() {
		return dateLoseTime;
	}

	public void setDateLoseTime(Date dateLoseTime) {
		this.dateLoseTime = dateLoseTime;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public String getLastLogin() {
		return lastLogin;
	}

	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getBz() {
		return bz;
	}

	public void setBz(String bz) {
		this.bz = bz;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getLoseTime() {
		return loseTime;
	}

	public void setLoseTime(String loseTime) {
		this.loseTime = loseTime;
	}

	@Override
	public String toString() {
		return "SysUser{" +
				"id='" + id + '\'' +
				", username='" + username + '\'' +
				", userNumber='" + userNumber + '\'' +
				", password='" + password + '\'' +
				", name='" + name + '\'' +
				", roleId='" + roleId + '\'' +
				", roleName='" + roleName + '\'' +
				", lastLogin='" + lastLogin + '\'' +
				", ip='" + ip + '\'' +
				", status='" + status + '\'' +
				", bz='" + bz + '\'' +
				", email='" + email + '\'' +
				", phone='" + phone + '\'' +
				", number='" + number + '\'' +
				", createTime='" + createTime + '\'' +
				", updateTime='" + updateTime + '\'' +
				", loseTime='" + loseTime + '\'' +
				", dateLoseTime=" + dateLoseTime +
				'}';
	}
}
