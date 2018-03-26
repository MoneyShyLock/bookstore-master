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
                <li  class="selected"><a href="specials">降价图书</a></li>
                <li><a href="myInformation">我的信息</a></li>
                <c:if test="${session_User==null}">
                    <li><a href="register">注册</a></li>
                </c:if>
                <li><a href="myCart">购物车</a></li>
                <c:if test="${session_User!=null}">
                    <li>欢迎您: ${session_User.username}</li>
                    <li><a href='user_logout'>退出</a></li>
                </c:if>
                <c:if test="${session_User==null}">
                    <li><a href="toLoginProtal">登录</a></li>
                </c:if>
            </ul>
        </div>


    </div>


    <div class="center_content">
        <div class="left_content">

            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Special gifts</div>

            <c:forEach items="${offerList}" var="book">
                <div class="feat_prod_box">
                    <div class="prod_img"><a href="#" onclick="bookDetail(${book.id})"><img src="${book.image}" alt="" title="" border="0" style="width: 97.99px;height: 150px"/></a></div>
                    <div class="prod_det_box">
                        <span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
                        <div class="box_top"></div>
                        <div class="box_center">
                            <div class="prod_title">${book.bookname}</div>
                            <p class="details">${book.sellPoint}</p>
                            <div  class="price"><strong>折扣:</strong> <span id="price" class="red">
                                    <c:if test="${book.discount==9}">九折</c:if>
                                    <c:if test="${book.discount==8}">八折</c:if>
                                    <c:if test="${book.discount==7}">七折</c:if>
                                    <c:if test="${book.discount==6}">六折</c:if>
                                    <c:if test="${book.discount==5}">五折</c:if>
                                    <c:if test="${book.discount==4}">四折</c:if>
                                    <c:if test="${book.discount==3}">三折</c:if>
                                    <c:if test="${book.discount==2}">二折</c:if>
                                    <c:if test="${book.discount==1}">一折</c:if>
                            </span></div>
                            <a href="#" onclick="bookDetail(${book.id})" class="more">- more details -</a>
                            <div class="clear"></div>
                        </div>
                        <div class="box_bottom"></div>
                    </div>
                    <div class="clear"></div>
                </div>
            </c:forEach>

           <%-- <div class="pagination">
                <span class="disabled"><<</span><span class="current">1</span><a href="#?page=2">2</a><a href="#?page=3">3</a>…<a href="#?page=199">10</a><a href="#?page=200">11</a><a href="#?page=2">>></a>
            </div>
--%>

            <div class="clear"></div>
        </div><!--end of left content-->

        <div class="right_content">
            <div class="title"><span class="title_icon"><img src="images/bullet3.gif" alt="" title="" /></span>About Our Store</div>
            <div class="about">
                <p>
                    <img src="images/about.gif" alt="" title="" class="right" />
                    北京博众博阅文化传媒有限公司成立于2014年10月，以推广 学龄前儿童阅读项目为起点，以深度研究开发互联网+文化传媒 创意产业链为目标的创新型公司。                    创立伊始，便凭借独特的运营模式和社会公益理念，顺利赢 得天使投资人的青睐和投资机构的多次入资。公司成立后的半 年，就已占有全国近三分之二的市场，                    为全国198个城市、万所 幼儿园免费建立了启阅绘本馆，为幼儿提供了近500万册的优质 绘本。
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