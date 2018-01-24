package com.bookstore.service;

import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Book;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.CountBook;

import java.util.List;

public interface BookService {

    //新增书籍
    MessageResult saveBook(Book book);
    //修改书籍
    MessageResult updateBook(List<Long> ids);
    //增加库存  入库
    MessageResult addBookInventory(List<Long> ids,int inventory);
    //出库
    MessageResult subBookInventory(List<Long> ids,int inventory);

    //上架
    MessageResult upBook(List<Long> ids);
    //下架
    MessageResult downBook(List<Long> ids);

    //新书上架
    List<BookVO> listBook_new();
    //主编推荐
    List<BookVO> listBook_recommended();
    //独家特供
    List<BookVO> listBook_specialSupply();

    //销量排行-----日  周  月 年

    //前台图书详情
    BookVO getBookForProtal(Long id);
    //后台图书详情
    BookVO getBookForBack(Long id);

    //书籍列表
    List<Book> listBooks(String query);

    CountBook countBook();
}
