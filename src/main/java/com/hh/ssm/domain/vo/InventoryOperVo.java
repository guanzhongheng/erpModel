package com.hh.ssm.domain.vo;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/27  11:19 PM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/27    create
 */
public class InventoryOperVo {

    //合同ID
    private String contId;
    //合同编号
    private String conCode;
    //产品名称
    private String proName;
    private Integer flg;
    //合同编号
    private Character contStatus;

    public String getContId() {
        return contId;
    }

    public void setContId(String contId) {
        this.contId = contId;
    }

    public Integer getFlg() {
        return flg;
    }

    public void setFlg(Integer flg) {
        this.flg = flg;
    }

    public Character getContStatus() {
        return contStatus;
    }

    public void setContStatus(Character contStatus) {
        this.contStatus = contStatus;
    }

    public String getConCode() {
        return conCode;
    }

    public void setConCode(String conCode) {
        this.conCode = conCode;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }
}