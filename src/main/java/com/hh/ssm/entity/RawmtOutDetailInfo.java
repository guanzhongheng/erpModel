package com.hh.ssm.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * @Project : hhboot
 * @Description : TODO
 * @Author : lijinku
 * @Iteration : 1.0
 * @Date : 2019/5/31  12:30 AM
 * @ModificationHistory Who          When          What
 * ----------   ------------- -----------------------------------
 * lijinku          2019/05/31    create
 */
public class RawmtOutDetailInfo implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long id;
    //申请领料编号
    private String rawmtOutCode;
    //原材料编号
    private String rawCode;
    //领料数量
    private Integer outNum;
    //创建时间
    private Date createTime;

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

    public String getRawCode() {
        return rawCode;
    }

    public void setRawCode(String rawCode) {
        this.rawCode = rawCode;
    }

    public Integer getOutNum() {
        return outNum;
    }

    public void setOutNum(Integer outNum) {
        this.outNum = outNum;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}