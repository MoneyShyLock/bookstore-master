package com.bookstore.service.impl;

import com.bookstore.dao.BookCategoryCustomerMapper;
import com.bookstore.dao.BookCategoryMapper;
import com.bookstore.pojo.po.BookCategory;
import com.bookstore.pojo.po.BookCategoryExample;
import com.bookstore.pojo.vo.BookCategoryVo;
import com.bookstore.service.BookCategoryService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookCategoryServiceImpl implements BookCategoryService{

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private BookCategoryMapper bookCategoryMapper;
    @Autowired
    private BookCategoryCustomerMapper bookCategoryCustomerMapper;
    @Override
    public List<BookCategory> listBookCategories() {
        BookCategoryExample example = new BookCategoryExample();
        example.createCriteria().andParentNotEqualTo(0);
        List<BookCategory> bookCategories = bookCategoryMapper.selectByExample(example);
        return bookCategories;
    }

    @Override
    public List<BookCategoryVo> listBookCategoriesCount() {
        return bookCategoryCustomerMapper.getCountCategories();
    }


}
