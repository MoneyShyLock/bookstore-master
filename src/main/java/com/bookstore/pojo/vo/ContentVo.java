package com.bookstore.pojo.vo;

import com.bookstore.pojo.po.Orders;

/**
 * Created by Administrator on 2018/1/23.
 */
public class ContentVo{
    private Long bookid;
    private String bookname;
    private double price;
    private int count;
    private int cid;

    public ContentVo() {
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getCid() {
        return cid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public Long getBookid() {

        return bookid;
    }

    public void setBookid(Long bookid) {
        this.bookid = bookid;
    }
}
