package com.bookstore.dao;

import com.bookstore.pojo.po.BookCategory;
import com.bookstore.pojo.po.BookCategoryExample;
import com.bookstore.pojo.vo.BookCategoryVo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookCategoryCustomerMapper {
    public List<BookCategoryVo> getCountCategories();
}