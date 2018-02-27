<%--
  Created by IntelliJ IDEA.
  User: Shen
  Date: 2018/1/11
  Time: 7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
    <title>Book Store</title>
    <link rel="stylesheet" type="text/css" href="css/protalstyle.css" />
    <link href="css/addstyle.css" rel="stylesheet" type="text/css">
    <%--<link href="css/amazeui.css" rel="stylesheet" type="text/css">--%>
<%--    <link href="css/admin.css" rel="stylesheet" type="text/css">
    <link href="css/amazeui.css" rel="stylesheet" type="text/css">
    <link href="css/personal.css" rel="stylesheet" type="text/css">
    <link href="css/infstyle.css" rel="stylesheet" type="text/css">--%>
    <script src="js/jquery-1.11.1.min.js"></script>
</head>
<body>
<div id="wrap">
    <div class="header">
        <div class="logo"><a href="protal"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>
        <div id="menu">
            <ul>
                <li><a href="protal">主页</a></li>
                <li><a href="booksAll">全部图书</a></li>
                <li><a href="specials">降价图书</a></li>
                <li class="selected"><a href="myInformation">我的信息</a></li>
                <li><a href="register">注册</a></li>
                <li><a href="myCart">购物车</a></li>
                <c:if test="${session_User!=null}">
                <li><a href="myaccount">欢迎你 ${session_User.username}</a></li>
                </c:if>
                <c:if test="${session_User==null}">
                    <li><a href="toLoginProtal">登录</a></li>
                </c:if>
            </ul>
        </div>


    </div>


    <div class="center_content">
        <div class="left_content">

            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>个人信息</div>

            <!--个人信息 -->
            <div class="feat_prod_box">
                <form action="modifyInformation">
                    <input type="hidden" value="${user.id}" name="id">
                    <div>
                        <label for="user-name">用户名　:</label>
                         <input type="text" id="user-name" VALUE="${user.username}" name="username">
                    </div>
                    <div>
                        <label for="user-phone">联系方式</label>
                        <input id="user-phone" VALUE="${user.tel}" type="tel" name="tel">
                    </div>
                    <div>
                        <label for="user-email">电子邮件</label>
                         <input id="user-email" VALUE="${user.email}" type="email" name="email">
                    </div>
                    <input type="submit" value="提交">
                </form>
            </div>

            <div class="title"><span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>我的地址</div>

            <div class="new_products">
                <%--默认地址--%>
                    <div class="feat_prod_box">
                        <div class="prod_det_box">
                            <div class="box_top"></div>
                            <div class="box_center">
                                <div class="prod_title">默认地址</div>
                                <hr/>
                                <p class="details">收货地址:${address.addrname}</p>
                                <p class="details">收件人:　${user.username}</p>
                                <a href="#"  class="more">- more details -</a>
                                <div class="clear"></div>
                            </div>

                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                <%--其他地址--%>
                <c:forEach items="${addressList}" var="address">
                    <div class="feat_prod_box">
                        <div class="prod_det_box">
                            <div class="box_top"></div>
                            <div class="box_center">
                                <div class="prod_title">设为默认</div>
                                <hr/>
                                <p class="details">收货地址:${address.addrname}</p>
                                <p class="details">收件人:　${user.username}</p>
                                <a href="#"  class="more">- more details -</a>
                                <div class="clear"></div>
                            </div>

                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </c:forEach>

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
<script>
    function bookDetail(id) {
        window.location.href="getBookById?id="+id;
    }
</script>
</html>