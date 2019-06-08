package com.hh.ssm.domain.vo;

import java.util.List;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/29  3:55 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/29    create
 */
public class ProductDesinOperVo {
    //合同ID
    private Long contId;
    //合同明细ID
    private Long contDetailId;
    //产品Id
    private Long prodId;
    //产品编码
    private String prodCode;
    //产品名字
    private String prodName;
    //产品规格
    private String specification;
    //产品类型
    private Character prodType;
    //产品单位
    private String prodUnit;
    //产品数量
    private Integer quantity;
    //产品备注
    private String remark;
    //父Id
    private Long parentId;

    public Long getContId() {
        return contId;
    }

    public Long getContDetailId() {
        return contDetailId;
    }

    public void setContDetailId(Long contDetailId) {
        this.contDetailId = contDetailId;
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

    public String getProdCode() {
        return prodCode;
    }

    public void setProdCode(String prodCode) {
        this.prodCode = prodCode;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public Character getProdType() {
        return prodType;
    }

    public void setProdType(Character prodType) {
        this.prodType = prodType;
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

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    private List<SemiProductOperVo> semiProdList;

    public List<SemiProductOperVo> getSemiProdList() {
        return semiProdList;
    }

    public void setSemiProdList(List<SemiProductOperVo> semiProdList) {
        this.semiProdList = semiProdList;
    }
}

