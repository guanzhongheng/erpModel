package com.hh.ssm.domain.vo;

import com.hh.ssm.domain.common.PageList;

import java.util.Date;
import java.util.List;

public class ProductVO extends PageList {
    //产品Id
    private Long id;
    //产品编码
    private String code;
    //产品名字
    private String name;
    //产品规格
    private String specification;
    //产品附件
    private String attachment;
    //产品类型
    private Character type;

    //同一个产品有多种类型（暂不考虑）
    private Character prodType;

    private List<SemiProductVO> semiProdList;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setSpecification (String specification) {this.specification = specification;}

    public String getSpecification(){ return specification;}

    public String getAttachment() { return attachment; }

    public void setAttachment(String attachment) { this.attachment = attachment; }

    public Character getType() {
        return type;
    }

    public void setType(Character type) {
        this.type = type;
    }

    public Character getProdType() {
        return prodType;
    }

    public void setProdType(Character prodType) {
        this.prodType = prodType;
    }

    public List<SemiProductVO> getSemiProdList() { return semiProdList; }

    public void setSemiProdList(List<SemiProductVO> semiProdList) { this.semiProdList = semiProdList; }
}
