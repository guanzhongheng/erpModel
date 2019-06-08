package com.hh.ssm.domain.vo;

import com.hh.ssm.domain.common.PageList;

public class DeliveryListDetailVO extends PageList {
    private Long id;
    private Long prodId;
    private Long contId;
    private Integer quantity;
    //库存数
    private Integer invTotal;
    private String prodName;
    private String contName;
    private String prodUnit;
    private String deleveyDate;
    private Long deliveryListId;
    private String prodCode;
    private String contCode;
    private String prodSpec;
    //库存ID
    private Long invId;

    public Long getInvId() {
        return invId;
    }

    public void setInvId(Long invId) {
        this.invId = invId;
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

    public void setContId(Long contId) {
        this.contId = contId;
    }

    public Long getContId() {
        return contId;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public Integer getInvTotal() {
        return invTotal;
    }

    public void setInvTotal(Integer invTotal) {
        this.invTotal = invTotal;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getContName() {
        return contName;
    }

    public void setContName(String contName) {
        this.contName = contName;
    }

    public String getProdUnit() {
        return prodUnit;
    }

    public void setProdUnit(String prodUnit) {
        this.prodUnit = prodUnit;
    }

    public String getDeleveyDate() {
        return deleveyDate;
    }

    public void setDeleveyDate(String deleveyDate) {
        this.deleveyDate = deleveyDate;
    }

    public Long getDeliveryListId() {
        return deliveryListId;
    }

    public void setDeliveryListId(Long deliveryListId) {
        this.deliveryListId = deliveryListId;
    }

    public String getProdCode() {
        return prodCode;
    }

    public void setProdCode(String prodCode) {
        this.prodCode = prodCode;
    }

    public String getContCode() {
        return contCode;
    }

    public void setContCode(String contCode) {
        this.contCode = contCode;
    }

    public String getProdSpec() {
        return prodSpec;
    }

    public void setProdSpec(String prodSpec) {
        this.prodSpec = prodSpec;
    }
}
