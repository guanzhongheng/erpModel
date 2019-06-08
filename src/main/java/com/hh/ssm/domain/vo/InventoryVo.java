package com.hh.ssm.domain.vo;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/18  11:40 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/18    create
 */
public class InventoryVo {
    //序号
    private Long rowNum;
    //库存ID
    private Long id;
    //产品ID
    private Long proId;
    //产品类别：半成品/成品
    private Character proType;
    //合同Id
    private Long contId;
    //合同编号
    private String conCode;
    //合同需求总量
    private Integer conNeedTotal;
    //合同未发货总量
    private Integer conUnShipTotal;
    //产品名称
    private String proName;
    //产品编号
    private String proCode;
    //库存总量
    private Integer invTotal;
    //库存可用总量
    private Integer avaInvTotal;
    //补库数量
    private Integer addNum=0;
    //单位
    private String unit;

    public Long getRowNum() {
        return rowNum;
    }

    public void setRowNum(Long rowNum) {
        this.rowNum = rowNum;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getProId() {
        return proId;
    }

    public void setProId(Long proId) {
        this.proId = proId;
    }

    public Character getProType() {
        return proType;
    }

    public void setProType(Character proType) {
        this.proType = proType;
    }

    public String getConCode() {
        return conCode;
    }

    public void setConCode(String conCode) {
        this.conCode = conCode;
    }

    public Integer getConNeedTotal() {
        return conNeedTotal;
    }

    public void setConNeedTotal(Integer conNeedTotal) {
        this.conNeedTotal = conNeedTotal;
    }

    public Integer getConUnShipTotal() {
        return conUnShipTotal;
    }

    public void setConUnShipTotal(Integer conUnShipTotal) {
        this.conUnShipTotal = conUnShipTotal;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getProCode() {
        return proCode;
    }

    public void setProCode(String proCode) {
        this.proCode = proCode;
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

    public Integer getAddNum() {
        return addNum;
    }

    public void setAddNum(Integer addNum) {
        this.addNum = addNum;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Long getContId() {
        return contId;
    }

    public void setContId(Long contId) {
        this.contId = contId;
    }
}