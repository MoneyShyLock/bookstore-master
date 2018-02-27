package com.bookstore.service;

import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Address;
import com.bookstore.pojo.po.Book;
import com.bookstore.pojo.po.User;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.CountBook;

import java.util.List;

public interface AddressService {


    List<Address> findByUid(User user);

    Address findById(Long addrId);
}
