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
            <div class="crumb_nav">
                <a href="protal">主页</a> &gt;&gt; ${bookVO.bookname}
            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>${bookVO.bookname}</div>

            <div class="feat_prod_box_details">

                <div class="prod_img"><a href="${bookVO.image}" rel="lightbox"><img src="${bookVO.image}" alt="" title="" border="0" style="width: 97.99px;height: 150px"/></a>

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
                    <li><a class="" href="#tab2">相关图书</a></li>
                </ul>

                <div class="tabs-container">

                    <div style="display: none;" class="tab" id="tab2">
                        <c:forEach items="${bookKinds}" var="book">
                        <div class="new_prod_box">
                            <a href="details.html">${book.bookname}</a>
                            <div class="new_prod_bg">
                                <a href="#" onclick="bookDetail(${book.id})"><img src="${book.image}" alt="" title="" class="thumb" border="0" style="width: 60px;height: 90px"/></a>
                            </div>
                        </div>
                        </c:forEach>
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
        console.log(price);
        var subtotal=price*quantity;
        $.ajax({
            url:"creatOrder",
            data:{
                "bookId":bookId,
                "subtotal":subtotal,
                "quantity":quantity
            },
            success:function (result) {
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
<script>
    function bookDetail(id) {
        window.location.href="getBookById?id="+id;
    }
</script>
