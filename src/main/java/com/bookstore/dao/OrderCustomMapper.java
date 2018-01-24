package com.bookstore.dao;

import com.bookstore.pojo.po.Admin;
import com.bookstore.pojo.vo.OrdersVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderCustomMapper {

    List<OrdersVO> listOrdersByQuery(@Param(value = "query") String query, @Param(value = "status") Integer status);

    OrdersVO getOrderById(Long id);
    List<OrdersVO> getOrderByUid(Long uid);

}
