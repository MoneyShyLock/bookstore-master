package com.bookstore.controller;

import com.bookstore.common.util.JsonUtils;
import com.bookstore.common.util.MD5Util;
import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Admin;
import com.bookstore.pojo.po.User;
import com.bookstore.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.json.HTTP;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.List;
//用户控制器
@Controller
public class UserController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userService;

    //查询所用普通用户
    @RequestMapping(value = "/listUsers")
    public String listUsers(Model model, @RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
        PageHelper.startPage(pn, 4);
        List<User> userList = userService.listUsers();
        //泛型需要自己写vo
        PageInfo<User> pageInfo = new PageInfo(userList);
        model.addAttribute("pageUserInfo", pageInfo);
        session.setAttribute("userCount", userList.size());
        return "user_list";
    }
    //删除用户，修改is_valid字段
    @ResponseBody
    @RequestMapping("/delUser")
    public MessageResult delUser(Long uid) {
        MessageResult mr=new MessageResult();
        try {
            userService.deleteUser(uid);
            mr.setMessage("success");
        }catch (Exception e){
            mr.setMessage("fail");
        }
        return mr;
    }
    //初始化用户密码
    @ResponseBody
    @RequestMapping("/modify")
    public MessageResult modify(Long id) {
        MessageResult mr=new MessageResult();
        try {
            userService.modify(id);
            mr.setMessage("success");
        }catch (Exception e){
            mr.setMessage("fail");
        }
        return mr;
    }
    //查询所用VIP用户
    @RequestMapping(value = "/listVips")
    public String listVips(Model model, @RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {

        PageHelper.startPage(pn, 4);
        List<User> vipList = userService.listVips();
        session.setAttribute("vipCount", vipList.size());
        //泛型需要自己写vo
        PageInfo<User> pageInfo = new PageInfo(vipList);
        model.addAttribute("pageUserInfo", pageInfo);
        return "vip_list";
    }

    //用户报表
    @RequestMapping(value = "/userEchar")
    public String userEchar(Model model) {
        List<User> vipList = userService.listVips();
        model.addAttribute("vipCount", vipList.size());
        List<User> userList = userService.listUsers();
        model.addAttribute("userCount", userList.size());
        return "userEchar";
    }

    @RequestMapping("/saveUser")
    @ResponseBody
    public MessageResult registerUser(User user, HttpSession session) {
        MessageResult ms = new MessageResult();
        int count = 0;

        try {
            count = userService.registerUser(user);
            if (count > 0) {
                user.setPassword(null);
                ms.setData(JsonUtils.objectToJson(user));
                ms.setSuccess(true);
                ms.setMessage("创建成功");
                session.setAttribute("session_User", user);
            } else {
                ms.setData(JsonUtils.objectToJson(user));
                ms.setMessage("创建失败");
                ms.setSuccess(false);
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return ms;
    }

    //用户登陆
    @ResponseBody
    @RequestMapping(value = "/user/login", produces = "application/json;charset=UTF-8",
            method = RequestMethod.POST)
    public MessageResult login(String name, String password, HttpSession session) {

        System.out.println(name + password);
        MessageResult ms = new MessageResult();
        User user = new User();
        user.setUsername(name);
        user.setPassword(password);
        User existUser = null;
        try {
            existUser = userService.login(user);
            if (existUser == null) {
                //管理员名称不存在
                ms.setSuccess(false);
                ms.setMessage("该账户不存在");
                ms.setData(user);
                return ms;
            } else {
                //管理员名称存在
                //todo  MD5加密
                if (MD5Util.MD5(user.getPassword()).equals(existUser.getPassword())) {
                    //账户和密码都匹配
                    ms.setSuccess(true);
                    ms.setMessage("登录成功");
                    //登录成功的Admin存入session
                    session.setAttribute("session_User", existUser);
                    existUser.setPassword(null);
                    String json = JsonUtils.objectToJson(existUser);
                    ms.setData(json);
                    return ms;
                } else {
                    //管理员密码输入不正确
                    ms.setMessage("账号和密码不匹配");
                    ms.setSuccess(false);
                    ms.setData(user);
                    return ms;
                }
            }
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return ms;
    }

    //ajax 去查询管理员名是否存在
    @RequestMapping(value = "/user/{name}", produces = "application/json;charset=UTF-8", method = RequestMethod.GET)
    @ResponseBody
    public MessageResult getUserByName(@PathVariable String name) {
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
            mr = userService.getUserByName(loginName);

        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return mr;
    }

    //用户退出到登录界面
    @RequestMapping("/user_logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:toLoginProtal";
    }


}
