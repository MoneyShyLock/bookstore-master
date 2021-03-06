package com.bookstore.controller;

import com.bookstore.pojo.po.Admin;
import com.bookstore.pojo.po.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

//页面跳转控制器
@Controller
public class PageController {

    /**
     *  访问bookstore后台的控制器
     * @return
     */
    @RequestMapping("/index")
    public String toBackgroudIndex(HttpSession session){
        Admin admin=(Admin) session.getAttribute("Session_Admin");
        if(admin!=null)
          return "index";
        return  "signin";

    }

    /**
     * 访问登陆页面的控制器
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLoginPage(){
        return "signin";
    }

    /**
     * 新增一个管理员页面的控制器
     * @return
     */
    @RequestMapping("/toSignup")
    public String toSignupPage(){
        return "signup";
    }

    @RequestMapping("/user_order_timeline")
    public String toOrders(){
        return "user_order_timeline";
    }



    @RequestMapping("/protal_detail")
    public String toDetail(){
        return "protal_detail";
    }
    @RequestMapping("/cart")
    public String toCart(){
        return "cart";
    }


    @RequestMapping("/addBook")
    public String toAddBook(){
        return "add_book";
    }

    @RequestMapping("/toLoginProtal")
    public String toProtalLogin(){
        return "login";
    }

    @RequestMapping("/register")
    public String toRegister(){
        return "register";
    }
    //测试
    @RequestMapping("/putInBook")
    public String toputInBook(){
        return "putInBook";
    }
    @RequestMapping("/userEacher")
    public String userEacher(){
        return "userEchar";
    }



}
