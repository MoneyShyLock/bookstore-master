package com.bookstore.service;

import com.bookstore.pojo.vo.ContentVo;
import com.bookstore.pojo.vo.OrdersVO;

import java.util.List;

public interface OrderService {


    List<OrdersVO> listOrders(String query, Integer status);

    OrdersVO getOrderById(Long id);

    List<OrdersVO> getOrderByUid(Long id);
}
