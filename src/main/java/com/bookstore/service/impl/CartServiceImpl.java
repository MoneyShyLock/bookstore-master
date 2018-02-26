package com.bookstore.service.impl;

import com.bookstore.dao.CartMapper;
import com.bookstore.pojo.po.Cart;
import com.bookstore.pojo.po.CartExample;
import com.bookstore.pojo.po.User;
import com.bookstore.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService{
    @Autowired
    private CartMapper cartMapper;

    @Override
    public List<Cart> findByUid(Long id) {
        CartExample cartExample=new CartExample();
        CartExample.Criteria criteria = cartExample.createCriteria();
        criteria.andUserIdEqualTo(id);
       /* User user = new User();
        user.setId(id);*/

        return cartMapper.selectByExample(cartExample);
    }

    @Override
    public void addCart(Cart  cart) {

        cartMapper.insert(cart);
    }
}
