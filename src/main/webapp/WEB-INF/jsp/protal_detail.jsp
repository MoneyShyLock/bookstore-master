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
    <script src="js/jquery.min.js"></script>
    <script src="js/modernizr-custom-v2.7.1.min.js"></script>
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
<jsp:include page="/common/protal-header.jsp"></jsp:include>
<body>
<div class="Xcontent">
    <ul class="Xcontent01">

        <div class="Xcontent06"><img src="images/shangpinxiangqing/X1.png"></div>
        <ol class="Xcontent08">
            <div class="Xcontent07"><img src="images/shangpinxiangqing/X1.png"></div>
            <div class="Xcontent09"><img src="images/shangpinxiangqing/X7.png"></div>
            <div class="Xcontent10"><img src="images/shangpinxiangqing/X8.png"></div>
            <div class="Xcontent11"><img src="images/shangpinxiangqing/X9.png"></div>
            <div class="Xcontent12"><img src="images/shangpinxiangqing/X10.png"></div>
        </ol>
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
</body>
</html>


<script>
    function buy() {
        var number = $('#number').val();
        var book_id = ${bookVO.id};
        alert(number +","+ book_id);

    }
</script>

<script>
    function addCart() {
        alert("1");
    }
</script>

