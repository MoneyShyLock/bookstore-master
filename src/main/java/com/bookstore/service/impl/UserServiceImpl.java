package com.bookstore.service.impl;

import com.bookstore.common.util.MD5Util;
import com.bookstore.common.util.MessageResult;
import com.bookstore.dao.UserCustomMapper;
import com.bookstore.dao.UserMapper;
import com.bookstore.pojo.po.*;
import com.bookstore.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private UserCustomMapper userCustomMapper;

    @Override
    public int registerUser(User user) {
        // id 自增
        //密码MD5 加密
        user.setPassword(MD5Util.MD5(user.getPassword()));
        user.setRegisterTime(new Date());
        int count = 0;
        try {
            count = userMapper.insertSelective(user);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return count;
    }

    @Override
    public MessageResult loginUser(User user) {
        return null;
    }

    @Override
    public MessageResult banUser(List<Long> ids) {
        return null;
    }

    @Override
    public MessageResult unbanUser(List<Long> ids) {
        return null;
    }

    @Override
    public MessageResult updateUser(User user) {
        return null;
    }

    @Override
    public MessageResult applyForVIP(List<Long> ids) {
        return null;
    }

    @Override
    public MessageResult unapplyVIP(List<Long> ids) {
        return null;
    }

    @Override
    public List<User> listUsers() {
        return userCustomMapper.selectAll();
    }

    @Override
    public List<User> listVips() {
        return userCustomMapper.selectAllVip();
    }

    //获得用户数量
    @Override
    public int getUserCount() {
        return userCustomMapper.getUserCount();
    }

    //删除用户
    @Override
    public void deleteUser(Long id) {
        userCustomMapper.deleteUser(id);
    }

    //初始化用户密码
    @Override
    public void modify(Long id) {
       String password= MD5Util.MD5("000000");
        userCustomMapper.modify(id,password);
    }

    @Override
    public List<User> listUsersBySearch(Map<String, Object> map) {
        return null;
    }

    @Override
    public MessageResult clearIntegration() {
        return null;
    }

    @Override
    public MessageResult totalIntegrationByComment(Comment comment) {
        return null;
    }

    @Override
    public MessageResult getUserByName(String loginName) {
        MessageResult mr = new MessageResult();
        UserExample example = new UserExample();
        UserExample.Criteria criteria = example.createCriteria();
        criteria.andUsernameEqualTo(loginName);
        List<User> users = userMapper.selectByExample(example);
        if (users.size() > 0) {
            mr.setSuccess(false);
            mr.setMessage("该账户已经被注册");
        } else {
            mr.setMessage("账户可使用");
            mr.setSuccess(true);
        }
        return mr;
    }

    @Override
    public User login(User user) {
        User existUser = null;
        try {
            UserExample example = new UserExample();
            UserExample.Criteria criteria = example.createCriteria();
            criteria.andUsernameEqualTo(user.getUsername());
            List<User> users = userMapper.selectByExample(example);
            if (users.size() > 0) {
                existUser = users.get(0);
            }

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }

        return existUser;
    }


}
