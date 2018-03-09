<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>首页 - BookStore后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- basic styles -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/css/font-awesome.min.css"/>

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- ace styles -->

    <link rel="stylesheet" href="assets/css/ace.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="assets/css/ace-skins.min.css"/>

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css"/>
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="assets/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
    <!-- 导入echarts -->
    <script src="js/echarts.min.js"></script>
</head>

<body>

<jsp:include page="/common/header.jsp"></jsp:include>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <%--<jsp:include page="/common/menu.jsp"></jsp:include>--%>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'fixed')
                } catch (e) {
                }
            </script>
            <ul class="nav nav-list">
                <li>
                    <a href="index">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text">首页 </span>
                    </a>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-desktop"></i>
                        <span class="menu-text"> 管理员管理 </span>

                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">

                        <li>
                            <!--查看所有的管理员-->
                            <a href="listAdmins">
                                <i class="icon-double-angle-right"></i> 管理员列表
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 用户管理 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <!--普通用户管理-->
                            <a href="listUsers">
                                <i class="icon-double-angle-right"></i> 普通用户管理
                            </a>
                        </li>
                        <li>
                            <!--vip用户管理-->
                            <a href="listVips" class="dropdown-toggle">
                                <i class="icon-pencil"></i> VIP用户管理
                            </a>
                        </li>

                    </ul>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-tag"></i>
                        <span class="menu-text"> 图书管理 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="listBooks">
                                <i class="icon-double-angle-right"></i> 图书列表
                            </a>
                        </li>
                        <li>
                            <a href="addBook" target="_blank">
                                <i class="icon-double-angle-right"></i> 图书信息登记
                            </a>
                        </li>
                        <%-- <li>
                             <a href="addCa" target="_blank">
                                 <i class="icon-double-angle-right"></i> 图书种类添加与删除
                             </a>
                         </li>--%>

                    </ul>
                </li>

                <li>
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-tag"></i>
                        <span class="menu-text"> 订单管理 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="listOrders">
                                <i class="icon-double-angle-right"></i> 订单列表
                            </a>
                        </li>
                        <%-- <li>
                             <a href="#">
                                 <i class="icon-double-angle-right"></i> 订单评论
                             </a>
                         </li>--%>
                    </ul>
                </li>

                <li class="active open">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-tag"></i>
                        <span class="menu-text"> 报表管理 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li>
                            <a href="countBooks">
                                <i class="icon-double-angle-right"></i> 图书分类统计
                            </a>
                        </li>
                        <li  class="active">
                            <a href="echartsPutInBook">
                                <i class="icon-double-angle-right"></i>入库信息统计
                            </a>
                        </li>
                        <li>
                            <a href="echartsOutBook">
                                <i class="icon-double-angle-right"></i>出库信息统计
                            </a>
                        </li>
                        <li>
                            <a href="echartsMarket">
                                <i class="icon-double-angle-right"></i>销售信息统计
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
            <!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try {
                    ace.settings.check('sidebar', 'collapsed')
                } catch (e) {
                }
            </script>
        </div>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check('breadcrumbs', 'fixed')
                    } catch (e) {
                    }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="index">首页</a>
                    </li>

                </ul>
                <!-- .breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h3>
                        报表管理
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                        图书入库
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>

                    </h3>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12 col-sm-9">
                        <div class="left">
                            <span class="btn btn-app btn-sm btn-light no-hover">
                                <span class="line-height-1 bigger-170 blue"> ${putAll.child} </span><br/>
                                <span class="line-height-1 smaller-90"> 少儿 </span>
                            </span>

                            <span class="btn btn-app btn-sm btn-yellow no-hover">
                                <span class="line-height-1 bigger-170"> ${putAll.literature}  </span><br/>
                                <span class="line-height-1 smaller-90"> 文学 </span>
                            </span>
                            <span class="btn btn-app btn-sm btn-pink no-hover">
                                <span class="line-height-1 bigger-170"> ${putAll.novel}  </span><br/>
                                <span class="line-height-1 smaller-90"> 小说 </span>
                            </span>
                            <span class="btn btn-app btn-sm btn-grey no-hover">
                                <span class="line-height-1 bigger-170"> ${putAll.economicManagement}  </span><br/>
                                <span class="line-height-1 smaller-90"> 经济管理 </span>
                            </span>
                            <span class="btn btn-app btn-sm btn-success no-hover">
                                <span class="line-height-1 bigger-170"> ${putAll.life}  </span><br/>
                                <span class="line-height-1 smaller-90"> 生活 </span>
                            </span>
                            <span class="btn btn-app btn-sm btn-primary no-hover">
                                <span class="line-height-1 bigger-170"> ${putAll.exam}  </span><br/>
                                <span class="line-height-1 smaller-90"> 教材教辅考试 </span>
                            </span>
                        </div>
                        <div class="space-12"></div>
                    </div>
                    <div class="col-sm-5">
                        <div class="widget-box">
                            <div class="widget-header widget-header-flat widget-header-small">
                                <h5>
                                    <i class="icon-signal"></i>
                                    图书入库情况
                                </h5>
                                <div class="widget-toolbar no-border">
                                    <button class="btn btn-minier btn-primary dropdown-toggle x1" data-toggle="dropdown">
                                        <span>本月</span>
                                        <i class="icon-angle-down icon-on-right bigger-110"></i>
                                    </button>

                                    <ul class="dropdown-menu pull-right dropdown-125 dropdown-lighter dropdown-caret">
                                        <li id="thisMonth">
                                            <a href="#" class="blue" onclick="changeDate(0)">
                                                <i class="icon-caret-right bigger-110">&nbsp;</i>
                                                本月
                                            </a>
                                        </li>

                                        <li id="lastMonth">
                                            <a href="#" onclick="changeDate(1)">
                                                <i class="icon-caret-right bigger-110 invisible">&nbsp;</i>
                                                上个月
                                            </a>
                                        </li>

                                        <li id="thisYear">
                                            <a href="#" onclick="changeDate(2)">
                                                <i class="icon-caret-right bigger-110 invisible">&nbsp;</i>
                                                今年
                                            </a>
                                        </li>

                                        <li id="lastYear">
                                            <a href="#" onclick="changeDate(3)">
                                                <i class="icon-caret-right bigger-110 invisible">&nbsp;</i>
                                                去年
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main">
                                    <div id="echartsBookAll" style="width:100%;height:400px;"></div>
                                </div><!-- /widget-main -->
                            </div><!-- /widget-body -->
                        </div><!-- /widget-box -->
                    </div>
                    <div class="col-sm-5">
                        <div class="widget-box">
                            <div class="widget-header widget-header-flat widget-header-small">
                                <h5>
                                    <i class="icon-signal"></i>
                                    近两周图书入库情况
                                </h5>

                                <div class="widget-toolbar no-border">
                                    <button class="btn btn-minier btn-primary dropdown-toggle x2" data-toggle="dropdown">
                                        <span>本周</span>
                                        <i class="icon-angle-down icon-on-right bigger-110"></i>
                                    </button>

                                    <ul class="dropdown-menu pull-right dropdown-125 dropdown-lighter dropdown-caret">
                                        <li id="thisWeek">
                                            <a href="#" class="blue" onclick="changeDate(4)">
                                                <i class="icon-caret-right bigger-110">&nbsp;</i>
                                                本周
                                            </a>
                                        </li>

                                        <li id="lastWeek">
                                            <a href="#" onclick="changeDate(5)">
                                                <i class="icon-caret-right bigger-110 invisible">&nbsp;</i>
                                                上周
                                            </a>
                                        </li>

                                    </ul>
                                </div>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main">
                                    <div id="echarts" style="width:100%;height:400px;"></div>
                                </div><!-- /widget-main -->
                            </div><!-- /widget-body -->
                        </div><!-- /widget-box -->
                    </div>
                    <script type="text/javascript">
                        // 基于准备好的dom，初始化echarts实例
                        var myChart = echarts.init(document.getElementById('echarts'));
                        var echartsBookAll = echarts.init(document.getElementById('echartsBookAll'));

                        option = {
                            tooltip: {
                                trigger: 'axis'
                            },
                            legend: {
                                data: ['少儿', '文学', '小说', '经济管理', '生活', '教材教辅考试']
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            toolbox: {
                                feature: {
                                    saveAsImage: {}
                                }
                            },
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                data: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六']
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [
                                {
                                    name:'少儿',
                                    type:'line',
                                    stack: '少儿总量',
                                    data:[${weekBooks.get(0).child}, ${weekBooks.get(1).child}, ${weekBooks.get(2).child}, ${weekBooks.get(3).child}
                                        , ${weekBooks.get(4).child}, ${weekBooks.get(5).child}, ${weekBooks.get(6).child}]
                                },
                                {
                                    name:'文学',
                                    type:'line',
                                    stack: '文学总量',
                                    data:[${weekBooks.get(0).literature}, ${weekBooks.get(1).literature}, ${weekBooks.get(2).literature}, ${weekBooks.get(3).literature}
                                        , ${weekBooks.get(4).literature},${weekBooks.get(5).literature},${weekBooks.get(6).literature}]
                                },
                                {
                                    name:'小说',
                                    type:'line',
                                    stack: '小说总量',
                                    data:[${weekBooks.get(0).novel}, ${weekBooks.get(1).novel}, ${weekBooks.get(2).novel}, ${weekBooks.get(3).novel}
                                        , ${weekBooks.get(4).novel}, ${weekBooks.get(5).novel}, ${weekBooks.get(6).novel}]
                                },
                                {
                                    name:'经济管理',
                                    type:'line',
                                    stack: '经济管理总量',
                                    data:[${weekBooks.get(0).economicManagement}, ${weekBooks.get(1).economicManagement},
                                        ${weekBooks.get(2).economicManagement}, ${weekBooks.get(3).economicManagement}
                                        , ${weekBooks.get(4).economicManagement}, ${weekBooks.get(5).economicManagement}
                                        , ${weekBooks.get(6).economicManagement}]
                                },
                                {
                                    name:'生活',
                                    type:'line',
                                    stack: '生活总量',
                                    data:[${weekBooks.get(0).life}, ${weekBooks.get(1).life}, ${weekBooks.get(2).life}, ${weekBooks.get(3).life}
                                        , ${weekBooks.get(4).life}, ${weekBooks.get(5).life}, ${weekBooks.get(6).life}]
                                },
                                {
                                    name:'教材教辅考试',
                                    type:'line',
                                    stack: '教材教辅考试总量',
                                    data:[${weekBooks.get(0).exam}, ${weekBooks.get(1).exam}, ${weekBooks.get(2).exam}, ${weekBooks.get(3).exam}
                                        , ${weekBooks.get(4).exam}, ${weekBooks.get(5).exam}, ${weekBooks.get(6).exam}]
                                }
                            ]
                        };
                        optionAll = {
                            tooltip: {
                                trigger: 'axis'
                            },
                            legend: {
                                left: 'left',
                                data: ['少儿', '文学', '小说', '经济管理', '生活', '教材教辅考试']
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            toolbox: {
                                feature: {
                                    saveAsImage: {}
                                }
                            },
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                data: ['第一周','第二周','第三周','第四周']
                            },
                            yAxis: {
                                type: 'value'
                            },
                            series: [
                                {
                                    name:'少儿',
                                    type:'line',
                                    stack: '少儿总量',
                                    data:[${countBooks.get(0).child}, ${countBooks.get(1).child}, ${countBooks.get(2).child}, ${countBooks.get(3).child}]
                                },
                                {
                                    name:'文学',
                                    type:'line',
                                    stack: '总量',
                                    data:[${countBooks.get(0).literature}, ${countBooks.get(1).literature}, ${countBooks.get(2).literature}, ${countBooks.get(3).literature}]
                                },
                                {
                                    name:'小说',
                                    type:'line',
                                    stack: '文学总量',
                                    data:[${countBooks.get(0).novel}, ${countBooks.get(1).novel}, ${countBooks.get(2).novel}, ${countBooks.get(3).novel}]
                                },
                                {
                                    name:'经济管理',
                                    type:'line',
                                    stack: '经济管理总量',
                                    data:[${countBooks.get(0).economicManagement}, ${countBooks.get(1).economicManagement},
                                        ${countBooks.get(2).economicManagement}, ${countBooks.get(3).economicManagement}]
                                },
                                {
                                    name:'生活',
                                    type:'line',
                                    stack: '生活总量',
                                    data:[${countBooks.get(0).life}, ${countBooks.get(1).life}, ${countBooks.get(2).life}, ${countBooks.get(3).life}]
                                },
                                {
                                    name:'教材教辅考试',
                                    type:'line',
                                    stack: '教材教辅考试总量',
                                    data:[${countBooks.get(0).exam}, ${countBooks.get(1).exam}, ${countBooks.get(2).exam}, ${countBooks.get(3).exam}]
                                }
                            ]
                        };

                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);
                        echartsBookAll.setOption(optionAll);

                    </script>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.page-content -->
        </div>
        <!-- /.main-content -->
        <%--<jsp:include page="/common/skin.jsp"></jsp:include>--%>
    </div>
    <!-- /.main-container-inner -->

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>

<!-- basic scripts -->

<!--[if !IE]> -->
<!--confirm-delete指向HTML中的模式框(modal)代码 -->


<jsp:include page="/common/commonjs.jsp"></jsp:include>
</body>
<script>
    function changeDate(type){
        $.ajax({
            type: "GET",
            data:["type",type],
            url: "echartsPutBookByType?type="+type,
            dataType: "json",
            success: function (data) {
                //修改选中
                if(type==0){
                    $(".x1").find('span').html('本月')
                    showMonth(data)
                }
                if(type==1){
                    $(".x1").find('span').html('上个月')
                    showMonth(data)
                }
                if(type==2){
                    $(".x1").find('span').html('今年')
                    yearMonth(data)
                }
                if(type==3){
                    $(".x1").find('span').html('去年')
                    yearMonth(data)
                }
                if(type==4){
                    $(".x2").find('span').html('本周')
                    weekData(data)
                }
                if(type==5){
                    $(".x2").find('span').html('上周')
                    weekData(data)
                }
                //重新渲染数据，加载图表
                console.log(data)
            }

        })
    }
    // 月数据
    function  showMonth(data){
        var echartsBookAll = echarts.init(document.getElementById('echartsBookAll'));
        optionAll = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['少儿', '文学', '小说', '经济管理', '生活', '教材教辅考试']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['第一周','第二周','第三周','第四周']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'少儿',
                    type:'line',
                    stack: '少儿总量',
                    data:[data[0].child, data[1].child, data[2].child,data[3].child]
                },
                {
                    name:'文学',
                    type:'line',
                    stack: '文学总量',
                    data:[data[0].literature, data[1].literature, data[2].literature,data[3].literature]
                },
                {
                    name:'小说',
                    type:'line',
                    stack: '小说总量',
                    data:[data[0].novel, data[1].novel, data[2].novel,data[3].novel]
                },
                {
                    name:'经济管理',
                    type:'line',
                    stack: '经济管理总量',
                    data:[data[0].economicManagement, data[1].economicManagement, data[2].economicManagement,data[3].economicManagement]
                },
                {
                    name:'生活',
                    type:'line',
                    stack: '生活总量',
                    data:[data[0].life, data[1].life, data[2].life,data[3].life]
                },
                {
                    name:'教材教辅考试',
                    type:'line',
                    stack: '教材教辅考试总量',
                    data:[data[0].exam, data[1].exam, data[2].exam,data[3].exam]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        echartsBookAll.setOption(optionAll);
    }
    // 年数据
    function  yearMonth(data){
        var echartsBookAll = echarts.init(document.getElementById('echartsBookAll'));
        optionAll = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['少儿', '文学', '小说', '经济管理', '生活', '教材教辅考试']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['第一季度','第二季度','第三季度','第四季度']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'少儿',
                    type:'line',
                    stack: '少儿总量',
                    data:[data[0].child, data[1].child, data[2].child,data[3].child]
                },
                {
                    name:'文学',
                    type:'line',
                    stack: '文学总量',
                    data:[data[0].literature, data[1].literature, data[2].literature,data[3].literature]
                },
                {
                    name:'小说',
                    type:'line',
                    stack: '小说总量',
                    data:[data[0].novel, data[1].novel, data[2].novel,data[3].novel]
                },
                {
                    name:'经济管理',
                    type:'line',
                    stack: '经济管理总量',
                    data:[data[0].economicManagement, data[1].economicManagement, data[2].economicManagement,data[3].economicManagement]
                },
                {
                    name:'生活',
                    type:'line',
                    stack: '生活总量',
                    data:[data[0].life, data[1].life, data[2].life,data[3].life]
                },
                {
                    name:'教材教辅考试',
                    type:'line',
                    stack: '教材教辅考试总量',
                    data:[data[0].exam, data[1].exam, data[2].exam,data[3].exam]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        echartsBookAll.setOption(optionAll);
    }
    //周数据
    function  weekData(data){
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('echarts'));
        option = {
            tooltip: {
                trigger: 'axis'
            },
            legend: {
                data: ['少儿', '文学', '小说', '经济管理', '生活', '教材教辅考试']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            xAxis: {
                type: 'category',
                boundaryGap: false,
                data: ['星期日','星期一','星期二','星期三','星期四','星期五','星期六']
            },
            yAxis: {
                type: 'value'
            },
            series: [
                {
                    name:'少儿',
                    type:'line',
                    stack: '少儿总量',
                    data:[data[0].child,data[1].child,data[2].child,data[3].child,data[4].child,data[5].child,data[6].child]
                },
                {
                    name:'文学',
                    type:'line',
                    stack: '文学总量',
                    data:[data[0].literature,data[1].literature, ,data[2].literature,,data[3].literature,,data[4].literature,,data[5].literature,,data[6].literature]
                },
                {
                    name:'小说',
                    type:'line',
                    stack: '小说总量',
                    data:[data[0].novel,data[1].novel,data[2].novel,data[3].novel,data[4].novel,data[5].novel,data[6].novel]
                },
                {
                    name:'经济管理',
                    type:'line',
                    stack: '经济管理总量',
                    data:[data[0].economicManagement,data[1].economicManagement, data[2].economicManagement,
                        data[3].economicManagement, data[4].economicManagement, data[5].economicManagement,
                        data[6].economicManagement,
                    ]
                },
                {
                    name:'生活',
                    type:'line',
                    stack: '生活总量',
                    data:[data[0].life,data[1].life,data[2].life,data[3].life,data[4].life,data[5].life,data[6].life]
                },
                {
                    name:'教材教辅考试',
                    type:'line',
                    stack: '教材教辅考试s总量',
                    data:[data[0].exam,data[1].exam,data[2].exam,data[3].exam,data[4].exam,data[5].exam,data[6].exam ]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    }
</script>

</html>


