package com.bookstore.service;

import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.*;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.CountBook;

import java.util.List;

public interface AddressService {


    List<Address> findByUid(User user,Long id);

    Address findById(Long addrId);

    List<Province> findAllProvince();

    List<City> findByProvinceCode(String provinceCode);

    List<Area> findByCityCode(String cityCode);

    Province findProcinceByCode(String province);

    City findCityByCode(String city);

    Area findAreaByCode(String area);

    void add(Address address);

    void deleteAddress(Long id);
}
