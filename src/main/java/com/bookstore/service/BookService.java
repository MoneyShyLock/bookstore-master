package com.bookstore.service;

import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Book;
import com.bookstore.pojo.vo.BookVO;
//import com.bookstore.pojo.vo.CartVO;
import com.bookstore.pojo.vo.CountBook;

import java.util.List;

public interface BookService {

    //新增书籍
    MessageResult saveBook(Book book);
    //修改书籍
    MessageResult updateBook(List<Long> ids);
    //更新库存以及相关信息
    int updateInventory(Book book);
    //增加库存  入库
    int addBookInventory(Book book);
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
    //特价图书
    List<BookVO> listBook_specialOffer();

    //前台图书详情
    BookVO getBookForProtal(Long id);
    //后台图书详情
    BookVO getBookForBack(Long id);

    //书籍列表
    List<Book> listBooks(String query);

    CountBook countBook();


    List<Book> getBookByKinds(Integer kinds);

    Book getBookById(Long bookId);
}
