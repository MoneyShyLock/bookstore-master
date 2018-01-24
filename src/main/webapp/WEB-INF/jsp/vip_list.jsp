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
                        用户管理
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
                    <div class="col-xs-12">
                        <!-- PAGE CONTENT BEGINS -->
                        <div class="page-content">
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="table-header">
                                        VIP用户列表
                                    </div>

                                    <div class="table-responsive">
                                        <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th class="center">
                                                    ID
                                                </th>
                                                <th>登录名</th>
                                                <th>联系方式</th>
                                                <th>邮箱地址</th>
                                                <th>注册时间</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>

                                            <tbody id="dataTbody">
                                            <c:forEach items="${pageUserInfo.list }" var="user">
                                                <tr>
                                                    <th>${user.id }</th>
                                                    <th>${user.username }</th>
                                                    <th>
                                                        <span >${user.tel }</span>
                                                    </th>
                                                    <th>
                                                        <span >${user.email }</span>
                                                    </th>
                                                    <th><fmt:setLocale value="zh"/>
                                                        <fmt:formatDate value="${user.registerTime}" pattern="yyyy-MM-d HH:mm:ss EEEE"/></th>

                                                   <th>
                                                        <button class="btn btn-primary btn-sm">
                                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                            编辑
                                                        </button>
                                                        <button class="btn btn-danger btn-sm">
                                                            <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                            <a href="javascript:del(${user.id} )"> 删除 </a>
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
                                                页,总 ${pageUserInfo.total } 条记录</div>
                                            <!-- 分页条信息 -->
                                            <div class="col-md-6">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination">
                                                        <li><a href="listUsers?pn=1">首页</a></li>
                                                        <c:if test="${pageUserInfo.hasPreviousPage }">
                                                            <li><a href="listUsers?pn=${pageUserInfo.pageNum-1}"
                                                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                                            </a></li>
                                                        </c:if>


                                                        <c:forEach items="${pageUserInfo.navigatepageNums }" var="page_Num">
                                                            <c:if test="${page_Num == pageUserInfo.pageNum }">
                                                                <li class="active"><a href="#">${page_Num }</a></li>
                                                            </c:if>
                                                            <c:if test="${page_Num != pageUserInfo.pageNum }">
                                                                <li><a href="listUsers?pn=${page_Num }">${page_Num }</a></li>
                                                            </c:if>

                                                        </c:forEach>
                                                        <c:if test="${pageUserInfo.hasNextPage }">
                                                            <li><a href="listUsers?pn=${pageUserInfo.pageNum+1 }"
                                                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
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


<jsp:include page="/common/commonjs.jsp"></jsp:include>

</body>

</html>

<script>
    function del(aid){
        var del=window.confirm("您确定要删除吗？");
        if(del){
            $.ajax({
                type: "GET",
                url: "",
                dataType: "json",
                success: function(data) {

                    alert(data.message);
                    location.reload();
                }
            });
        }
    }
</script>

