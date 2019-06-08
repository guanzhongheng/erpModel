package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Author ljk
 * Date  2019-05-17
 */
public class ContractDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long contId;
    //产品ID
    private Long prodId;
    //产品类型
    private Character prodType;
    //产品编号
    private String prodCode;
    //产品名称
    private String prodName;
    //产品规格
    private String specification;
    private Integer quantity;
    //产品单位
    private String prodUnit;
    private Integer unQuantity;
    //备注
    private String remark;
    private Date createTime;
    private Date updateTime;
    private String prodManager;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getContId() {
        return contId;
    }

    public void setContId(Long contId) {
        this.contId = contId;
    }

    public Long getProdId() {
        return prodId;
    }

    public void setProdId(Long prodId) {
        this.prodId = prodId;
    }

    public Character getProdType() {
        return prodType;
    }

    public void setProdType(Character prodType) {
        this.prodType = prodType;
    }

    public String getProdCode() {
        return prodCode;
    }

    public void setProdCode(String prodCode) {
        this.prodCode = prodCode;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public String getProdUnit() {
        return prodUnit;
    }

    public void setProdUnit(String prodUnit) {
        this.prodUnit = prodUnit;
    }

    public Integer getUnQuantity() {
        return unQuantity;
    }

    public void setUnQuantity(Integer unQuantity) {
        this.unQuantity = unQuantity;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getProdManager() {
        return prodManager;
    }

    public void setProdManager(String prodManager) {
        this.prodManager = prodManager;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }
}