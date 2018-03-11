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
                <c:if test="${session_User==null}">
                     <li><a href="register">注册</a></li>
                </c:if>
                <li class="selected"><a href="myCart">购物车</a></li>
                <c:if test="${session_User!=null}">
                    <li><a href="#">欢迎你 ${session_User.username}</a></li>
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
                            <input type="checkbox" id="shop_c" class="shopChoice">
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
                               <td style="width: 100px"><p class="del"><a href="javascript:deleteItem(${cartItem.cartItemId});" class="delBtn">移除商品</a></p></td>
                            </tr>
                        </c:forEach>
                </table>
                </c:if>
                <c:if test="${cartVOS==null}">
                <table class="cart_table">
                    <tr>
                        <td>您的购物车还没有商品</td>
                    </tr>
                </table>

                </c:if>
                <a href="booksAll" class="continue">&lt; 继续购物</a>
                <a href="#" class="checkout" onclick="creatOrder()">结算 &gt;</a>
            </div>
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
<script type="text/javascript">
    function creatOrder(id) {
        var orderItem=[];

        console.log($("input[type='checkbox']").attr("check",true))


        /* var str = "";
              $("input[type=checkbox]").each(function(){
                     if($(this).is(":checked"))
                     {

                     }
                 });*/



        $.ajax({

        })
    }

    function deleteItem(id) {
        alert(id)
        $.ajax({
            url:"deleteItemById",
            data:{
                "id":id
            },
            success:function (result) {
                window.location.reload();
            }
        })
    }
    $(function() {

        $("#shop_c").click(function () {//判断全选框的改变
            var flage = $(this).is(":checked");//全选选中为true，否则为false
            $("input[type=checkbox]").each(function () {
                $(this).prop("checked", flage);
            })
        })

    })


</script>
</html>

