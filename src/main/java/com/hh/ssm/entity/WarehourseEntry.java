package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Author ljk
 * Date  2019-05-17
 */
public class WarehourseEntry implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long prodId;
    private Character prodType;
    //供应商(针对原材料)
    private String supplier;
    //生产负责人
    private String prodManager;
    //质检状态
    private Character oqaStatus;
    //质检人
    private String oqaUser;
    //入库数量
    private Integer quantity;
    private String createUser;
    private Date createTime;


    public WarehourseEntry() {
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setProdId(Long prodId) {
        this.prodId = prodId;
    }

    public Long getProdId() {
        return prodId;
    }

    public void setProdType(Character prodType) {
        this.prodType = prodType;
    }

    public Character getProdType() {
        return prodType;
    }

    public String getSupplier() { return supplier; }

    public void setSupplier(String supplier) { this.supplier = supplier; }

    public String getProdManager() {
        return prodManager;
    }

    public void setProdManager(String prodManager) {
        this.prodManager = prodManager;
    }

    public Character getOqaStatus() {
        return oqaStatus;
    }

    public void setOqaStatus(Character oqaStatus) {
        this.oqaStatus = oqaStatus;
    }

    public String getOqaUser() {
        return oqaUser;
    }

    public void setOqaUser(String oqaUser) {
        this.oqaUser = oqaUser;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setCreateUser(String createUser) {
        this.createUser = createUser;
    }

    public String getCreateUser() {
        return createUser;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

}