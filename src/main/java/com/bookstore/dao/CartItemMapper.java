package com.bookstore.dao;

import com.bookstore.pojo.po.CartItem;
import com.bookstore.pojo.po.CartItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CartItemMapper {
    int countByExample(CartItemExample example);

    int deleteByExample(CartItemExample example);

    int deleteByPrimaryKey(Long id);

    int insert(CartItem record);

    int insertSelective(CartItem record);

    List<CartItem> selectByExample(CartItemExample example);

    CartItem selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") CartItem record, @Param("example") CartItemExample example);

    int updateByExample(@Param("record") CartItem record, @Param("example") CartItemExample example);

    int updateByPrimaryKeySelective(CartItem record);

    int updateByPrimaryKey(CartItem record);
}