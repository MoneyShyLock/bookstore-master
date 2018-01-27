package com.bookstore.service.impl;

import com.bookstore.common.util.JsonUtils;
import com.bookstore.common.util.MessageResult;
import com.bookstore.dao.BookCustomMapper;
import com.bookstore.dao.BookMapper;
import com.bookstore.pojo.po.Book;
import com.bookstore.pojo.po.BookExample;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.CountBook;
import com.bookstore.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private BookCustomMapper bookCustomMapper;
    @Autowired
    private BookMapper bookMapper;

    @Override
    public MessageResult saveBook(Book book) {
        String s = JsonUtils.objectToJson(book);
        MessageResult messageResult = new MessageResult();
        try {
            int count = bookMapper.insertSelective(book);
            if (count > 0) {
                messageResult.setSuccess(true);
                messageResult.setMessage("插入成功");
                messageResult.setData(s);
            } else {
                messageResult.setMessage("操作失败");
                messageResult.setSuccess(false);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

        return messageResult;
    }

    @Override
    public MessageResult updateBook(List<Long> ids) {
        return null;
    }

    @Override
    public int updateInventory(Book book) {
        book.setUpdated(new Date());
        int count = bookMapper.updateByPrimaryKeySelective(book);
        return count;
    }

    @Override
    public int addBookInventory(Book book) {
        return 0;
    }

    @Override
    public MessageResult subBookInventory(List<Long> ids, int inventory) {
        return null;
    }

    @Override
    public MessageResult upBook(List<Long> ids) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andIdIn(ids);
        Book record = new Book();
        MessageResult messageResult = new MessageResult();
        record.setStatus(1);
        try {
            int count = bookMapper.updateByExampleSelective(record, bookExample);
            if (count > 0) {
                messageResult.setMessage("书籍上架成功");
                messageResult.setSuccess(true);
            } else {
                messageResult.setMessage("操作失败");
                messageResult.setSuccess(false);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return messageResult;
    }

    @Override
    public MessageResult downBook(List<Long> ids) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andIdIn(ids);
        Book record = new Book();
        MessageResult messageResult = new MessageResult();
        record.setStatus(2);
        try {
            int count = bookMapper.updateByExampleSelective(record, bookExample);
            if (count > 0) {
                messageResult.setMessage("书下架成功");
                messageResult.setSuccess(true);
            } else {
                messageResult.setMessage("操作失败");
                messageResult.setSuccess(false);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return messageResult;
    }

    @Override
    public List<BookVO> listBook_new() {
        List<BookVO> list = null;
        try {
            list = bookCustomMapper.listBook_new();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return list;
    }


    @Override
    public List<BookVO> listBook_recommended() {
        List<BookVO> list = null;
        try {
            list = bookCustomMapper.listBook_recommended();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return list;
    }

    @Override
    public List<BookVO> listBook_specialSupply() {
        List<BookVO> list = null;
        try {
            list = bookCustomMapper.listBook_specialSupply();
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return list;
    }

    @Override
    public BookVO getBookForProtal(Long id) {
        return bookCustomMapper.getBookForProtal(id);

    }

    @Override
    public BookVO getBookForBack(Long id) {
        BookVO bookVO = null;
        try {
            bookVO = bookCustomMapper.getBookForBack(id);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return bookVO;
    }

    @Override
    public List<Book> listBooks(String query) {

        List<Book> list = null;
//        BookExample example = new BookExample();
//        BookExample.Criteria criteria = example.createCriteria();
//        criteria.andBooknameLike(query);
        try {
            if (query == null || query.isEmpty()) {
                list = bookMapper.selectByExample(null);
            } else {
                BookExample example = new BookExample();
                BookExample.Criteria criteria = example.createCriteria();
                criteria.andBooknameLike(query);
                list = bookMapper.selectByExample(example);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return list;
    }

    @Override
    public CountBook countBook() {
        return bookCustomMapper.countBooks();
    }
}
