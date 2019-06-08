package com.hh.ssm.domain.common;

public class PageList {

    //当前页

    private Integer page=1;

    //页大小

    private Integer rows=5;

    // 总记录 数

    private Integer totalRecord;

    //总页数

    private Integer totalPage;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public Integer getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(Integer totalRecord) {
        this.totalRecord = totalRecord;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }
}
