package com.hh.ssm.domain.vo;

import com.hh.ssm.domain.common.PageList;

import java.util.Date;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/19  5:16 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/19    create
 */
public class RawMaterialVO extends PageList {

    //序列号
    private Long id;
    //原材料编号
    private String code;
    //原材料名称
    private String name;
    //供应商
    private String supplier;
    //原材料附件
    private String attachment;
    //库存总量
    private Integer invTotal;
    //库存可用总量
    private Integer avaInvTotal;
    //阀值设置串
    private String threshold;

    //单位
    private String unit;

    private Date createTime;

    private Date updateTime;

    private Integer quantity;

    //补库数量
    private Integer addNum=0;

    private Integer flg;

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

    public String getSupplier() { return supplier; }

    public void setSupplier(String supplier) { this.supplier = supplier; }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public Integer getInvTotal() {
        return invTotal;
    }

    public void setInvTotal(Integer invTotal) {
        this.invTotal = invTotal;
    }

    public Integer getAvaInvTotal() {
        return avaInvTotal;
    }

    public void setAvaInvTotal(Integer avaInvTotal) {
        this.avaInvTotal = avaInvTotal;
    }

    public String getThreshold() {
        return threshold;
    }

    public void setThreshold(String threshold) {
        this.threshold = threshold;
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
    public Integer getQuantity() { return quantity; }
    public void setQuantity(Integer quantity) { this.quantity = quantity; }

    public Integer getFlg() {
        return flg;
    }

    public void setFlg(Integer flg) {
        this.flg = flg;
    }

    public Integer getAddNum() {
        return addNum;
    }

    public void setAddNum(Integer addNum) {
        this.addNum = addNum;
    }
}