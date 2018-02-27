package com.bookstore.service.impl;

import com.bookstore.common.util.JsonUtils;
import com.bookstore.common.util.MessageResult;
import com.bookstore.dao.AddressMapper;
import com.bookstore.dao.BookCustomMapper;
import com.bookstore.dao.BookMapper;
import com.bookstore.pojo.po.*;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.CountBook;
import com.bookstore.service.AddressService;
import com.bookstore.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private AddressMapper addressMapper;

    @Override
    public List<Address> findByUid(User user) {

        return addressMapper.findByUid(user.getId());
    }

    @Override
    public Address findById(Long addrId) {
        return addressMapper.selectByPrimaryKey(addrId);
    }
}
