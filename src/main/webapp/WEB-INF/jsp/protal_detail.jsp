<%--
  Created by IntelliJ IDEA.
  User: Shen
  Date: 2018/1/11
  Time: 9:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>商品详情</title>
    <link rel="stylesheet" href="css/detail.css">
    <link rel="stylesheet" type="text/css" href="css/protalstyle.css" />
    <script src="js/jquery.min.js"></script>
    <script src="js/modernizr-custom-v2.7.1.min.js"></script>
    <script type="text/javascript" src="js/java.js"></script>
    <script>
        $(document).ready(function () {
            var $miaobian = $('.Xcontent08>div');
            var $huantu = $('.Xcontent06>img');
            var $miaobian1 = $('.Xcontent26>div');
            $miaobian.mousemove(function () {
                miaobian(this);
            });
            $miaobian1.click(function () {
                miaobian1(this);
            });

            function miaobian(thisMb) {
                for (var i = 0; i < $miaobian.length; i++) {
                    $miaobian[i].style.borderColor = '#dedede';
                }
                thisMb.style.borderColor = '#cd2426';

                $huantu[0].src = thisMb.children[0].src;
            }

            function miaobian1(thisMb1) {
                for (var i = 0; i < $miaobian1.length; i++) {
                    $miaobian1[i].style.borderColor = '#dedede';
                }
//		thisMb.style.borderColor = '#cd2426';
                $miaobian.css('border-color', '#dedede');
                thisMb1.style.borderColor = '#cd2426';
                $huantu[0].src = thisMb1.children[0].src;
            }

            $(".Xcontent33").click(function () {
                var value = parseInt($('.input').val()) + 1;
                $('.input').val(value);
            })
            $(".Xcontent32").click(function () {
                var num = $(".input").val()
                if (num > 0) {
                    $(".input").val(num - 1);
                }

            })

        })
    </script>
</head>

<body>
<div id="wrap">
    <div class="header">
        <div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>
        <div id="menu">
            <ul>
                <li><a href="protal">主页</a></li>
                <li  class="selected"><a href="category.html">全部图书</a></li>
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
            <div class="crumb_nav">
                <a href="protal">主页</a> &gt;&gt; ${bookVO.bookname}
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>${bookVO.bookname}</div>

            <div class="feat_prod_box_details">

                <div class="prod_img"><a href="${bookVO.image}" rel="lightbox"><img src="${bookVO.image}" alt="" title="" border="0" /></a>

                </div>

                <div class="prod_det_box">
                    <div class="box_top"></div>
                    <div class="box_center">
                        <div class="prod_title"><strong>作者</strong><span class="red">${bookVO.author}</span></div>
                        <div class="prod_title">简介</div>
                        <p class="details">${bookVO.sellPoint}</p>
                        <div  class="price"><strong>价格:</strong> <span id="price" class="red">${bookVO.price}</span>RMB</div>
                        <div class="price"><strong>数量:</strong>
                           <input id="quantity" type="number" value="1">
                        </div>

                        <a href="javascript:buy()" class="more"><img src="images/order_now.gif" alt="" title="" border="0" /></a>
                        <a href="javascript:addCart()"  class="more"><img src="images/cart.gif" alt="" title="" border="0" /></a>
                        <div class="clear"></div>
                    </div>

                    <div class="box_bottom"></div>
                </div>
                <div class="clear"></div>
            </div>


            <div id="demo" class="demolayout">

                <ul id="demo-nav" class="demolayout">
                    <li><a class="active" href="#tab1">More details</a></li>
                    <li><a class="" href="#tab2">Related books</a></li>
                </ul>

                <div class="tabs-container">

                    <div style="display: block;" class="tab" id="tab1">
                        <p class="more_details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                        </p>
                        <ul class="list">
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                            <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit</a></li>
                        </ul>
                        <p class="more_details">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
                        </p>
                    </div>

                    <div style="display: none;" class="tab" id="tab2">
                        <div class="new_prod_box">
                            <a href="details.html">product name</a>
                            <div class="new_prod_bg">
                                <a href="details.html"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                            </div>
                        </div>

                        <div class="new_prod_box">
                            <a href="details.html">product name</a>
                            <div class="new_prod_bg">
                                <a href="details.html"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                            </div>
                        </div>

                        <div class="new_prod_box">
                            <a href="details.html">product name</a>
                            <div class="new_prod_bg">
                                <a href="details.html"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                            </div>
                        </div>

                        <div class="new_prod_box">
                            <a href="details.html">product name</a>
                            <div class="new_prod_bg">
                                <a href="details.html"><img src="images/thumb1.gif" alt="" title="" class="thumb" border="0" /></a>
                            </div>
                        </div>

                        <div class="new_prod_box">
                            <a href="details.html">product name</a>
                            <div class="new_prod_bg">
                                <a href="details.html"><img src="images/thumb2.gif" alt="" title="" class="thumb" border="0" /></a>
                            </div>
                        </div>

                        <div class="new_prod_box">
                            <a href="details.html">product name</a>
                            <div class="new_prod_bg">
                                <a href="details.html"><img src="images/thumb3.gif" alt="" title="" class="thumb" border="0" /></a>
                            </div>
                        </div>



                        <div class="clear"></div>
                    </div>

                </div>


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
<%--<div id="wrap">

    <div class="Xcontent">
        <ul class="Xcontent01">

            <div class="Xcontent06"><img src="${bookVO.image}"></div>
            &lt;%&ndash;<ol class="Xcontent08">
                <div class="Xcontent07"><img src="images/shangpinxiangqing/X1.png"></div>
                <div class="Xcontent09"><img src="images/shangpinxiangqing/X7.png"></div>
                <div class="Xcontent10"><img src="images/shangpinxiangqing/X8.png"></div>
                <div class="Xcontent11"><img src="images/shangpinxiangqing/X9.png"></div>
                <div class="Xcontent12"><img src="images/shangpinxiangqing/X10.png"></div>
            </ol>&ndash;%&gt;
            <ol class="Xcontent13">
                <div class="Xcontent14"><a href="#"><p>${bookVO.bookname}</p></a></div>
                <div class="Xcontent15"><img src="images/shangpinxiangqing/X11.png"></div>
                <div class="Xcontent16"><p>特色:${bookVO.sellPoint}</p></div>
                <div class="Xcontent17">
                    <p class="Xcontent18">作者:${bookVO.author}</p>
                    <p class="Xcontent18">售价</p>
                    <p class="Xcontent19">￥<span>${bookVO.price}</span></p>
                    <div class="Xcontent20">
                        <p class="Xcontent21">促销价</p>
                        <img src="images/shangpinxiangqing/X12.png">
                        <p class="Xcontent22">￥
                            <fmt:formatNumber type="number" value="${bookVO.price*bookVO.discount*0.1}" pattern="0.00"
                                              maxFractionDigits="2"/>
                        </p>
                        <p>库存:${bookVO.inventory} 件</p>
                    </div>
                    <div class="Xcontent23">
                        <p class="Xcontent24">服务</p>
                        <p class="Xcontent25">30天无忧退货&nbsp;&nbsp;&nbsp;&nbsp; 48小时快速退款 &nbsp;&nbsp;&nbsp;&nbsp; 满88元免邮</p>
                    </div>

                </div>
                <div class="Xcontent26">
                    <p class="Xcontent27">颜色</p>
                    <div class="Xcontent28"><img src="images/shangpinxiangqing/X14.png"></div>
                    <div class="Xcontent29"><img src="images/shangpinxiangqing/X1.png"></div>
                </div>
                <div class="Xcontent30">
                    <p class="Xcontent31">数量</p>
                    <div class="Xcontent32"><img src="images/shangpinxiangqing/X15.png"></div>
                    <form>
                        <input class="input" id="number" value="1">
                    </form>
                    <div class="Xcontent33"><img src="images/shangpinxiangqing/16.png"></div>

                </div>
                <div class="Xcontent34"><a href='javascript:buy()'><img src="images/shangpinxiangqing/X17.png"></a></div>
                <div class="Xcontent35"><a href="javascript:addCart()"><img src="images/shangpinxiangqing/X18.png"></a>
                </div>
            </ol>
        </ul>
    </div>
</div>--%>

</body>
</html>


<script>
    function buy() {
        var quantity=$("#quantity").val();
        var price=$("#price").text();
        var bookId = ${bookVO.id};
        alert(quantity +","+ bookId);
        $.ajax({
            url:"creatOrder",
            data:{
                "bookId":bookId,
                "price":price,
                "quantity":quantity
            },
            success:function (result) {
                alert(result);
                window.location.href="orderProtal"
            }
        })

    }
</script>

<script>
    function addCart() {
        var bookId = ${bookVO.id};
        var price=$("#price").text();
        var quantity=$("#quantity").val();
       /* window.location.href="addCartItem";*/
     /*   window.location.href="addCartItem?bookId=\"+bookId+\"&price=\"+price+\"&quantity=\"+quantity"*/
        $.ajax({
            url:"addCartItem",
            data:{
                "bookId":bookId,
                "price":price,
                "quantity":quantity
            },
            success:function (result) {
            if(result.message=="isLogin"){
                window.location.href="toLoginProtal";
                }else if(result.message=="success"){
                alert("添加成功")
            }
         }
     })

    }
</script>
<script type="text/javascript">

    var tabber1 = new Yetii({
        id: 'demo'
    });

</script>

