package com.bookstore.pojo.vo;

import com.bookstore.pojo.po.Book;

public class BookVO extends Book{

    private String categoryName;

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
