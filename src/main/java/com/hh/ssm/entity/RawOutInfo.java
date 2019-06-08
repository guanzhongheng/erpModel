package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.Map;

/**
 * @Project : hhboot
 * @Description : 原材料申请出库基本信息表
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/31  12:25 AM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/31    create
 */
public class RawOutInfo implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    //申请领料编号
    private String rawmtOutCode;
    //申请人
    private String applicant;
    //申请状态：0-未处理；1-已处理；2-申请失败
    private Character status;
    //创建时间
    private Date createTime;
    //申请时间
    private String applyDate;
    //更新时间
    private Date updateTime;

    private Map<String, Object> map;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRawmtOutCode() {
        return rawmtOutCode;
    }

    public void setRawmtOutCode(String rawmtOutCode) {
        this.rawmtOutCode = rawmtOutCode;
    }

    public String getApplicant() {
        return applicant;
    }

    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getApplyDate() {
        return applyDate;
    }

    public void setApplyDate(String applyDate) {
        this.applyDate = applyDate;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Map<String, Object> getMap() {
        return map;
    }

    public void setMap(Map<String, Object> map) {
        this.map = map;
    }
}