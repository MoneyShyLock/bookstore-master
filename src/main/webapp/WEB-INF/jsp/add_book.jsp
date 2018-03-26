<%--
  Created by IntelliJ IDEA.
  User: Wee Kim Wee
  Date: 2017/12/28
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
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
    <!--引入时间插件-->
    <script src="My97DatePicker/WdatePicker.js"></script>
    <script src="assets/js/ace-extra.min.js"></script>
    <script src="js/jquery-1.11.1.min.js"></script>
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
                try { ace.settings.check('sidebar', 'fixed') } catch(e) {}
            </script>
            <ul class="nav nav-list">
                <li>
                    <a href="index">
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

                <li class="active open">
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
                        <li  class="active">
                            <a href="addBook" target="_blank">
                                <i class="icon-double-angle-right"></i> 图书信息登记
                            </a>
                        </li>
                        <%--<li>
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
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>

            <script type="text/javascript">
                try { ace.settings.check('sidebar', 'collapsed') } catch(e) {}
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
                        书籍管理
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                        新增
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                    </h3>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <form class="form-horizontal" action="upload" method="post"
                              enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 书名:</label>
                                <div class="col-sm-9">
                                    <input type="text" name="bookname" placeholder="请输入书名">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 买点:</label>
                                <div class="col-sm-9">
                                    <input type="text" name="sellPoint" placeholder="请输入书的卖点">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 作者:</label>
                                <div class="col-sm-9">
                                    <input type="text" name="author" placeholder="请输入作者名称">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">书籍分类所属</label>

                                <div class="col-sm-9">
                                    <select id="category" name="categoryId">
                                        <option value="-1" selected="selected">请选择类别</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">入库价格 </label>
                                <div class="col-sm-9">
                                    <input type="number" step="0.01" name="isbn" id="isbn" placeholder="请输入价格(单位:元)"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">销售价格 </label>
                                <div class="col-sm-9">
                                    <input type="number" step="0.01" name="price" id="price" placeholder="请输入价格(单位:元)"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 折扣 </label>
                                <div class="col-sm-9">
                                    <input type="number" step="0.1" name="discount" placeholder="请输入书的折扣(单位:折)"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 库存:</label>
                                <div class="col-sm-9">
                                    <input type="text" name="inventory" placeholder="请输入库存">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">书籍分类所属</label>

                                <div class="col-sm-9">
                                    <select id="kinds" name="kinds">
                                        <option value="0" selected="selected">请选择</option>
                                        <option value="1" >新书推荐</option>
                                        <option value="2">主编推荐</option>
                                        <option value="3">独家特供</option>
                                        <option value="4">特价图书</option>
                                        <option value="0" >以上无选项</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">是否上架</label>

                                <div class="col-sm-9">
                                    <select id="up" name="status">
                                        <option value="1" selected="selected">上架</option>
                                        <option value="2">暂不上架</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right"> 出版时间</label>
                                <div class="col-sm-9">
                                    <input type="text" name="publishTime" class="Wdate"
                                           onclick="WdatePicker({dateFmt:'yyyy/MM/dd'});"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">
                                    样书封面上传:</label>

                                <div class="col-sm-6">
                                    <div >
                                        <div>
                                            <input type="file" name="file">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div >
                                <div class="col-md-offset-3 col-md-9">
                                    <input class="btn btn-app btn-primary btn-xs" type="submit" value="保存">
                                    &nbsp; &nbsp; &nbsp;
                                    <button class="btn btn-app btn-primary btn-xs" type="reset">
                                        重置
                                    </button>
                                </div>
                            </div>
                            <div class="hr hr-24"></div>
                            <div class="space-24"></div>

                        </form>
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


</body>

</body>

</html>
<script>
    $.ajax({
        type: "post",
        url: "book/category",
        dataType: "json",
        success: function(result) {                    //result为返回值
            console.log(result);

            for(var i = 0;i<result.length;i++){
                $('#category').append("<option value='"+result[i].id+"'>"+result[i].name+"</option>");
            }
        },
        error:function () {
            alert("服务器异常")
        }
    });
</script>


