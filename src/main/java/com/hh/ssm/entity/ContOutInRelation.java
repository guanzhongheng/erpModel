package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/23  5:00 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/23    create
 */
public class ContOutInRelation implements Serializable {
    private static final long serialVersionUID = 1L;
    //关系ID
    private Long relationId;
    //合同明细ID
    private Long conDetailId;
    //出入库ID
    private Long outInId;
    //关系状态：0-有效；1-无效
    private Character relationStatus;
    //创建时间
    private Date createTime;
    //更新时间
    private Date updateTime;

    public Long getRelationId() {
        return relationId;
    }

    public void setRelationId(Long relationId) {
        this.relationId = relationId;
    }

    public Long getConDetailId() {
        return conDetailId;
    }

    public void setConDetailId(Long conDetailId) {
        this.conDetailId = conDetailId;
    }

    public Long getOutInId() {
        return outInId;
    }

    public void setOutInId(Long outInId) {
        this.outInId = outInId;
    }

    public Character getRelationStatus() {
        return relationStatus;
    }

    public void setRelationStatus(Character relationStatus) {
        this.relationStatus = relationStatus;
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