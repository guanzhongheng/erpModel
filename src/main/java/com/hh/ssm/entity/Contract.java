package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Author ljk
 * Date  2019-05-17
 */
public class Contract implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String code;
    private String name;
    private String manager;
    private Date createTime;
    private Date updateTime;
    private Character status;
    //签订日期
    private String signDate;
    //交货日期
    private String deleveyDate;
    private String attachment;

    public Contract() {
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getManager() {
        return manager;
    }

    public String getSignDate() {
        return signDate;
    }

    public void setSignDate(String signDate) {
        this.signDate = signDate;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public Character getStatus() {
        return status;
    }

    public String getDeleveyDate() {
        return deleveyDate;
    }

    public void setDeleveyDate(String deleveyDate) {
        this.deleveyDate = deleveyDate;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getAttachment() {
        return attachment;
    }

}