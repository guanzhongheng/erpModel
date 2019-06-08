package com.hh.ssm.domain.vo;

import java.util.List;
import java.util.Map;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/18  10:37 AM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/18    create
 */
public class ContractVo {
    //合同Id
    private Long contId;
    //合同编号
    private String contCode;
    //合同名称
    private String contName;
    //合同经办人
    private String manager;
    //合同状态
    private Character status;
    //合同签订日期
    private String signDate;
    //交货日期
    private String deleveyDate;
    //附件
    private String attachment;

    private List<ContractDetailVo> detailVoList;

    public List<ContractDetailVo> getDetailVoList() {
        return detailVoList;
    }

    public void setDetailVoList(List<ContractDetailVo> detailVoList) {
        this.detailVoList = detailVoList;
    }

    private List<Map<String,Object>> prodList;

    public List<Map<String, Object>> getProdList() { return prodList; }

    public void setProdList(List<Map<String, Object>> prodList) { this.prodList = prodList; }

    public Long getContId() {
        return contId;
    }

    public void setContId(Long contId) {
        this.contId = contId;
    }

    public String getContCode() {
        return contCode;
    }

    public void setContCode(String contCode) {
        this.contCode = contCode;
    }

    public String getContName() {
        return contName;
    }

    public void setContName(String contName) {
        this.contName = contName;
    }

    public void setManager(String manager) {
        this.manager = manager;
    }

    public String getManager() {
        return manager;
    }


    public void setStatus(Character status) {
        this.status = status;
    }

    public Character getStatus() {
        return status;
    }


    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public String getAttachment() {
        return attachment;
    }

    public String getSignDate() {
        return signDate;
    }

    public void setSignDate(String signDate) {
        this.signDate = signDate;
    }

    public String getDeleveyDate() {
        return deleveyDate;
    }

    public void setDeleveyDate(String deleveyDate) {
        this.deleveyDate = deleveyDate;
    }

}