package com.hh.ssm.domain.vo;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/31  5:03 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/31    create
 */
public class RawmaterCheckoutDetailVo {
    //申请基本信息ID
    private Long id;
    //库存ID
    private Long invId;
    //申请人
    private String applicant;
    //申请编号
    private String rawmtOutCode;
    //原材料编号
    private String rawCode;
    //原材料名称
    private String rawName;
    //原材料供应商
    private String rawSupplier;
    //库存总量
    private Integer rawInvTotal;
    //原材料单位
    private String rawUnit;
    //出库数量
    private Integer outNum;
    //操作出库数值
    private Integer operOutNum;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getInvId() {
        return invId;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public void setInvId(Long invId) {
        this.invId = invId;
    }

    public String getRawCode() {
        return rawCode;
    }

    public void setRawCode(String rawCode) {
        this.rawCode = rawCode;
    }

    public String getRawName() {
        return rawName;
    }

    public void setRawName(String rawName) {
        this.rawName = rawName;
    }

    public String getRawSupplier() {
        return rawSupplier;
    }

    public void setRawSupplier(String rawSupplier) {
        this.rawSupplier = rawSupplier;
    }

    public Integer getRawInvTotal() {
        return rawInvTotal;
    }

    public void setRawInvTotal(Integer rawInvTotal) {
        this.rawInvTotal = rawInvTotal;
    }

    public String getRawUnit() {
        return rawUnit;
    }

    public void setRawUnit(String rawUnit) {
        this.rawUnit = rawUnit;
    }

    public Integer getOutNum() {
        return outNum;
    }

    public void setOutNum(Integer outNum) {
        this.outNum = outNum;
    }

    public String getRawmtOutCode() {
        return rawmtOutCode;
    }

    public void setRawmtOutCode(String rawmtOutCode) {
        this.rawmtOutCode = rawmtOutCode;
    }

    public Integer getOperOutNum() {
        return operOutNum;
    }

    public void setOperOutNum(Integer operOutNum) {
        this.operOutNum = operOutNum;
    }
}