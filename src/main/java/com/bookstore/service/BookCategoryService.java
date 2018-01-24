package com.bookstore.service;

import com.bookstore.pojo.po.BookCategory;
import com.bookstore.pojo.vo.BookCategoryVo;

import java.util.List;

public interface BookCategoryService {
    List<BookCategory> listBookCategories();

    List<BookCategoryVo> listBookCategoriesCount();
}
