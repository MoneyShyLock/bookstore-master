package com.bookstore.dao;

import com.bookstore.pojo.po.OrderItem;
import com.bookstore.pojo.vo.OrdersVO;

import java.util.List;

public interface OrderItemCustomMapper {

    List<OrderItem> listOrderItems(Long orderId);
}
