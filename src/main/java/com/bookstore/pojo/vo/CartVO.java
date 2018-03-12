package com.bookstore.pojo.vo;

import com.bookstore.pojo.po.Book;

import java.math.BigDecimal;

public class CartVO extends Book{

    private Integer quantity;
    private BigDecimal subtotal;
    private Long cartItemId;

    public Long getCartItemId() {
        return cartItemId;
    }

    public void setCartItemId(Long cartItemId) {
        this.cartItemId = cartItemId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    @Override
    public String toString() {
        return "CartVO{" +
                "quantity=" + quantity +
                ", subtotal=" + subtotal +
                ", cartItemId=" + cartItemId +
                '}';
    }
}
