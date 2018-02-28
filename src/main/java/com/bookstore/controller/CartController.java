package com.bookstore.controller;

import com.bookstore.common.util.MessageResult;
import com.bookstore.pojo.po.Cart;
import com.bookstore.pojo.po.CartItem;
import com.bookstore.pojo.po.User;
import com.bookstore.pojo.vo.BookVO;
import com.bookstore.pojo.vo.CartVO;
import com.bookstore.service.BookService;
import com.bookstore.service.CartItemService;
import com.bookstore.service.CartService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//购物车控制器
@Controller
public class CartController {

    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private CartService cartService;
    @Autowired
    private CartItemService cartItemService;
    @Autowired
    private BookService bookService;

    //购物车
    @RequestMapping("/myCart")
    public String toMyCart(HttpSession session, Model model){
        User user=(User)session.getAttribute("session_User");
        Cart cart=new Cart();
        if(user!=null){
            //查询登录用户的购物车
            List<Cart> list=cartService.findByUid(user.getId());
            if(list.size()==0) {
                    cart = new Cart();
                    cart.setUserId(user.getId());
                    cartService.addCart(cart);
                    cart = cartService.findByUid(user.getId()).get(0);
                    model.addAttribute("cartVOS",null);
                    return "myCart";
            }

            cart=list.get(0);
            //通过购物车得到id，查询购物车的商品
            List<CartItem> cartItems=cartItemService.findByCartId(cart.getId());
            if(cartItems.size()==0){
                model.addAttribute("cartVOS",null);
                return "myCart";
            }
            //添加书名，价格，图片路径属性
            List<CartVO> cartVOS =new ArrayList<>();
            for (CartItem cartItem:cartItems){
                BookVO bookVO=bookService.getBookForProtal(cartItem.getBookId());
                CartVO cartVO = new CartVO();
                cartVO.setId(bookVO.getId());
                cartVO.setImage(bookVO.getImage());
                cartVO.setBookname(bookVO.getBookname());
                cartVO.setPrice(bookVO.getPrice());
                cartVO.setQuantity(cartItem.getQuantity());
                cartVO.setSubtotal(cartItem.getSubtotal());
                cartVOS.add(cartVO);
            }
            model.addAttribute("cartVOS",cartVOS);
            return "myCart";
        }
        else{
            return  "login";
        }
    }

    @ResponseBody
    @RequestMapping("/addCartItem")
    public MessageResult addCart(HttpSession session,@RequestParam("bookId") Long bookId,@RequestParam("price") BigDecimal price,@RequestParam("quantity") Integer quantity){
        User user=(User) session.getAttribute("session_User");
        MessageResult ms=new MessageResult();
        if(user==null||"".equals(user)){
            ms.setMessage("isLogin");
        }
        else {
            try {
                Cart cart= cartService.findByUid(user.getId()).get(0);
                if(cart==null){
                    cart =new Cart();
                    cart.setUserId(user.getId());
                    cartService.addCart(cart);
                    cart= cartService.findByUid(user.getId()).get(0);
                }
                BigDecimal subtotal = new BigDecimal("0");
                BigDecimal numberBd=new BigDecimal(Integer.toString(quantity));
                BigDecimal subtotalNow=price.multiply(numberBd);
                System.out.println(subtotalNow);
                subtotal=subtotal.add(subtotalNow);
                cartItemService.addCartItem(bookId,cart.getId(),subtotal,quantity);
                ms.setMessage("success");

            }catch (Exception e){
                e.printStackTrace();
                ms.setMessage("fail");
            }
        }
        return  ms;
    }




}
