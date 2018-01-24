package com.bookstore.controller;

import com.bookstore.pojo.po.Admin;
import com.bookstore.pojo.po.Orders;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.ContentVo;
import com.bookstore.pojo.vo.OrdersVO;
import com.bookstore.service.CartService;
import com.bookstore.service.OrderService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.Iterator;
import java.util.List;

//订单控制器
@Controller
public class OrderController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

  @Autowired
    private OrderService orderService;

    //查询显示订单
    @RequestMapping(value = "/listOrders")
    public String listAdmins(Model model, @RequestParam(value = "pn", defaultValue = "1") Integer pn, @RequestParam(defaultValue = "") String query, @RequestParam(defaultValue = "") Integer status, HttpSession session) {
       String encodeQuery = null;
        try {
            encodeQuery = java.net.URLDecoder.decode(query, "UTF-8");
            System.out.println(encodeQuery);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        PageHelper.startPage(pn, 4);
        List<OrdersVO> ordersList = orderService.listOrders(query, status);

        PageInfo<OrdersVO> pageInfo = new PageInfo(ordersList);
        session.setAttribute("query", encodeQuery);
        session.setAttribute("status",status);
        model.addAttribute("pageInfo", pageInfo);
        return "order_list";
    }
    //根据用户id查询订单
    @ResponseBody
    @RequestMapping("/getOrderByUid")
    public List<OrdersVO> getOrderByUid(Long uid){
        List<OrdersVO> contentVos = orderService.getOrderByUid(uid);
        return contentVos;
    }

    //根据id查询订单详情
    @ResponseBody
    @RequestMapping("/orderById")
    public OrdersVO getOrderById(Long id){
        OrdersVO ordersVO = orderService.getOrderById(id);
        return ordersVO;
    }


}
