package com.bookstore.pojo.po;

import java.util.Date;

public class Search {
    private Long id;

    private String keyword;

    private Integer count;

    private Date createtime;

    private Byte issensitive;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Byte getIssensitive() {
        return issensitive;
    }

    public void setIssensitive(Byte issensitive) {
        this.issensitive = issensitive;
    }
}