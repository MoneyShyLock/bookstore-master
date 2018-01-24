package com.bookstore.dao;

import com.bookstore.pojo.po.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminCustomMapper {

    List<Admin> listAdminsByQuery(@Param(value = "query")String query,@Param(value = "jurisdiction") Integer jurisdiction);
}
