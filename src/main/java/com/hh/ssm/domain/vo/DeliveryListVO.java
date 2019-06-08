package com.hh.ssm.domain.vo;

import com.hh.ssm.domain.common.PageList;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
* Author ljk
* Date  2019-05-17
*/
public class DeliveryListVO extends PageList{
    private static final long serialVersionUID = 1L;
    private Long id;
    private String deliveryCode;
    private String deleveyDate;
    private String deleveyAddress;
    private String createUser;
    private Date createTime;
    private String contracts;
    private List<Map<String, Object>> details;
    private Character status;
    private String actionUser;
    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getDeliveryCode() {
        return deliveryCode;
    }

    public void setDeliveryCode(String deliveryCode) {
        this.deliveryCode = deliveryCode;
    }

    public String getDeleveyDate() {
        return deleveyDate;
    }

    public void setDeleveyDate(String deleveyDate) {
        this.deleveyDate = deleveyDate;
    }

    public String getDeleveyAddress() {
        return deleveyAddress;
    }

    public void setDeleveyAddress(String deleveyAddress) {
        this.deleveyAddress = deleveyAddress;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getContracts() { return contracts; }

    public void setContracts(String contracts) { this.contracts = contracts; }

    public List<Map<String, Object>> getDetails() {
        return details;
    }

    public void setDetails(List<Map<String, Object>> details) {
        this.details = details;
    }

    public Character getStatus() { return status; }

    public void setStatus(Character status) { this.status = status; }

    public String getActionUser() { return actionUser; }

    public void setActionUser(String actionUser) { this.actionUser = actionUser; }

    public Date getUpdateTime() { return updateTime; }

    public void setUpdateTime(Date updateTime) { this.updateTime = updateTime; }
}