package com.bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
//页面跳转控制器
@Controller
public class PageController {

    /**
     *  访问bookstore后台的控制器
     * @return
     */
    @RequestMapping("/index")
    public String toBackgroudIndex(){

        return "index";
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

    @RequestMapping("/protal")
    public String toProtal(){
        return "protal";
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
