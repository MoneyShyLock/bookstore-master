<%--
  Created by IntelliJ IDEA.
  User: Shen
  Date: 2018/1/11
  Time: 7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>书城首页</title>

    <link rel="stylesheet" href="css/xiaomi.css"/>

    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>

</head>
<body>
<jsp:include page="/common/protal-header.jsp"></jsp:include>
<br>
<%--<div id="menu_content_bg" style="height: 0px;">
    <div id="menu_content_wrap">
        <ul style="top: 0px;">
            <li id="xiaomiphone">
                <div class="menu_content">
                    <img src="images/img/mi4!160x110.jpg">
                    <p class="menu_content_tit">大米手机4</p>
                    <p class="menu_content_price">1499元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/minote!160x110.jpg">
                    <p class="menu_content_tit">大米NOTE标准版</p>
                    <p class="menu_content_price">1999元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/minotepro!160x110.jpg">
                    <p class="menu_content_tit">大米NOTE顶配版</p>
                    <p class="menu_content_price">2999元起</p>
                </div>
            </li>
            <li id="hongmiphone">
                <div class="menu_content">
                    <img src="images/img/hongmi2a!160x110.jpg">
                    <p class="menu_content_tit">红米手机2A</p>
                    <p class="menu_content_price">499元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/hongmi2!160x110.jpg">
                    <p class="menu_content_tit">红米手机2</p>
                    <p class="menu_content_price">599元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/note!160x110.jpg">
                    <p class="menu_content_tit">红米NOTE</p>
                    <p class="menu_content_price">699元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/note2!160x110.jpg">
                    <p class="menu_content_tit">红米NOTE2</p>
                    <p class="menu_content_price">799元</p>
                </div>
            </li>
            <li id="pingban">
                <div class="menu_content">
                    <img src="images/img/mipad16!160x110.jpg">
                    <p class="menu_content_tit">大米平板16G</p>
                    <p class="menu_content_price">1299元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/mipad64!160x110.jpg">
                    <p class="menu_content_tit">大米平板64G</p>
                    <p class="menu_content_price">1499元起</p>
                </div>
            </li>
            <li id="tv">
                <div class="menu_content">
                    <img src="images/img/mitv40!160x110.jpg">
                    <p class="menu_content_tit">大米电视2&nbsp;40英寸</p>
                    <p class="menu_content_price">1999元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/mitv48!160x110.jpg">
                    <p class="menu_content_tit">大米电视2S&nbsp;48英寸</p>
                    <p class="menu_content_price">2999元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/mitv49!160x110.jpg">
                    <p class="menu_content_tit">大米电视2&nbsp;49英寸</p>
                    <p class="menu_content_price">3399元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/mitv55!160x110.jpg">
                    <p class="menu_content_tit">大米电视2&nbsp;55英寸</p>
                    <p class="menu_content_price">4499元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/hezimini!160x110.jpg">
                    <p class="menu_content_tit">大米盒子MINI版</p>
                    <p class="menu_content_price">199元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/hezis!160x110.jpg">
                    <p class="menu_content_tit">大米盒子增强版</p>
                    <p class="menu_content_price">299元</p>
                </div>
            </li>
            <li id="luyou">
                <div class="menu_content">
                    <img src="images/img/miwifi!160x110.jpg">
                    <p class="menu_content_tit">全新大米路由器</p>
                    <p class="menu_content_price">699元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/miwifimini!160x110.jpg">
                    <p class="menu_content_tit">大米路由器&nbsp;MINI</p>
                    <p class="menu_content_price">129元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/miwifilite!160x110.jpg">
                    <p class="menu_content_tit">大米路由器&nbsp;青春版</p>
                    <p class="menu_content_price">79元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/wifiExtension!160x110.jpg">
                    <p class="menu_content_tit">大米WIFI放大器</p>
                    <p class="menu_content_price">39元</p>
                </div>
            </li>
            <li id="yingjian">
                <div class="menu_content">
                    <img src="http://c1.mifile.cn/f/i/15/goods/nav/scale!160x110.jpg">
                    <p class="menu_content_tit">体重称</p>
                    <p class="menu_content_price">99元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/xiaoyi!160x110.jpg">
                    <p class="menu_content_tit">摄像头</p>
                    <p class="menu_content_price">129元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/yicamera!160x110.jpg">
                    <p class="menu_content_tit">运动相机</p>
                    <p class="menu_content_price">399元起</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/ihealth!160x110.jpg">
                    <p class="menu_content_tit">血压计</p>
                    <p class="menu_content_price">199元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/chazuo!160x110.jpg">
                    <p class="menu_content_tit">智能插座</p>
                    <p class="menu_content_price">59元</p>
                </div>
                <span class="menu_content_line"></span>
                <div class="menu_content">
                    <img src="images/img/smart!160x110.jpg">
                    <p class="menu_content_tit">查看全部
                        <br>智能硬件</p>
                </div>
            </li>
        </ul>
    </div>
</div>--%>
<div id="big_banner_wrap">
    <ul id="banner_menu_wrap">
        <li class="active" img>
            <a>青春读物</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -20px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a>大米NOTE</a></li>
                    <li>
                        <a>大米手机4</a></li>
                    <li>
                        <a>红米手机2</a></li>
                    <li>
                       <a>红米手机2A</a></li>
                    <li>
                        <a>红米NOTE2</a></li>
                    <li>
                        <a>红米NOTE&nbsp;4G双卡</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a>大米平板</a><span>选购</span></li>
                    <li>
                        <a>电信版</a></li>
                    <li>
                        <a>合约机</a></li>
                    <li>
                        <a>中信特权</a></li>
                    <li>
                        <a>对比手机</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a>电视&nbsp;盒子</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -62px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a>大米电视40英寸</a></li>
                    <li>
                       <a>大米电视48英寸</a></li>
                    <li>
                        <a>大米电视49英寸</a></li>
                    <li>
                        <a>大米电视55英寸</a></li>
                    <li>
                        <a>大米盒子</a></li>
                    <li>
                        <a>大米盒子MINI</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/dianshipeijian.jpg"></a><a>大米电视配件</a><span>选购</span></li>
                </ul>
            </div>
        </li>
        <li>
            <a>路由器&nbsp;智能配件</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 900px; top: -104px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/miwifi.jpg"></a><a>大米路由器</a></li>
                    <li>
                        <a><img src="images/img/miwifilite.jpg"></a><a>大米路由器&nbsp;青春版</a></li>
                    <li>
                        <a><img src="images/img/air.jpg"></a><a>净化器</a></li>
                    <li>
                        <a><img src="images/img/xiaoyi.jpg"></a><a>摄像机</a></li>
                    <li>
                        <a><img src="images/img/scale.jpg"></a><a>体重称</a></li>
                    <li>
                        <a><img src="images/img/scale.jpg"></a><a>智能插头</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/miwifimini.jpg"></a><a>大米路由器MINI</a></li>
                    <li>
                        <a><img src="images/img/wifiExtension.jpg"></a><a>大米WIFI放大器</a></li>
                    <li>
                        <a><img src="images/img/yicamera.jpg"></a><a>运动相机</a></li>
                    <li>
                        <a><img src="images/img/water.jpg"></a><a>净水器</a></li>
                    <li>
                        <a><img src="images/img/ihealth.jpg"></a><a>血压计</a></li>
                    <li>
                        <a><img src="images/img/ihealth.jpg"></a><a>床头灯</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/zhinengtaozhuang.jpg"></a><a>智能家庭套装</a></li>
                    <li>
                        <a><img src="images/img/shouhuan.jpg"></a><a>大米手环</a></li>
                    <li>
                        <a><img src="images/img/smart.jpg"></a><a>全部智能硬件</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a>移动电源&nbsp;插线板</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -146px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/dianyuan.jpg "></a><a>大米移动电源</a></li>
                    <li>
                        <a><img src="images/img/powerscript.jpg"></a><a>大米插线板</a></li>
                    <li>
                        <a><img src="images/img/yidongdianyuan.jpg"></a><a>品牌移动电源</a></li>
                    <li>
                        <a><img src="images/img/dianyuanfujian.jpg"></a><a>移动电源附件</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a>耳机&nbsp;音箱</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -188px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/headphone.jpg"></a><a>大米头戴式耳机</a></li>
                    <li>
                        <a><img src="images/img/huosai.jpg"></a><a>大米活塞耳机</a></li>
                    <li>
                        <a><img src="images/img/bluetoothheadset.jpg"></a><a>大米蓝牙耳机</a></li>
                    <li>
                        <a><img src="images/img/erji.jpg"></a><a>品牌耳机</a></li>
                    <li>
                        <a><img src="images/img/yinxiang.jpg"></a><a>音箱</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a>电池&nbsp;存储卡</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -230px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/dianchi.jpg"></a><a>电池</a></li>
                    <li>
                        <a><img src="images/img/chongdian.jpg"></a><a>充电器</a></li>
                    <li>
                        <a><img src="images/img/xiancai.jpg"></a><a>线材</a></li>
                    <li>
                        <a><img src="images/img/cunchu.jpg"></a><a>存储卡</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a>保护套&nbsp;后盖</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -272px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/baohu.jpg"></a><a>保护套/保护壳</a></li>
                    <li>
                        <a><img src="images/img/hougai.jpg"></a><a>后盖</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a>贴膜&nbsp;其它配件</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 600px; top: -314px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/tiemo.jpg"></a><a>贴膜</a></li>
                    <li>
                        <a><img src="images/img/zipaigan.jpg"></a><a>自拍杆</a></li>
                    <li>
                        <a><img src="images/img/zipaigan.jpg"></a><a>蓝牙手柄</a></li>
                    <li>
                        <a><img src="images/img/tizhi.jpg"></a><a>贴纸</a></li>
                    <li>
                        <a><img src="images/img/fangchensai.jpg"></a><a>防尘塞</a></li>
                    <li>
                        <a><img src="images/img/fangchensai.jpg"></a><a>手机支架</a></li>
                </ul>
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/raoxian.jpg"></a><a>耳机绕线器</a></li>
                    <li>
                        <a><img src="images/img/wifi.jpg"></a><a>随身WIFI</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a>米兔&nbsp;服装</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -356px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/mitu.jpg"></a><a>米兔</a></li>
                    <li>
                        <a><img src="images/img/fuzhuang.jpg"></a><a>服装</a></li>
                </ul>
            </div>
        </li>
        <li>
            <a>背包&nbsp;其它周边</a>
            <a class="banner_menu_i">&gt;</a>
            <div class="banner_menu_content" style="width: 300px; top: -398px;">
                <ul class="banner_menu_content_ul">
                    <li>
                        <a><img src="images/img/bag.jpg"></a><a>背包</a></li>
                    <li>
                        <a><img src="images/img/shubiaodian.jpg"></a><a>大米鼠标坠</a></li>
                    <li>
                        <a><img src="images/img/zhoubian.jpg"></a><a>生活周边</a></li>
                    <li>
                        <a><img src="images/img/wan.jpg"></a><a>玩酷产品</a></li>
                </ul>
            </div>
        </li>
    </ul>
    <div id="big_banner_pic_wrap">
        <ul id="big_banner_pic">
            <!--图片地址从数据库取-->
            <li><img src="images/img/36820_565x215.jpg"></li>
            <li><img src="images/img/T1jrxjB_VT1RXrhCrK.jpg"></li>
            <li><img src="images/img/T1oTJjBKKT1RXrhCrK.jpg"></li>
            <li><img src="images/img/T1RICjB7DT1RXrhCrK.jpg"></li>
            <li><img src="images/img/T1vWdTBKDv1RXrhCrK.jpg"></li>
        </ul>
    </div>
    <div id="big_banner_change_wrap">
        <div id="big_banner_change_prev"> &lt;</div>
        <div id="big_banner_change_next">&gt;</div>
    </div>
</div>
<script type="text/javascript" src="js/xiaomi.js"></script>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<br>
<br>
<br>
<h2 style="margin-left: 200px;">新书推荐</h2>
<div class="col-md-5 column"></div>
<div class="col-md-4 column">
    <a class="btn" href="#">查看更多 »</a>
</div>
<br>
<br>
<br>
<div class="container">
    <div class="row clearfix" id="newBooklist">
        <%--<div class="col-md-3 column" >
           <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>--%>
       <%-- <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>--%>
      <%--  <div class="col-md-1 column"></div>--%>
        <%--<div class="col-md-3 column">
            <div>
                <img src=""/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>--%>
        <%--<div class="col-md-1 column"></div>--%>
    </div>
    <br>
    <br>
    <h2 style="margin-left: 100px;">独家特供</h2>
    <a style="margin-left: 500px;" class="btn" href="#">查看更多 »</a>
    <br>
    <br>
    <div class="row clearfix">
        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>
        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>

        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>
    </div>

    <br>
    <br>
    <h2 style="margin-left: 100px;">主编推荐</h2>
    <a style="margin-left: 500px;" class="btn" href="#">查看更多 »</a>
    <br>
    <br>
    <div class="row clearfix">
        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>
        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>

        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>
    </div>


    <br>
    <br>
    <h2 style="margin-left: 100px;">日销榜</h2>
    <a style="margin-left: 500px;" class="btn" href="#">查看更多 »</a>
    <br>
    <br>
    <div class="row clearfix">
        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>销量：</span>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>
        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>销量：</span>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>

        <div class="col-md-3 column">
            <div>
                <img src="images/baobaoqingxuguanlihuashu.jpg"/>
                <span>好书惊喜不断</span><br>
                <span>销量：</span>
                <span>原价:</span>
                <span>特价:</span>
                <p>
                    <a class="btn" href="#">查看详情 »</a>
                </p>
            </div>
        </div>
        <div class="col-md-1 column"></div>
    </div>

</div>
</body>
</html>

<script>
    $(function(){
        $.ajax({
            type: "GET",
            url: "listNewBooks",
            dataType: "json",
            success: function(result) {                    //result为返回值
                console.log(result);
                var str = "";
                for(var i=0;i<result.length;i++){
                    str+="<div class=\"col-md-3 column\">";
                    str+="<div>"
                    var $image = result[i].image;
                    console.log($image);
                    str+="<img src=\""+$image+"\"/>";
                    str+="<span>"+result[i].sellPoint+"</span><br>";
                    str+="<span>原价:"+result[i].price+"</span>"
                    str+="<span>特价:"+result[i].price* result[i].discount*0.1+"</span>";
                    str+="<p><a class=\"btn\" href='javascript:viewDetail("+result[i].id+")'>查看详情 »</a> </p>";
                    str+="</div>";
                    str+="</div>";
                    str+="<div class=\"col-md-1 column\"></div>";


                }
                var $newBooklist = $("#newBooklist");
                $newBooklist.html(str);
            }
        });
    })

</script>

<script>
    function  viewDetail(id) {
        alert(id);
       location.href="getBookById?id="+id;

    }
</script>
