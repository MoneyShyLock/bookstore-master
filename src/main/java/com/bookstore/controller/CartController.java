package com.bookstore.controller;

import com.bookstore.common.util.MessageResult;
import com.bookstore.service.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

//购物车控制器
@Controller
public class CartController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CartService cartService;




}
