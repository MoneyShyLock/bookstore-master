package com.bookstore.pojo.po;

import java.util.Date;


public class Warehouse {
    private Long id;
    private Date time;
    private Long deliveryCount;
    private Long entryCount;
    private Long inventory;
    private Long bookId;
    private Long bookNumber;
    private int year;
    private int month;
    private int week;



    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Long getDeliveryCount() {
        return deliveryCount;
    }

    public void setDeliveryCount(Long deliveryCount) {
        this.deliveryCount = deliveryCount;
    }

    public Long getEntryCount() {
        return entryCount;
    }

    public void setEntryCount(Long entryCount) {
        this.entryCount = entryCount;
    }

    public Long getInventory() {
        return inventory;
    }

    public void setInventory(Long inventory) {
        this.inventory = inventory;
    }

    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public Long getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(Long bookNumber) {
        this.bookNumber = bookNumber;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getMonth() {
        return month;
    }

    public void setMonth(int month) {
        this.month = month;
    }

    public int getWeek() {
        return week;
    }

    public void setWeek(int week) {
        this.week = week;
    }

    @Override
    public String toString() {
        return "Warehouse{" +
                "id=" + id +
                ", time=" + time +
                ", deliveryCount=" + deliveryCount +
                ", entryCount=" + entryCount +
                ", inventory=" + inventory +
                ", bookId=" + bookId +
                ", bookNumber=" + bookNumber +
                ", year=" + year +
                ", month=" + month +
                ", week=" + week +
                '}';
    }
}
