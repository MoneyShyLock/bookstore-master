package com.bookstore.service.impl;

import com.bookstore.dao.WarehouseMapper;
import com.bookstore.pojo.po.Warehouse;
import com.bookstore.service.WarehouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class WarehouseServiceImpl implements WarehouseService{
    @Autowired
    private WarehouseMapper warehouseMapper;
    @Override
    public void add(Warehouse warehouse) {
        warehouseMapper.insert(warehouse);

    }

    @Override
    public List<Warehouse> listOutBook(int year,int month) {
        Warehouse warehouse = new Warehouse();
        if(year!=0){
        warehouse.setYear(year);
        }
        if (month!=0){
        warehouse.setMonth(month);
        }
        return warehouseMapper.listOutBook(warehouse);
    }

    @Override
    public List<Warehouse> listOutBook(int year,int month,int week) {
        Warehouse warehouse = new Warehouse();
        warehouse.setYear(year);
        warehouse.setMonth(month);
        warehouse.setWeek(week);
        return warehouseMapper.listOutBook(warehouse);
    }

    @Override
    public List<Warehouse> listBook() {
        return warehouseMapper.findAll();
    }

    @Override
    public List<Warehouse> listPutBook() {
        return warehouseMapper.findAllPut();
    }

    @Override
    public List<Warehouse> listPutBook(int year, int month) {

        Warehouse warehouse = new Warehouse();
        if(year!=0){
            warehouse.setYear(year);
        }
        if (month!=0){
            warehouse.setMonth(month);
        }
        return warehouseMapper.listPutBook(warehouse);

    }

    @Override
    public List<Warehouse> listPutBook(int year, int month, int week) {
        Warehouse warehouse = new Warehouse();
        warehouse.setYear(year);
        warehouse.setMonth(month);
        warehouse.setWeek(week);
        return warehouseMapper.listPutBook(warehouse);

    }
}
