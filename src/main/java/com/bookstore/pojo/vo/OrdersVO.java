package com.bookstore.pojo.vo;

import com.bookstore.pojo.po.Orders;

import java.math.BigDecimal;
import java.util.List;

public class OrdersVO extends Orders{
    private String username;
    private BigDecimal amounts;
    private List<ContentVo> books;

    public List<ContentVo> getBooks() {
        return books;
    }

    public void setBooks(List<ContentVo> books) {
        this.books = books;
    }

    public OrdersVO() {
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public BigDecimal getAmounts() {
        return amounts;
    }

    public void setAmounts(BigDecimal amounts) {
        this.amounts = amounts;
    }
}
