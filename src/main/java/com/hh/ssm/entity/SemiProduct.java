package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
* Author ljk
* Date  2019-05-17
*/
public class SemiProduct implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    private String name;
    private String code;
    private String specification;
    private String tickness;
    private String innerResin;
    private String structuralResin;
    private String outerResin;
    private String attachment;
    private String rawMaterialCons;
    private Date createTime;
    private Date updateTime;


    public SemiProduct(){
    }

    public void setId (Long id) {this.id = id;}
    public Long getId(){ return id;}
    public void setName (String name) {this.name = name;}
    public String getName(){ return name;}
    public void setCode (String code) {this.code = code;}
    public String getCode(){ return code;}
    public void setSpecification (String specification) {this.specification = specification;}
    public String getSpecification(){ return specification;}
    public void setTickness (String tickness) {this.tickness = tickness;}
    public String getTickness(){ return tickness;}
    public void setInnerResin (String innerResin) {this.innerResin = innerResin;}
    public String getInnerResin(){ return innerResin;}
    public void setStructuralResin (String structuralResin) {this.structuralResin = structuralResin;}
    public String getStructuralResin(){ return structuralResin;}
    public void setOuterResin (String outerResin) {this.outerResin = outerResin;}
    public String getOuterResin(){ return outerResin;}
    public void setAttachment (String attachment) {this.attachment = attachment;}
    public String getAttachment(){ return attachment;}
    public void setRawMaterialCons (String rawMaterialCons) {this.rawMaterialCons = rawMaterialCons;}
    public String getRawMaterialCons(){ return rawMaterialCons;}
    public void setCreateTime (Date createTime) {this.createTime = createTime;}
    public Date getCreateTime(){ return createTime;}
    public void setUpdateTime (Date updateTime) {this.updateTime = updateTime;}
    public Date getUpdateTime(){ return updateTime;}

    @Override
    public String toString() {
        return "SemiProduct{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", code='" + code + '\'' +
                ", specification='" + specification + '\'' +
                ", tickness='" + tickness + '\'' +
                ", innerResin='" + innerResin + '\'' +
                ", structuralResin='" + structuralResin + '\'' +
                ", outerResin='" + outerResin + '\'' +
                ", attachment='" + attachment + '\'' +
                ", rawMaterialCons='" + rawMaterialCons + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                '}';
    }
}