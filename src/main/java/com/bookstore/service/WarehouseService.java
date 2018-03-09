package com.bookstore.service;


import com.bookstore.pojo.po.Warehouse;

import java.util.List;

public interface WarehouseService {
    void add(Warehouse warehouse);

    List<Warehouse> listOutBook(int year,int month);

    List<Warehouse> listOutBook(int year,int month,int week);

    List<Warehouse> listBook();

    List<Warehouse> listPutBook();
    List<Warehouse> listPutBook(int year,int month);
    List<Warehouse> listPutBook(int year,int month,int week);
}
