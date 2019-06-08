package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
* Author ljk
* Date  2019-05-17
*/
public class Product implements Serializable {
    private static final long serialVersionUID = 1L;
    //产品ID
    private Long id;
    //产品名称
    private String name;
    //产品编号
    private String code;
    //产品类型 0：树脂 1：乙烯基
    private Character type;
    //产品规格
    private String specification;
    //产品附件信息
    private String attachment;
    //产品组成
    private String semiProdCons;
    //产品创建时间
    private Date createTime;
    //产品更新时间
    private Date updateTime;
    //产品类别 0：字典 1：自定义
    private Character category;

    public void setId (Long id) {this.id = id;} 
    public Long getId(){ return id;} 
    public void setName (String name) {this.name = name;} 
    public String getName(){ return name;} 
    public void setCode (String code) {this.code = code;} 
    public String getCode(){ return code;} 
    public void setType (Character type) {this.type = type;} 
    public Character getType(){ return type;}
    public void setSpecification (String specification) {this.specification = specification;}
    public String getSpecification(){ return specification;}
    public void setAttachment (String attachment) {this.attachment = attachment;} 
    public String getAttachment(){ return attachment;}
    public void setSemiProdCons (String semiProdCons) {this.semiProdCons = semiProdCons;}
    public String getSemiProdCons(){ return semiProdCons;}
    public void setCreateTime (Date createTime) {this.createTime = createTime;}
    public Date getCreateTime(){ return createTime;} 
    public void setUpdateTime (Date updateTime) {this.updateTime = updateTime;} 
    public Date getUpdateTime(){ return updateTime;}
    public void setCategory (Character category) {this.category = category;}
    public Character getCategory(){ return category;}

}