package com.bookstore.pojo.vo;

import com.bookstore.pojo.po.Orders;

import java.util.List;

public class PersonalOrderVO {
    private String title;
    private List<Orders> list;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Orders> getList() {
        return list;
    }

    public void setList(List<Orders> list) {
        this.list = list;
    }
}
