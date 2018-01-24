package com.bookstore.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bookstore.common.util.JsonUtils;
import com.bookstore.dao.OrderCustomMapper;
import com.bookstore.dao.OrderItemCustomMapper;
import com.bookstore.pojo.po.OrderItem;
import com.bookstore.pojo.vo.ContentVo;
import com.bookstore.pojo.vo.OrdersVO;
import com.bookstore.service.OrderService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 2018/1/22.
 */
@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderCustomMapper orderCustomMapper;
    @Autowired
    private OrderItemCustomMapper orderItemCustomMapper;
    @Override
    public List<OrdersVO> listOrders(String query, Integer status) {
        List<OrdersVO> orders=orderCustomMapper.listOrdersByQuery(query,status);
        Iterator<OrdersVO> it=orders.iterator();
        while (it.hasNext()) {
            OrdersVO ordersVO = it.next();
            List<OrderItem> orderItems = orderItemCustomMapper.listOrderItems(ordersVO.getId());
                BigDecimal amount = new BigDecimal("0");
            if (orderItems.size() != 0) {
                for (OrderItem orderItem : orderItems) {
                    amount=amount.add(orderItem.getSubtotal());
                }
            }
                ordersVO.setAmounts(amount);
            }
        return orders;
    }

    @Override
    public OrdersVO getOrderById(Long id) {
        return orderCustomMapper.getOrderById(id);
    }

    @Override
    public List<OrdersVO> getOrderByUid(Long uid) {

        List<OrdersVO> ordersVOs=orderCustomMapper.getOrderByUid(uid);


        for(OrdersVO ordersVO:ordersVOs) {
           List<ContentVo> contentVo= JSONArray.parseArray(ordersVO.getContent(), ContentVo.class);
        }
        System.out.println("转换成公");
        return ordersVOs;
    }
}
