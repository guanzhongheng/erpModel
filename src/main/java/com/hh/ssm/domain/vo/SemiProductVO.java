package com.hh.ssm.domain.vo;

import com.hh.ssm.domain.common.PageList;

import java.util.Date;
import java.util.List;

public class SemiProductVO extends PageList {
    private Long id;
    private String name;
    private String code;
    private String specification;
    private String tickness;
    private String innerResin;
    private String structuralResin;
    private String outerResin;
    private String attachment;
    private Integer quantity;
    private String unit;
    private Date createTime;
    private Date updateTime;
    private List<RawMaterialVO> rawMaterialList;

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

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public String getSpecification() {
        return specification;
    }

    public void setTickness(String tickness) {
        this.tickness = tickness;
    }

    public String getTickness() {
        return tickness;
    }

    public void setInnerResin(String innerResin) {
        this.innerResin = innerResin;
    }

    public String getInnerResin() {
        return innerResin;
    }

    public void setStructuralResin(String structuralResin) {
        this.structuralResin = structuralResin;
    }

    public String getStructuralResin() {
        return structuralResin;
    }

    public void setOuterResin(String outerResin) {
        this.outerResin = outerResin;
    }

    public String getOuterResin() {
        return outerResin;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getAttachment() {
        return attachment;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
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

    public List<RawMaterialVO> getRawMaterialList() {
        return rawMaterialList;
    }

    public void setRawMaterialList(List<RawMaterialVO> rawMaterialList) {
        this.rawMaterialList = rawMaterialList;
    }


}
