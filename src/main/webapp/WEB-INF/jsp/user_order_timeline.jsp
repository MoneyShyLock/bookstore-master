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
    <meta charset="utf-8" />
    <title>首页 - BookStore后台管理系统</title>
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
    <link rel="stylesheet" href="css/style.css"/>
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
    <script src="/js/modernizr.custom.63321.js"></script>
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
        <jsp:include page="/common/menu.jsp"></jsp:include>

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
                    <h3>
                        管理员管理
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                        列表
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>

                    </h3>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <!--主体内容-->
                    <div class="container">
                        <section class="main">
                            <ul class="timeline" id="showList">
                                <li class="event">
                                    <input type="radio" name="tl-group" checked/>
                                    <label></label>
                                    <div class="thumb user-4">
                                            <span>
                                                日期
                                            </span>
                                    </div>
                                    <div class="content-perspective">
                                        <div class="content">
                                            <div class="content-inner">
                                                <h3>订单</h3>
                                                <p>订单内容</p>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </section>

                    </div><!-- /container -->
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
<!--confirm-delete指向HTML中的模式框(modal)代码 -->


<jsp:include page="/common/commonjs.jsp"></jsp:include>

</body>

</html>

<script>
    Date.prototype.toLocaleString = function() {
        return this.getFullYear() + "-" + (this.getMonth() + 1) + "-" + this.getDate() ;
    };
    $.ajax({
        type: "GET",
        url: "data?uid=1",
        dataType: "json",
        success: function (result) {
            console.log(result);
            var data = result.list;
            var $showList = $('#showList');
            var str = "";
            for (var i = 0; i < data.length; i++) {
                str += "<li class=\"event\">";
                str += "<input type=\"radio\" name=\"tl-group\"/>";
                str += "<label>看详情</label>";
                str += "<div class=\"thumb user-4\">";
                str += "<span>" + new Date(data[i].created).toLocaleString() + "</span>";
                str += "</div>";
                str += "<div class=\"content-perspective\">";
                str += "<div class=\"content\">";
                str += "<div class=\"content-inner\">";
                str += "<h3>" + result.title + "</h3>";
                //str += "<p>" + data[i].content + "</p>";
                var item = JSON.parse(data[i].content);
                for(var j = 0;j<item.length;j++){
                    str += "<p>书名:" + item[j].bookname + ",价格:"+item[j].price+"元,数量:"+item[j].count+"</p>";
                }

                str += "</div>";
                str += "</div>";
                str += "</div>";
                str += "</li>";
            }
            $showList.append(str);
        }
    });
</script>

