package com.bookstore.controller;

import com.bookstore.common.util.JsonUtils;
import com.bookstore.common.util.MD5Util;
import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Admin;
import com.bookstore.service.AdminService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
//管理员控制器
@Controller
public class AdminController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private AdminService adminService;

    //    @ResponseBody
//    @RequestMapping("/getAdmin")
//    public Admin getAdminById(){
//        return adminService.getAdminById();
//    }
    //查询所有的管理员
    @RequestMapping(value = "/listAdmins")
    public String listAdmins(Model model, @RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(defaultValue = "") String query, @RequestParam(defaultValue = "") Integer jurisdiction, HttpSession session) {
        String encodeQuery = null;
        try {
            encodeQuery = java.net.URLDecoder.decode(query, "UTF-8");
            System.out.println(encodeQuery);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        PageHelper.startPage(pn, 4);
        List<Admin> adminList = adminService.listAdmins(query, jurisdiction);

        //泛型需要自己写vo
        PageInfo<Admin> pageInfo = new PageInfo(adminList);
        session.setAttribute("query", encodeQuery);
        session.setAttribute("jurisdiction", jurisdiction);
        model.addAttribute("pageInfo", pageInfo);
        return "admin_list";
    }

    //新增一个管理员
    @RequestMapping(value = "/admin", method = RequestMethod.POST)
    @ResponseBody
    public MessageResult saveAdmin(Admin admin) {
        System.out.println(admin.getJurisdiction());
        MessageResult ms = new MessageResult();

        int count = 0;

        try {
            count = adminService.saveAdmin(admin);
            if (count > 0) {
                admin.setPassword(null);
                ms.setData(JsonUtils.objectToJson(admin));
                ms.setSuccess(true);
                ms.setMessage("创建成功");

            } else {
                ms.setData(JsonUtils.objectToJson(admin));
                ms.setMessage("创建失败");
                ms.setSuccess(false);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return ms;
    }

    //ajax 去查询管理员名是否存在
    @RequestMapping(value = "/admin/{name}", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public MessageResult getAdminByName(@PathVariable String name) {
        String loginName = null;
        try {
            loginName = java.net.URLDecoder.decode(name, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        MessageResult mr = new MessageResult();
        try {
            if (loginName == null) {
                mr.setSuccess(false);
                mr.setMessage("未知的错误");
                return mr;
            }
            mr = adminService.getAdminByName(loginName);

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return mr;
    }

    //管理员登陆
    @ResponseBody
    @RequestMapping(value = "/admin/login", produces = "application/json;charset=UTF-8",
            method = RequestMethod.POST)
    public MessageResult login(String name, String password, HttpSession session) {

        System.out.println(name + password);
        MessageResult ms = new MessageResult();
        Admin admin = new Admin();
        admin.setName(name);
        admin.setPassword(password);
        Admin existAdmin = null;
        try {
            existAdmin = adminService.login(admin);
            if (existAdmin == null) {
                //管理员名称不存在
                ms.setSuccess(false);
                ms.setMessage("该管理员账户不存在");
                ms.setData(admin);
                return ms;
            } else {
                //管理员名称存在
                //todo  MD5加密
                if (MD5Util.MD5(admin.getPassword()).equals(existAdmin.getPassword())) {
                    //账户和密码都匹配
                    ms.setSuccess(true);
                    ms.setMessage("登录成功");
                    //登录成功的Admin存入session
                    session.setAttribute("Session_Admin", existAdmin);
                    existAdmin.setPassword(null);
                    String json = JsonUtils.objectToJson(existAdmin);
                    ms.setData(json);
                    return ms;
                } else {
                    //管理员密码输入不正确
                    ms.setMessage("账号和密码不匹配");
                    ms.setSuccess(false);
                    ms.setData(admin);
                    return ms;
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return ms;
    }

    //管理员注销
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:toLogin";
    }

    //禁用一个管理员
    @RequestMapping("/banAdmin/{ids}")
    @ResponseBody
    public MessageResult banAdmin(@PathVariable List<Long> ids, HttpSession session) {
        Admin session_admin = (Admin) session.getAttribute("Session_Admin");
        MessageResult mr = null;
        try {
            if (session_admin.getJurisdiction() == 0) {
                mr = adminService.banAdmin(ids);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return mr;
    }

    //解除禁用一个管理员
    @RequestMapping("/unbanAdmin/{ids}")
    @ResponseBody
    public MessageResult unbanAdmin(@PathVariable List<Long> ids) {

        MessageResult mr = null;
        try {
            mr = adminService.unbanAdmin(ids);
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return mr;
    }
}
