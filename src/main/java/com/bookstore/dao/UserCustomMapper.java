package com.bookstore.dao;

import com.bookstore.pojo.po.User;
import com.bookstore.pojo.po.UserExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserCustomMapper {


    List<User> selectAll();
    List<User> selectAllVip();
    int getUserCount();
    void deleteUser(Long id);
    void modify(@Param("id") Long id,@Param("password") String password);
}