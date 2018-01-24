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
    <title>首页 - Ychat后台管理系统</title>
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
                        <a href="/">首页</a>
                    </li>

                </ul>
                <!-- .breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h3>
                        转账管理
                        <small>
                            <i class="icon-double-angle-right"></i>
                        </small>
                        列表
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
                                        转账列表

                                        <input id="query" type="search" name="query" placeholder="查询">
                                        <button id="querybtn" class="btn help-btn">查询</button>
                                    </div>

                                    <div class="table-responsive">
                                        <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th class="center">
                                                    转账发起人
                                                </th>
                                                <th>金额</th>
                                                <th class="hidden-480">备注</th>
                                                <th class="hidden-480">转账接收人</th>
                                                <th>
                                                    <i class="icon-time bigger-110 hidden-480"></i> 创建时间
                                                </th>
                                                <th class="hidden-480">支付类型</th>
                                                <th>操作</th>
                                            </tr>
                                            </thead>

                                            <tbody id="dataTbody">
                                            <c:forEach items="${pageInfo.list }" var="transferVO">
                                                <tr>
                                                    <th>${transferVO.username }</th>
                                                    <th>${transferVO.money }</th>
                                                    <th>
                                                        <span class="label label-sm label-success">${transferVO.remark }</span>
                                                    </th>
                                                    <th>
                                                        ${transferVO.toUsername }
                                                    </th>
                                                    <th><fmt:setLocale value="zh"/>
                                                        <fmt:formatDate value="${transferVO.createTime}" pattern="yyyy-MM-d HH:mm:ss EEEE" /></th>
                                                    <th>${transferVO.payType }</th>

                                                        <td>
                                                        <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
                                                        <a class="blue" href="#">
                                                        <i class="icon-zoom-in bigger-130"> 查看详情</i>
                                                        </a>

                                                        </div>
                                                        </td>

                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>

                                        <!-- 显示分页信息 -->
                                        <div class="row">
                                            <!--分页文字信息  -->
                                            <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                                                页,总 ${pageInfo.total } 条记录</div>
                                            <!-- 分页条信息 -->
                                            <div class="col-md-6">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination">
                                                        <li><a href="/listTransfers?pn=1">首页</a></li>
                                                        <c:if test="${pageInfo.hasPreviousPage }">
                                                            <li><a href="/listTransfers?pn=${pageInfo.pageNum-1}"
                                                                   aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                                            </a></li>
                                                        </c:if>


                                                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                            <c:if test="${page_Num == pageInfo.pageNum }">
                                                                <li class="active"><a href="#">${page_Num }</a></li>
                                                            </c:if>
                                                            <c:if test="${page_Num != pageInfo.pageNum }">
                                                                <li><a href="/listTransfers?pn=${page_Num }">${page_Num }</a></li>
                                                            </c:if>

                                                        </c:forEach>
                                                        <c:if test="${pageInfo.hasNextPage }">
                                                            <li><a href="/listTransfers?pn=${pageInfo.pageNum+1 }"
                                                                   aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                                            </a></li>
                                                        </c:if>
                                                        <li><a href="/listTransfers?pn=${pageInfo.pages}">末页</a></li>
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
    $('#querybtn').click(function () {
        alert("OK");
        var $query = $('#query').val();
        $.ajax({
            type: "post",
            url: "listTransfers",
            data: {
                query: $query
            },
            dataType: "json",
            success: function(result) {                    //result为返回值

                console.log(result);
            }
        });
    })
</script>

