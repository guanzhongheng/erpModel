package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
* Author ljk
* Date  2019-05-17
*/
public class WarehourseDefective implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long prodId;
    private Character prodType;
    private Integer quantity;
    private Date createTime;
    private Date updateTime;


    public WarehourseDefective(){
    }

    public void setId (Long id) {this.id = id;} 
    public Long getId(){ return id;} 
    public void setProdId (Long prodId) {this.prodId = prodId;} 
    public Long getProdId(){ return prodId;} 
    public void setProdType (Character prodType) {this.prodType = prodType;} 
    public Character getProdType(){ return prodType;} 
    public void setQuantity (Integer quantity) {this.quantity = quantity;} 
    public Integer getQuantity(){ return quantity;} 
    public void setCreateTime (Date createTime) {this.createTime = createTime;} 
    public Date getCreateTime(){ return createTime;} 
    public void setUpdateTime (Date updateTime) {this.updateTime = updateTime;} 
    public Date getUpdateTime(){ return updateTime;} 

}