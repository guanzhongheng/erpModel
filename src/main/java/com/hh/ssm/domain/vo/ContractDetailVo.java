package com.hh.ssm.domain.vo;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/24  12:47 AM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/24    create
 */
public class ContractDetailVo {

    //合同明细ID
    private Long contDetailId;
    //合同ID
    private Long contId;
    //产品规格
    private String specification;

    //产品ID
    private Long prodId;
    //产品名称
    private String prodName;
    //产品编号
    private String prodCode;
    //产品类型
    private Character prodType;
    //产品数量
    private Integer quantity;
    //未发货数量
    private Integer unQuantity;
    //产品单位
    private String prodUnit;
    //备注
    private String remark;

    public Long getContDetailId() {
        return contDetailId;
    }

    public void setContDetailId(Long contDetailId) {
        this.contDetailId = contDetailId;
    }

    public Long getContId() {
        return contId;
    }

    public void setContId(Long contId) {
        this.contId = contId;
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

    public Long getProdId() {
        return prodId;
    }

    public void setProdId(Long prodId) {
        this.prodId = prodId;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getProdCode() {
        return prodCode;
    }

    public void setProdCode(String prodCode) {
        this.prodCode = prodCode;
    }

    public Character getProdType() {
        return prodType;
    }

    public void setProdType(Character prodType) {
        this.prodType = prodType;
    }

    public String getSpecification() {
        return specification;
    }

    public void setSpecification(String specification) {
        this.specification = specification;
    }

    public Integer getUnQuantity() {
        return unQuantity;
    }

    public void setUnQuantity(Integer unQuantity) {
        this.unQuantity = unQuantity;
    }
}