package com.bookstore.service;

import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Admin;
import com.bookstore.pojo.po.Comment;
import com.bookstore.pojo.po.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    //ajax 校验用户名是否存在
    MessageResult getUserByName(String loginName);

    //注册一个用户
    int registerUser(User user);
    //登陆
    MessageResult loginUser(User user);
    //删除  修改状态
    MessageResult banUser(List<Long> ids);

    MessageResult unbanUser(List<Long> ids);

    //个人更改自己的资料
    MessageResult updateUser(User user);
    //成为会员
    MessageResult applyForVIP(List<Long> ids);

    MessageResult unapplyVIP(List<Long> ids);
    // 查询个人信息
    // cookie 中
    // 用户列表
    List<User> listUsers();
    //高级查询
    List<User> listUsersBySearch(Map<String,Object> map);
    // 积分清除
    MessageResult clearIntegration();
    //消费金额累计 积分计算
    //MessageResult totalMoneyAndIntegration();

    //评论增加积分
    MessageResult totalIntegrationByComment(Comment comment);

    User login(User user);


    List<User> listVips();

    int getUserCount();
//删除用户
    void deleteUser(Long id);

    void modify(Long id);
}
