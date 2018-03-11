package com.bookstore.service;

import com.bookstore.pojo.po.CartItem;

import java.math.BigDecimal;
import java.util.List;

public interface CartItemService {
    void addCartItem(Long bookId, Long id, BigDecimal subtotal,int quantity);

    List<CartItem> findByCartId(Long id);

    void delete(Long id);
}
