package com.bookstore.service;

import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Cart;
import com.bookstore.pojo.po.User;

import java.util.List;

public interface CartService {
    //通过用户id查询购物车
    List<Cart> findByUid(Long id);
    //新增购物车
    void addCart(Cart cart);


    //修改购物车
    //清空购物车
}
