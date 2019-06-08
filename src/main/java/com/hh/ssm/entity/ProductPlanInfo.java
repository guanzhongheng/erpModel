package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/25  1:37 AM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/25    create
 */
public class ProductPlanInfo implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    //产品Id
    private String proId;
    //产品类型
    private Character proType;
    //产品编号
    private String proCode;
    //产品名称
    private String proName;
    //产品数量
    private Integer proNum;
    //产品单位
    private String proUnit;
    //备注
    private String remark;
    //合同ID
    private Long contId;
    private Date createTime;
    private Date updateTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public Character getProType() {
        return proType;
    }

    public void setProType(Character proType) {
        this.proType = proType;
    }

    public String getProCode() {
        return proCode;
    }

    public void setProCode(String proCode) {
        this.proCode = proCode;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public Integer getProNum() {
        return proNum;
    }

    public void setProNum(Integer proNum) {
        this.proNum = proNum;
    }

    public String getProUnit() {
        return proUnit;
    }

    public void setProUnit(String proUnit) {
        this.proUnit = proUnit;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long getContId() {
        return contId;
    }

    public void setContId(Long contId) {
        this.contId = contId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}