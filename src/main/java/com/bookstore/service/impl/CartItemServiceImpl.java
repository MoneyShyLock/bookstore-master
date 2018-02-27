package com.bookstore.service.impl;

import com.bookstore.dao.CartItemMapper;
import com.bookstore.pojo.po.CartExample;
import com.bookstore.pojo.po.CartItem;
import com.bookstore.pojo.po.CartItemExample;
import com.bookstore.service.CartItemService;
import com.bookstore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

@Service
public class CartItemServiceImpl implements CartItemService{
    @Autowired
    private CartItemMapper cartItemMapper;

    //添加商品到购物车
    @Override
    public void addCartItem(Long bookId, Long id, BigDecimal subtotal,int quantity) {
        CartItem cartItem = new CartItem();
        cartItem.setBookId(bookId);
        cartItem.setCreateTime(new Date());
        cartItem.setQuantity(quantity);
        cartItem.setSubtotal(subtotal);
        cartItem.setCartId(id);
        cartItemMapper.insertSelective(cartItem);
    }
   //查询购物车的商品
    @Override
    public List<CartItem> findByCartId(Long id) {
        CartItemExample example = new CartItemExample();
        CartItemExample.Criteria criteria = example.createCriteria();
        criteria.andCartIdEqualTo(id);
        return cartItemMapper.selectByExample(example);
    }
}
