package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
* Author ljk
* Date  2019-05-17
*/
public class ProdRecord implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long prodId;
    private Character prodType;
    private Long contId;
    private Integer quantity;
    private String producer;
    private Character oqc;
    private String oqcUser;
    private Date createTime;


    public ProdRecord(){
    }

    public void setId (Long id) {this.id = id;} 
    public Long getId(){ return id;} 
    public void setProdId (Long prodId) {this.prodId = prodId;} 
    public Long getProdId(){ return prodId;} 
    public void setProdType (Character prodType) {this.prodType = prodType;} 
    public Character getProdType(){ return prodType;} 
    public void setContId (Long contId) {this.contId = contId;} 
    public Long getContId(){ return contId;} 
    public void setQuantity (Integer quantity) {this.quantity = quantity;} 
    public Integer getQuantity(){ return quantity;} 
    public void setProducer (String producer) {this.producer = producer;} 
    public String getProducer(){ return producer;} 
    public void setOqc (Character oqc) {this.oqc = oqc;} 
    public Character getOqc(){ return oqc;} 
    public void setOqcUser (String oqcUser) {this.oqcUser = oqcUser;} 
    public String getOqcUser(){ return oqcUser;} 
    public void setCreateTime (Date createTime) {this.createTime = createTime;} 
    public Date getCreateTime(){ return createTime;} 

}