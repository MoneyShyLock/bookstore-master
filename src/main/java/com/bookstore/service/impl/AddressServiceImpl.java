package com.bookstore.service.impl;


import com.bookstore.dao.AddressMapper;

import com.bookstore.dao.AreaMapper;
import com.bookstore.dao.CityMapper;
import com.bookstore.dao.ProvinceMapper;
import com.bookstore.pojo.po.*;

import com.bookstore.service.AddressService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private AddressMapper addressMapper;
    @Autowired
    private ProvinceMapper provinceMapper;
    @Autowired
    private CityMapper cityMapper;
    @Autowired
    private AreaMapper areaMapper;

    @Override
    public List<Address> findByUid(User user,Long id) {
        Address address =new Address();
        address.setId(id);
        address.setUid(user.getId());
        return addressMapper.findByUid(address);
    }

    @Override
    public Address findById(Long addrId) {
        return addressMapper.selectByPrimaryKey(addrId);
    }

    @Override
    public List<Province> findAllProvince() {
        ProvinceExample example = new ProvinceExample();
        ProvinceExample.Criteria criteria =example.createCriteria();
        criteria.andIdIsNotNull();
        return provinceMapper.selectByExample(example);
    }

    @Override
    public List<City> findByProvinceCode(String provinceCode) {
        CityExample example = new CityExample();
        CityExample.Criteria criteria = example.createCriteria();
        criteria.andProvincecodeEqualTo(provinceCode);
        return  cityMapper.selectByExample(example);
    }

    @Override
    public List<Area> findByCityCode(String cityCode) {
        AreaExample example = new AreaExample();
        AreaExample.Criteria criteria = example.createCriteria();
        criteria.andCitycodeEqualTo(cityCode);
        return areaMapper.selectByExample(example);
    }

    @Override
    public Province findProcinceByCode(String province) {
        ProvinceExample example = new ProvinceExample();
        ProvinceExample.Criteria criteria =example.createCriteria();
        criteria.andCodeEqualTo(province);
       List<Province> provinces=provinceMapper.selectByExample(example);
        if(provinces!=null)
            return provinces.get(0);
        return null;
    }

    @Override
    public City findCityByCode(String city) {
        CityExample example = new CityExample();
        CityExample.Criteria criteria = example.createCriteria();
        criteria.andCodeEqualTo(city);
        List<City> cities=cityMapper.selectByExample(example);
        if(cities!=null)
            return cities.get(0);
        return null;
    }

    @Override
    public Area findAreaByCode(String area) {
        AreaExample example = new AreaExample();
        AreaExample.Criteria criteria = example.createCriteria();
        criteria.andCodeEqualTo(area);
        List<Area> cities=areaMapper.selectByExample(example);
        if(cities!=null)
            return cities.get(0);
        return null;
    }

    @Override
    public void add(Address address) {
        addressMapper.insert(address);
    }
}
