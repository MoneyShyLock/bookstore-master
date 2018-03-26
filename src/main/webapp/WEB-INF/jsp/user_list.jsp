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
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
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

                <li class="active open">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-list"></i>
                        <span class="menu-text"> 用户管理 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li class="active">
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
                        用户管理
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                        用户列表
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                    </h3>
                </div>
                <!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="page-content">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-header">
                                        普通用户列表
                                    </div>

                                    <div class="table-responsive">
                                        <table id="sample-table-2"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th class="center" style="width: 10%">
                                                    ID
                                                </th>
                                                <th class="center" style="width: 10%">登录名</th>
                                                <th class="center" style="width: 15%">联系方式</th>
                                                <th class="center" style="width: 20%">邮箱地址</th>
                                                <th class="center" style="width: 15%">注册时间</th>
                                                <th class="center" style="width: 30%">操作</th>
                                            </tr>
                                            </thead>

                                            <tbody id="dataTbody">
                                            <c:forEach items="${pageUserInfo.list }" var="user">
                                                <tr>
                                                    <th class="center">${user.id }</th>
                                                    <th class="center">${user.username }</th>
                                                    <th class="center">
                                                        <span>${user.tel }</span>
                                                    </th>
                                                    <th class="center">
                                                        <span>${user.email }</span>
                                                    </th>
                                                    <th class="center"><fmt:setLocale value="zh"/>
                                                        <fmt:formatDate value="${user.registerTime}"
                                                                        pattern="yyyy-MM-d HH:mm:ss EEEE"/></th>

                                                    <th class="center">
                                                        <button class="label label-xlg label-primary arrowed arrowed-right"
                                                                role="button" class="blue"
                                                                data-toggle="modal"
                                                                data-target="#userShop"
                                                                onclick="check(${user.id})">
                                                           <i class="icon-edit"></i>
                                                            查看
                                                        </button>
                                                        <button class="label label-lg label-pink arrowed-right" onclick="del(${user.id})">
                                                            <span class="icon-trash"
                                                                  aria-hidden="true"></span>
                                                            删除
                                                        </button>
                                                        <button class="label label-xlg label-primary arrowed arrowed-right"
                                                                onclick="modifyPwd(${user.id})">
                                                            重置密码
                                                        </button>
                                                    </th>
                                                </tr>
                                            </c:forEach>
                                            <%--<tr>--%>

                                            <%--<td>--%>
                                            <%--<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">--%>
                                            <%--<a class="blue" href="#">--%>
                                            <%--<i class="icon-zoom-in bigger-130"> 查看详情</i>--%>
                                            <%--</a>--%>

                                            <%--</div>--%>
                                            <%--</td>--%>
                                            <%--</tr>--%>
                                            </tbody>
                                        </table>

                                        <!-- 显示分页信息 -->
                                        <div class="row">
                                            <!--分页文字信息  -->
                                            <div class="col-md-6">当前 ${pageUserInfo.pageNum }页,总${pageUserInfo.pages }
                                                页,总 ${pageUserInfo.total } 条记录
                                            </div>
                                            <!-- 分页条信息 -->
                                            <div class="col-md-6">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination">
                                                        <li><a href="listUsers?pn=1">首页</a></li>
                                                        <c:if test="${pageUserInfo.hasPreviousPage }">
                                                            <li><a href="listUsers?pn=${pageUserInfo.pageNum-1}"
                                                                   aria-label="Previous"> <span
                                                                    aria-hidden="true">&laquo;</span>
                                                            </a></li>
                                                        </c:if>


                                                        <c:forEach items="${pageUserInfo.navigatepageNums }"
                                                                   var="page_Num">
                                                            <c:if test="${page_Num == pageUserInfo.pageNum }">
                                                                <li class="active"><a href="#">${page_Num }</a></li>
                                                            </c:if>
                                                            <c:if test="${page_Num != pageUserInfo.pageNum }">
                                                                <li><a href="listUsers?pn=${page_Num }">${page_Num }</a>
                                                                </li>
                                                            </c:if>

                                                        </c:forEach>
                                                        <c:if test="${pageUserInfo.hasNextPage }">
                                                            <li><a href="listUsers?pn=${pageUserInfo.pageNum+1 }"
                                                                   aria-label="Next"> <span
                                                                    aria-hidden="true">&raquo;</span>
                                                            </a></li>
                                                        </c:if>
                                                        <li><a href="listUsers?pn=${pageUserInfo.pages}">末页</a></li>
                                                    </ul>
                                                </nav>
                                            </div>
                                        </div>
                                    </div><!-- /main-container -->
                                </div>
                            </div>
                        </div>
                    </div>

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
<!--confirm-delete指向HTML中的模式框(modal)代码 -->
<%--//模式框弹框--%>

<div class="modal fade" id="userShop" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">消费记录</h4>
            </div>
            <div class="modal-body">
                <%--显示该用户的消费记录--%>
                <table id="sample-table-3" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="center" style="width: 10%">订单编号</th>
                        <th class="center" style="width: 20%">物品数量</th>
                        <th class="center" style="width: 40%">购买物品</th>
                    </tr>
                    </thead>
                    <tbody id="showDetail">

                    </tbody>
                </table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<jsp:include page="/common/commonjs.jsp"></jsp:include>

</body>

</html>

<script>
    function del(aid) {
        var del = window.confirm("您确定要删除吗？");
        if (del) {
            $.ajax({
                type: "GET",
                url: "delUser?id="+aid,
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                    location.reload();
                }
            });
        }
    }
    function modifyPwd(aid) {
        var modify = window.confirm("您确定要初始化密码吗？");
        if (modify) {
            $.ajax({
                type: "GET",
                url: "modify?id="+aid,
                dataType: "json",
                success: function (data) {
                   alert("密码初始化成功")
                    location.reload();
                }
            });
        }
    }
    function check(uid) {
        $.ajax({
            type: "GET",
            url: "getOrderByUid?uid=" + uid,
            dataType: "json",
            success: function (data) {
                console.log(data);
                var str="";
                for(var i=0;i<data.length;i++){
                    var books=data[i].books;
                    var id=data[i].id;
                    var count=0;
                    var bookname="";
                    for(var j=0;j<books.length;j++){
                        count+=books[j].count;
                        if(j<=2){
                            bookname+=books[j].bookname;
                        }

                    }
                    str+="<tr>";
                    str+="<th>"+data[i].id+"</th>";
                    /*str+="<th>uname</th>";*/
                    str+="<th>"+count+"</th>";

                    str+="<th>"+bookname+"</th>";
                    str+="</tr>";
                }
                $("#showDetail").append(str);
            }
        });
    }

</script>

