package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Author ljk
 * Date  2019-05-17
 */
public class RawMaterial implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String name;
    private String code;
    private String supplier;
    private String attachment;
    private Date createTime;
    private Date updateTime;


    public RawMaterial() {
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public String getSupplier() { return supplier; }

    public void setSupplier(String supplier) { this.supplier = supplier; }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

}