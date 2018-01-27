<%--
  Created by IntelliJ IDEA.
  User: Wee Kim Wee
  Date: 2017/12/28
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>首页 - 系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="assets/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- ace styles -->

    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />

    <!--[if lte IE 8]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="assets/js/ace-extra.min.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body>

<jsp:include page="/common/header.jsp"></jsp:include>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try { ace.settings.check('main-container', 'fixed') } catch(e) {}
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <%--<jsp:include page="/common/menu.jsp"></jsp:include>--%>

        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try { ace.settings.check('sidebar', 'fixed') } catch(e) {}
            </script>
            <ul class="nav nav-list">
                <li>
                    <a href="index" class="active">
                        <i class="icon-dashboard"></i>
                        <span class="menu-text">首页 </span>
                    </a>
                </li>

                <li >
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
                        <li>
                            <a href="addCa" target="_blank">
                                <i class="icon-double-angle-right"></i> 图书种类添加与删除
                            </a>
                        </li>

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
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i> 订单评论
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
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
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>入库信息统计
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>出库信息统计
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-double-angle-right"></i>销售信息统计
                            </a>
                        </li>
                    </ul>
                </li>

            </ul>
            <!-- /.nav-list -->

            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try { ace.settings.check('sidebar', 'collapsed') } catch(e) {}
            </script>
        </div>

        <div class="main-content">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try { ace.settings.check('breadcrumbs', 'fixed') } catch(e) {}
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
                    <h1>

                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->

                        <div class="alert alert-block alert-success">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="icon-remove"></i>
                            </button>

                            <i class="icon-ok green"></i> 欢迎使用
                            <strong class="green">
                               网上书城后台管理系统
                                <small>(v1.0)</small>
                            </strong>

                        </div>


                        <div class="row">
                            <div class="space-6"></div>
                            <div class="space-6"></div>

                            <div>&copy; 2017 <strong>zdp</strong>. 版权所有.</div>
                        </div>
                        <!-- /row -->
                    </div>
                    <!-- /.col -->
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

<jsp:include page="/common/commonjs.jsp"></jsp:include>
</body>

</html>
