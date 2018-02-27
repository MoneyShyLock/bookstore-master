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
    <!-- basic styles -->
    <%--<link href="assets/css/bootstrap.min.css" rel="stylesheet"/>

    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <script src="assets/js/ace-extra.min.js"></script>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>--%>


</head>
<body>
<div id="wrap">
    <div class="header">
        <div class="logo"><a href="protal"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>
        <div id="menu">
            <ul>
                <li><a href="protal">主页</a></li>
                <li class="selected"><a href="booksAll">全部图书</a></li>
                <li><a href="specials">降价图书</a></li>
                <li><a href="myInformation">我的信息</a></li>
                <li><a href="register">注册</a></li>
                <li><a href="myCart">购物车</a></li>
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

            <div class="title"><span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>全部图书</div>

            <div class="new_products">
            <c:forEach items="${protalPageInfo.list}" var="book">
                <div style="clear: both">
                    <a href="#" onclick="bookDetail(${book.id})">${book.bookname}</a>
                    <div class="new_prod_bg">
                    <a href="#" onclick="bookDetail(${book.id})"><img src="${book.image}" alt="" title="" class="thumb" border="0" style="width: 60px;height: 100px"/></a>
                    </div>
                </div>
            </c:forEach>
                <div class="pagination">

                </div>
            </div>
            <%--<div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="listBooks?pn=1">首页</a></li>
                        <c:if test="${pageInfo.hasPreviousPage }">
                            <li><a href="listBooks?pn=${pageInfo.pageNum-1}"
                                   aria-label="Previous"> <span
                                    aria-hidden="true">&laquo;</span>
                            </a></li>
                        </c:if>


                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum }">
                                <li class="active"><a href="#">${page_Num }</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum }">
                                <li><a href="listBooks?pn=${page_Num }">${page_Num }</a>
                                </li>
                            </c:if>

                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage }">
                            <li><a href="listBooks?pn=${pageInfo.pageNum+1 }"
                                   aria-label="Next"> <span
                                    aria-hidden="true">&raquo;</span>
                            </a></li>
                        </c:if>
                        <li><a href="listBooks?pn=${pageInfo.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>--%>

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

            <%--<div class="right_box">

                <div class="title"><span class="title_icon"><img src="images/bullet4.gif" alt="" title="" /></span>独家特供</div>
                <c:forEach items="${proList}" var="book">
                <div class="new_prod_box">
                    <a href="#" onclick="bookDetail(${book.id})">${book.bookname}</a>
                    <div class="new_prod_bg">
                        <span class="new_icon"><img src="images/promo_icon.gif" alt="" title="" /></span>
                        <a href="#" onclick="bookDetail(${book.id})"><img src="${book.image}" alt="" title="" class="thumb" border="0" /></a>
                    </div>
                </div>
                </c:forEach>
            </div>--%>

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