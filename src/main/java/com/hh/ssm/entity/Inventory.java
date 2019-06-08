package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Author ljk
 * Date  2019-05-17
 */
public class Inventory implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long prodId;
    private Character prodType;
    private String prodName;
    private String prodCode;
    private Integer quantity;
    private Integer usableQuantity;
    //阀值
    private String threshold;
    //单位
    private String unit;
    private Date createTime;
    private Date updateTime;


    public Inventory() {
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

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdCode() {
        return prodCode;
    }

    public void setProdCode(String prodCode) {
        this.prodCode = prodCode;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setUsableQuantity(Integer usableQuantity) {
        this.usableQuantity = usableQuantity;
    }

    public Integer getUsableQuantity() {
        return usableQuantity;
    }

    public String getThreshold() {
        return threshold;
    }

    public void setThreshold(String threshold) {
        this.threshold = threshold;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
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