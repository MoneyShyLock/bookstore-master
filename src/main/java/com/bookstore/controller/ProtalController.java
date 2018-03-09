package com.bookstore.controller;

import com.bookstore.common.util.IDUtil;
import com.bookstore.pojo.po.*;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.OrdersVO;
import com.bookstore.service.AddressService;
import com.bookstore.service.BookService;
import com.bookstore.service.OrderService;
import com.bookstore.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

//前台跳转控制器
@Controller
public class ProtalController {
    @Autowired
    private BookService bookService;
    @Autowired
    private UserService userService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private OrderService orderService;


    /**
     *  访问bookstore前台的控制器
     * @return
     */
    @RequestMapping("/protal")
    public String toProtal(Model model){
        // 首页新书推荐 3本
        List<BookVO> newList = bookService.listBook_new();
        model.addAttribute("newList",newList);
        //主编推荐
        List<BookVO> listRecommondedBook = bookService.listBook_recommended();
        model.addAttribute("listRecommondedBook",listRecommondedBook);
        //独家特供
        List<BookVO> proList = bookService.listBook_specialSupply();
        model.addAttribute("proList",proList);
        return "protal";
    }
    //特价图书
    @RequestMapping("/specials")
    public String toSpecials(Model model){
        List<BookVO> offerList=bookService.listBook_specialOffer();
        System.out.println(offerList);
        model.addAttribute("offerList",offerList);
        return "specials";
    }
    //显示全部图书
    @RequestMapping(value = "/booksAll")
    public String listAdmins(Model model , @RequestParam(value = "pn",defaultValue ="1")Integer pn, @RequestParam(defaultValue = "") String query, HttpSession session) {
        String encodeQuery = null;
        try {
            encodeQuery = java.net.URLDecoder.decode(query, "UTF-8");
            System.out.println(encodeQuery);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        PageHelper.startPage(pn,6);
        List<Book> bookList = bookService.listBooks(query);
        PageInfo<Book> protalPageInfo = new PageInfo(bookList);
        session.setAttribute("query", encodeQuery);
        model.addAttribute("protalPageInfo",protalPageInfo);
        return "booksAll";
    }

    //myInformation
    @RequestMapping(value = "/myInformation")
    public ModelAndView myInformation(ModelAndView modelAndView, HttpSession session) {
        User user=(User)session.getAttribute("session_User");
        if(user!=null){
            System.out.println(user);
            modelAndView.addObject("user",user);
            //根据user的addre_id获得默认地址
            Address address = addressService.findById(user.getAddrId());
            session.setAttribute("address",address);
            //通过userID获得改用户的所有地址
            List<Address> addressList=addressService.findByUid(user,address.getId());
            System.out.println(addressList);
            session.setAttribute("addressList",addressList);
            modelAndView.setViewName("myInformation");
            //初始化新增地址下拉框
            List<Province> provinces=addressService.findAllProvince();
            System.out.println(provinces);
            modelAndView.addObject("provinces",provinces);
        }else {
            modelAndView.setViewName("login");
        }
        return modelAndView;
    }
    //根据省code得到city
    @ResponseBody
    @RequestMapping(value = "/getCityByProvinceCode")
    public List<City> getCityByProvinceCode(@RequestParam("provinceCode") String provinceCode) {
            //初始化新增地址下拉框
            List<City> citys=addressService.findByProvinceCode(provinceCode);
        return citys;
    }
    //根据省code得到city
    @ResponseBody
    @RequestMapping(value = "/getAreaByCityCode")
    public List<Area> getAreaByCityCode(@RequestParam("cityCode") String cityCode) {
        //初始化新增地址下拉框
        List<Area> areas=addressService.findByCityCode(cityCode);
        return areas;
    }
    //新增地址
    @ResponseBody
    @RequestMapping(value = "/addAddress")
    public String addAddress(HttpSession session,
            @RequestParam("province") String province,
            @RequestParam("city") String city,
            @RequestParam("area") String area,
            @RequestParam("addressName") String addressName) {
        User user=(User)session.getAttribute("session_User");
        Province province1=addressService.findProcinceByCode(province);
        City city1=addressService.findCityByCode(city);
        Area area1=addressService.findAreaByCode(area);
        String addressStr=province1.getName()+city1.getName()+area1.getName()+addressName;
        System.out.println(addressStr);
        Address address=new Address();
        address.setUid(user.getId());
        address.setAddrname(addressStr);
        addressService.add(address);
        return "success";
    }
    //修改个人信息
    @RequestMapping("/modifyInformation")
    public ModelAndView modifyInformation(ModelAndView modelAndView, HttpSession session,User user) {
        userService.updateUser(user);
        User sessionUser=(User)session.getAttribute("session_User");
        sessionUser.setEmail(user.getEmail());
        sessionUser.setTel(user.getTel());
        sessionUser.setUsername(user.getUsername());
        modelAndView.setViewName("myInformation");
        return modelAndView;
    }
    //修改默认地址
    @RequestMapping("/changeAddress")
    public ModelAndView changeAddress(ModelAndView modelAndView, HttpSession session,@RequestParam("id") Long id) {
        User user = new User();
        User sessionUser=(User)session.getAttribute("session_User");
        user.setAddrId(id);
        user.setId(sessionUser.getId());
        int count=userService.updateUser(user);
        sessionUser.setAddrId(id);
        session.setAttribute("session_User",sessionUser);
        return new ModelAndView("redirect:/myInformation");

    }
    //创建订单
    @ResponseBody
    @RequestMapping("/creatOrder")
    public String creatOrder(ModelAndView modelAndView, HttpSession session,
                                   @RequestParam("bookId") Long bookId,
                                   @RequestParam("subtotal") BigDecimal subtotal,
                                   @RequestParam("quantity") Integer quantity) {
        User sessionUser=(User)session.getAttribute("session_User");
        //创建订单
        Orders order = new Orders();
        order.setCreateTime(new Date());
        order.setUserId(sessionUser.getId());
        order.setStatus(1);
        Long oId=new Long(IDUtil.getId());
        order.setId(oId);
        //插入订单
        try {
            orderService.insert(order);
            //创建订单项
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(oId);
            orderItem.setCreateTime(new Date());
            orderItem.setBookId(bookId);
            orderItem.setQuantity(quantity);
            orderItem.setSubtotal(subtotal);
            orderService.insertItem(orderItem);
            BookVO bookVO=bookService.getBookForBack(bookId);
            session.setAttribute("book",bookVO);
            session.setAttribute("orderItem",orderItem);
            return "success";
        }catch (Exception e){
            e.printStackTrace();
        }
        return "fail";
    }
    //订单页面
    @RequestMapping("/orderProtal")
    public String orderProtal() {
        return "orderProtal";
    }
    //订单支付
    @RequestMapping("/payment")
    public String payment(HttpSession session) {
        OrderItem orderItem=(OrderItem) session.getAttribute("orderItem");
        Orders order=null;
        try {
            order=new Orders();
            order.setId(orderItem.getOrderId());
            order.setStatus(2);
            orderService.updateStatu(order);
        }catch (Exception e){
            e.printStackTrace();
        }

        return "success";
    }


}
