package com.bookstore.service.impl;

import com.bookstore.common.util.MD5Util;
import com.bookstore.common.util.MessageResult;
import com.bookstore.dao.AdminCustomMapper;
import com.bookstore.dao.AdminMapper;
import com.bookstore.pojo.po.Admin;
import com.bookstore.pojo.po.AdminExample;
import com.bookstore.service.AdminService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class AdminServiceImpl implements AdminService{

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private AdminMapper adminMapper;

    @Autowired
    private AdminCustomMapper adminCustomMapper;
    @Override
    public Admin getAdminById() {
        return null;
    }

    @Override
    public List<Admin> listAdmins(String query,Integer jurisdiction) {
        List<Admin> list = null;
        try {
            list=  adminCustomMapper.listAdminsByQuery(query,jurisdiction);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
        }
        return list;
    }

    @Override
    public int saveAdmin(Admin admin) {
        // 管理员的id 自增
        //密码MD5 加密
        admin.setPassword(MD5Util.MD5(admin.getPassword()));
        admin.setCreateTime(new Date());
        admin.setUpdateTime(new Date());
        admin.setIsDelete(0);
        int count = 0;
        try {
            count = adminMapper.insertSelective(admin);
        }catch (Exception e){
            logger.error(e.getMessage(),e);
        }
        return count;
    }

    @Override
    public MessageResult getAdminByName(String name) {
        MessageResult mr = new MessageResult();
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andNameEqualTo(name);
        List<Admin> adminList = adminMapper.selectByExample(example);
        if(adminList.size()>0){
            mr.setSuccess(false);
            mr.setMessage("该账户已经被注册");
        }else {
            mr.setMessage("账户可使用");
            mr.setSuccess(true);
        }
        return mr;
    }

    @Override
    public Admin login(Admin admin) {
        Admin existAdmin = null;
        try{
            AdminExample example = new AdminExample();
            AdminExample.Criteria criteria = example.createCriteria();
            criteria.andNameEqualTo(admin.getName());
            List<Admin> admins = adminMapper.selectByExample(example);
            if(admins.size()>0) {
                existAdmin = admins.get(0);
                AdminExample example1 = new AdminExample();
                existAdmin.setLastLoginTime(new Date());
                System.out.println(existAdmin.getId());
                example1.createCriteria().andIdEqualTo(existAdmin.getId());
                adminMapper.updateByExampleSelective(existAdmin,example1);
            }

        }catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

        return existAdmin;
    }

    @Override
    public MessageResult banAdmin(List<Long> ids) {
        MessageResult mr = new MessageResult();
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        Admin record = new Admin();
        record.setIsDelete(99);
        int count = adminMapper.updateByExampleSelective(record,example);
        if(count>0){
            mr.setSuccess(true);
            mr.setMessage("禁用成功");
        }else {
            mr.setSuccess(false);
            mr.setMessage("未知错误,禁用失败了");
        }
        return mr;
    }
    @Override
    public MessageResult unbanAdmin(List<Long> ids) {
        MessageResult mr = new MessageResult();
        AdminExample example = new AdminExample();
        AdminExample.Criteria criteria = example.createCriteria();
        criteria.andIdIn(ids);
        Admin record = new Admin();
        record.setIsDelete(0);
        int count = adminMapper.updateByExampleSelective(record,example);
        if(count>0){
            mr.setSuccess(true);
            mr.setMessage("解除成功");
        }else {
            mr.setSuccess(false);
            mr.setMessage("未知错误,操作失败了");
        }
        return mr;
    }
}
