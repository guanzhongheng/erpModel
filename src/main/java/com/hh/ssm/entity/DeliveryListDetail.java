package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
* Author ljk
* Date  2019-05-17
*/
public class DeliveryListDetail implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private Long prodId;
    private Long contId;
    private Integer quantity;
    private String prodUnit;
    private Long deliveryListId;

    public void setId (Long id) {this.id = id;}
    public Long getId(){ return id;} 
    public void setProdId (Long prodId) {this.prodId = prodId;} 
    public Long getProdId(){ return prodId;} 
    public void setContId (Long contId) {this.contId = contId;}
    public Long getContId(){ return contId;} 
    public void setQuantity (Integer quantity) {this.quantity = quantity;} 
    public Integer getQuantity(){ return quantity;} 
    public String getProdUnit() { return prodUnit; }
    public void setProdUnit(String prodUnit) { this.prodUnit = prodUnit; }
    public Long getDeliveryListId() { return deliveryListId; }
    public void setDeliveryListId(Long deliveryListId) { this.deliveryListId = deliveryListId; }
}