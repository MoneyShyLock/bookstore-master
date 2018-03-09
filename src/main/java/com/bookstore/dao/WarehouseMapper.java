package com.bookstore.dao;


import com.bookstore.pojo.po.Warehouse;

import java.util.List;


public interface WarehouseMapper {
    int insert(Warehouse record);

    List<Warehouse> listOutBook(Warehouse warehouse);

    List<Warehouse> findAll();

    List<Warehouse> findAllPut();

    List<Warehouse> listPutBook(Warehouse warehouse);
}