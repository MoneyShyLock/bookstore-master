<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Shen
  Date: 2018/1/11
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <title>Book Store</title>
    <link rel="stylesheet" type="text/css" href="css/protalstyle.css" />
    <script src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
<div id="wrap">

    <div class="header">
        <div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>
        <div id="menu">
            <ul>
                <li><a href="protal">主页</a></li>
                <li><a href="booksAll">全部图书</a></li>
                <li><a href="specials">降价图书</a></li>
                <li><a href="myInformation">我的信息</a></li>
                <li><a href="register">注册</a></li>
                <li class="selected"><a href="myCart">购物车</a></li>
                <c:if test="${session_User!=null}">
                    <li><a href="myaccount.html">欢迎你 ${session_User.username}</a></li>
                </c:if>
                <c:if test="${session_User==null}">
                    <li><a href="toLoginProtal">登录</a></li>
                </c:if>
            </ul>
        </div>


    </div>


    <div class="center_content">
        <div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My cart</div>

            <div class="feat_prod_box_details">
                <c:if test="${cartVOS!=null}">
                <table class="cart_table">

                    <tr class="cart_title">
                        <td>
                            <%--全选--%>
                            <input type="checkbox" id="shop_c" class="shopChoice" id="all">
                            <label for="shop_c" class="shop"></label>
                        </td>
                        <td>Item pic</td>
                        <td>Book name</td>
                        <td>Unit price</td>
                        <td>Qty</td>
                        <td>Total</td>
                        <td>operate</td>

                    </tr>
                        <c:forEach items="${cartVOS}" var="cartItem">
                            <tr>
                                <td>
                                    <input type="checkbox" id="checkbox_8" class="son_check">
                                    <label for="checkbox_8"></label>
                                </td>
                                <td><a href="#" onclick="detail(${cartItem.id})"><img src="${cartItem.image}" alt="" title="" border="0" class="cart_thumb" /></a></td>
                                <td>${cartItem.bookname}</td>
                                <td>${cartItem.price}</td>
                                <td>${cartItem.quantity}</td>
                                <td>${cartItem.subtotal}</td>
                               <td><p class="del"><a href="javascript:;" class="delBtn">移除商品</a></p></td>
                            </tr>
                        </c:forEach>
                </table>
                </c:if>
                <c:if test="${cartVOS==null}">
                    <span>您的购物车还没有商品</span>
                </c:if>
                <a href="#" class="continue">&lt; 继续购物</a>
                <a href="#" class="checkout" onclick="account()">结算 &gt;</a>
            </div>
            <div class="clear"></div>
        </div><!--end of left content-->

        <div class="right_content">



            <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About Our Store</div>
            <div class="about">
                <p>
                    <img src="images/about.gif" alt="" title="" class="right" />
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.
                </p>

            </div>
        </div><!--end of right content-->
        <div class="clear"></div>
    </div><!--end of center content-->

    <div class="footer">
        <div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /> <a href="http://www.cssmoban.com/" title="free templates">cssmoban</a></div>
        <div class="right_footer">
            <a href="#">home</a>
            <a href="#">about us</a>
            <a href="#">services</a>
            <a href="#">privacy policy</a>
            <a href="#">contact us</a>

        </div>


    </div>


</div>

</body>
<script type="text/javascript">
    function detail(id) {
        window.location.href="getBookById?id="+id;
    }
    $(function() {

        $("#all").click(function () {//判断全选框的改变
            var flage = $(this).is(":checked");//全选选中为true，否则为false
            $("input[type=checkbox]").each(function () {
                $(this).prop("checked", flage);
            })
        })
    })

</script>
</html>

