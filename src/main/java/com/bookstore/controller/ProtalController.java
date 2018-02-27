package com.bookstore.controller;

import com.bookstore.pojo.po.Address;
import com.bookstore.pojo.po.Book;
import com.bookstore.pojo.po.User;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.service.AddressService;
import com.bookstore.service.BookService;
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
            List<Address> addressList=addressService.findByUid(user);
            System.out.println(addressList);
            modelAndView.addObject("addressList",addressList);
            modelAndView.setViewName("myInformation");

        }else {
            modelAndView.setViewName("login");
        }

        return modelAndView;
    }
    @RequestMapping("modifyInformation")
    public ModelAndView modifyInformation(ModelAndView modelAndView, HttpSession session,User user) {
        return modelAndView;
    }
    //创建订单
    @RequestMapping("creatOrder")
    public String creatOrder(ModelAndView modelAndView, HttpSession session,
                                   @RequestParam("bookId") Long bookId,
                                   @RequestParam("price") BigDecimal price,
                                   @RequestParam("quantity") Integer quantity) {
        return "success";
    }
    //页面跳转
    @RequestMapping("orderProtal")
    public String orderProtal() {
        return "orderProtal";
    }


}
