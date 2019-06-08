package com.hh.ssm.domain.vo;

import java.util.List;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/23  3:09 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/23    create
 */
public class ContractInsertOrUpdateVo {
    //合同ID
    private Long id;
    //合同编号
    private String code;
    //合同名称
    private String name;
    //合同经办人
    private String manager;
    //合同签订时间
    private String createTime;
    //合同状态
    private Character status;
    //合同交付时间
    private String endTime;
    //合同评审表
    private String attachment;
    //产品列表
    private List<ProductVO> prodList;

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

    public String getManager() {
        return manager;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public List<ProductVO> getProdList() {
        return prodList;
    }

    public void setProdList(List<ProductVO> prodList) {
        this.prodList = prodList;
    }
}