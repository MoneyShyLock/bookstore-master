package com.bookstore.service;

import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Admin;

import java.util.List;

public interface AdminService {

    public Admin getAdminById();

    List<Admin> listAdmins(String query,Integer jurisdiction);

    int saveAdmin(Admin admin);

    MessageResult getAdminByName(String loginName);

    Admin login(Admin admin);

    MessageResult banAdmin(List<Long> ids);

    MessageResult unbanAdmin(List<Long> ids);
}
