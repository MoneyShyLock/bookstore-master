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
                                <p class="details">联系方式:${user.tel}</p>
                                <p class="details">收件人:　${user.username}</p>

                                <div class="clear"></div>
                            </div>

                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                <%--其他地址--%>
                <c:forEach items="${addressList}" var="addrss">
                    <div class="feat_prod_box">
                        <div class="prod_det_box">
                            <div class="box_top"></div>
                            <div class="box_center">
                                <div class="prod_title"><a href="#" onclick="changeAddress(${addrss.id})">设为默认</a>
                                    <a href="#" onclick="deleteAddress(${addrss.id})">删除地址</a></div>
                                <hr/>
                                <p class="details">收货地址:${addrss.addrname}</p>
                                <p class="details">联系方式:${user.tel}</p>
                                <p class="details">收件人:　${user.username}</p>
                                <div class="clear"></div>
                            </div>

                            <div class="box_bottom"></div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </c:forEach>

            </div>
            <div class="title"><span class="title_icon"><img src="images/bullet2.gif" alt="" title="" /></span>新增地址</div>
            <div class="feat_prod_box">
                <div class="prod_det_box">
                    <div class="box_top"></div>
                    <div class="box_center">
                        <form action="addAddress">
                            <div>
                                请选择省市区
                                <select id="first" name="province" onchange="firstSel()">
                                    <option value="-1">请选择</option>
                                    <c:forEach items="${provinces}" var="province">
                                        <option value="${province.code}">${province.name}</option>
                                    </c:forEach>
                                </select>

                                <select id="second" name="city" onchange="sendSel()"></select>
                                <select id="third" name="area"></select>
                            </div>
                            <div>
                            <label for="addressName">请输入街道详细地址</label>
                            <input id="addressName" value="" name="addressName">
                            </div>
                            <input type="button" value="添加" onclick="addAddress()">

                        </form>


                    </div>

                    <div class="box_bottom"></div>
                </div>
                <div class="clear"></div>
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
<script>
    $(function() {
        $("#second").hide(); //初始化的时候第二个下拉列表隐藏
    });
    function firstSel() {//如果第一个下拉列表的值改变则调用此方法
        var provinceCode = $("#first").val();//得到第一个下拉列表的值
        if(provinceCode!=null && "" != provinceCode&& -1 != provinceCode){
            //通过ajax传入后台，把province数据传到后端
            $.post("getCityByProvinceCode",{provinceCode:provinceCode},function(data){
                console.log(data);
                var option;
                $.each(data,function(i,city){//循环，i为下标从0开始，city为集合中对应的第i个对象
                    option += "<option value='"+city.code+"'>"+city.name+"</option>"
                });
                $("#second").html(option);//将循环拼接的字符串插入第二个下拉列表
                $("#second").show();//把第二个下拉列表展示
            });

        }else {
            $("#second").hide();
        }
    };
</script>
<script>
    $(function() {
        $("#third").hide(); //初始化的时候第三个下拉列表隐藏
    });
    function sendSel() {//如果第一个下拉列表的值改变则调用此方法

        var cityCode = $("#second").val();//得到第一个下拉列表的值
        console.log(cityCode);
        if(cityCode!=null && "" != cityCode&& -1 != cityCode){
            //通过ajax传入后台，把province数据传到后端
            $.post("getAreaByCityCode",{cityCode:cityCode},function(data){
                var option;
                $.each(data,function(i,area){//循环，i为下标从0开始，city为集合中对应的第i个对象
                    option += "<option value='"+area.code+"'>"+area.name+"</option>"
                });
                $("#third").html(option);//将循环拼接的字符串插入第二个下拉列表
                $("#third").show();//把第二个下拉列表展示
            });

        }else {
            $("#third").hide();
        }
    };
</script>
<script >
    function changeAddress(id) {
        window.location.href="changeAddress?id="+id;
    }
</script>
<script >
    function deleteAddress(id) {
        window.location.href="deleteAddress?id="+id;
    }
</script>
<script>
    function addAddress(){
        var province= $("#first").val();
        var city=$("#second").val();
        var area=$("#third").val();
        var addressName=$("#addressName").val();
        if(addressName!=null&&addressName!=""){
            $.post("addAddress",{
                province:province,
                city:city,
                area:area,
                addressName:addressName
            },function(data){
               alert(data)
            });
        }
    }
</script>
</html>