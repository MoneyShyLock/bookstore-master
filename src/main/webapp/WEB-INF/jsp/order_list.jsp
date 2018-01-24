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
        <jsp:include page="/common/menu.jsp"></jsp:include>

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
                        订单管理
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
                                        订单列表
                                        <input id="query" type="search" name="query" placeholder="查询条件"
                                               value="${query }">
                                        <select id="status" name="status">
                                            <option value="">请选择</option>
                                            <option value="1">未支付</option>
                                            <option value="2">未发货</option>
                                            <option value="3">已发货</option>
                                            <option value="4">确认送达</option>
                                            <option value="5">交易成功</option>
                                            <option value="6">交易失败</option>
                                        </select>
                                        <button onclick="search()" class="btn help-btn">查询${status}</button>
                                        <a id="hidden_status" style="display: none">${status}</a>
                                    </div>

                                    <div class="table-responsive">
                                        <table id="sample-table-2"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                            <tr>
                                                <th class="center" style="width: 10%">
                                                    <i class="icon-edit  bigger-110 hidden-480"></i>
                                                    订单号
                                                </th>
                                                <th class="center" style="width: 20%"><i class="icon-user  bigger-110 hidden-480"></i>购买用户</th>

                                                <th class="center" style="width: 10%">
                                                    <i class="icon-time bigger-110 hidden-480"></i> 购买时间
                                                </th>
                                                <th class="center" style="width: 10%"><i class="icon-edit  bigger-110 hidden-480"></i>订单状态</th>

                                                <th class="center" style="width: 20%"> <i class="icon-money  bigger-110 hidden-480"></i>交易金额</th>

                                                <th class="center" style="width: 30%"><i class="icon-edit  bigger-110 hidden-480"></i>操作</th>
                                            </tr>

                                            </thead>

                                            <tbody id="dataTbody">

                                            <c:forEach items="${pageInfo.list }" var="order">
                                                <tr>
                                                    <th class="center">${order.id }</th>
                                                    <th class="center">${order.username }</th>
                                                    <th class="center"><fmt:setLocale value="zh"/>
                                                        <fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-d" />
                                                    </th>
                                                    <c:if test="${order.status==1}">
                                                        <th class="center" style="color: red">未支付</th>
                                                    </c:if>
                                                    <c:if test="${order.status==2}">
                                                        <th class="center">未发货</th>
                                                    </c:if>
                                                    <c:if test="${order.status==3}">
                                                        <th class="center">已发货</th>
                                                    </c:if>
                                                    <c:if test="${order.status==4}">
                                                        <th class="center">确认到达</th>
                                                    </c:if>
                                                    <c:if test="${order.status==5}">
                                                        <th class="center">交易成功</th>
                                                    </c:if>
                                                    <c:if test="${order.status==6}">
                                                        <th class="center">交易失败</th>
                                                    </c:if>

                                                    <th class="center">${order.amounts}</th>
                                                    <th class="center">
                                                        <button class="btn btn-primary btn-sm">
                                                            <a role="button" class="blue" onclick="loadData(${order.id})"
                                                               data-toggle="modal"
                                                               data-target="#orderInformation"
                                                               >
                                                                查看
                                                            </a>
                                                        </button>
                                                        <c:if test="${order.status==1}">
                                                            <button class="btn btn-toolbar btn-sm">
                                                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                                <a href="javascript:"> 用户未支付 </a>
                                                            </button>
                                                        </c:if>
                                                        <c:if test="${order.status==2}">
                                                            <button class="btn btn-toolbar btn-sm">
                                                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                                <a href="javascript:up(${order.id} )"> 　通知发货 </a>
                                                            </button>
                                                        </c:if>
                                                        <c:if test="${order.status==3||order.status==4||order.status==5||order.status==6}">
                                                            <button class="btn btn-toolbar btn-sm">
                                                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                                <a href="javascript:"> 已　发　货 </a>
                                                            </button>
                                                        </c:if>

                                                    </th>
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>

                                        <div class="row">
                                            <!--分页文字信息  -->
                                            <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                                                页,总 ${pageInfo.total } 条记录
                                            </div>
                                            <!-- 分页条信息 -->
                                            <div class="col-md-6">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination">
                                                        <li><a onclick="_firstPage()">首页</a>
                                                        </li>
                                                        <c:if test="${pageInfo.hasPreviousPage }">
                                                            <li>
                                                                <a onclick="_orderPage()"
                                                                   aria-label="Previous"> <span
                                                                        aria-hidden="true">&laquo;</span>
                                                                </a></li>
                                                        </c:if>


                                                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                            <c:if test="${page_Num == pageInfo.pageNum }">
                                                                <li class="active"><a href="#">${page_Num }</a></li>
                                                            </c:if>
                                                            <c:if test="${page_Num != pageInfo.pageNum }">
                                                                <li>
                                                                    <a onclick="_page_Num(this)">${page_Num }</a>
                                                                </li>
                                                            </c:if>

                                                        </c:forEach>
                                                        <c:if test="${pageInfo.hasNextPage }">
                                                            <li>
                                                                <a onclick="_nextPage()"
                                                                   aria-label="Next"> <span
                                                                        aria-hidden="true">&raquo;</span>
                                                                </a></li>
                                                        </c:if>
                                                        <li>
                                                            <a onclick="_lastPage()">末页</a>
                                                        </li>
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
<%--//模式框弹框--%>

<div class="modal fade" id="orderInformation" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">订单详情</h4>
            </div>
            <div class="modal-body">
                <%--插入内容--%>
                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label for="recevierName" class="col-sm-2 control-label">收件人</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="recevierName" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-sm-2 control-label">地址</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="address" readonly="readonly">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="recevierTel" class="col-sm-2 control-label">联系方式</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="recevierTel" readonly="readonly">
                            </div>
                        </div>
                    </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>

            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

</body>

</html>
<%--弹出层显示信息--%>

<%--//搜索--%>
<script>
    function search() {
        var $query = $('input[name=query]').val();
        var $encodeQuery = encodeURI(encodeURI($query));
        var obj = document.getElementById("status");
        for (i = 0; i < obj.length; i++) {//下拉框的长度就是它的选项数.

            if (obj[i].selected == true) {
                var text = obj[i].value;//获取当前选择项的值.
            }
        }

        window.location.href = 'listOrders?pn=${page_Num }&query=' + $encodeQuery + '&status=' + text;
    }
</script>

<!--显示末页-->
<script>
    function _lastPage() {
        var $query = $('input[name=query]').val();
        var encodeQuery = encodeURI(encodeURI($query));
        var $status = $('#hidden_status').text();
        location.href = 'listOrders?pn=${pageInfo.pages}&query=' + encodeQuery + '&status=' + $status;
    }
</script>
<!--显示首页-->
<script>
    function _firstPage() {
        var $query = $('input[name=query]').val();
        var encodeQuery = encodeURI(encodeURI($query));
        var $status = $('#hidden_status').text();
        location.href = 'listOrders?pn=1&query=' + encodeQuery + '&status=' + $status;
    }

</script>
<!--显示123456页-->
<script>
    function _orderPage() {
        var $query = $('input[name=query]').val();
        var encodeQuery = encodeURI(encodeURI($query));
        var $status = $('#hidden_status').text();
        location.href = 'listOrders?pn=${pageInfo.pageNum-1}&query=' + encodeQuery + '&status=' + $status;
    }

</script>
<!--活跃的页码页-->
<script>
    function _page_Num(page) {
        var $page_num = page.innerHTML;
        var $query = $('input[name=query]').val();
        var encodeQuery = encodeURI(encodeURI($query));
        var $status = $('#hidden_status').text();
        location.href = 'listOrders?pn=' + $page_num + '&query=' + encodeQuery + '&status=' + $status;
    }
</script>

<!--下一页 -->
<script>
    function _nextPage() {
        var $query = $('input[name=query]').val();
        var encodeQuery = encodeURI(encodeURI($query));
        var $status = $('#hidden_status').text();
        location.href = 'listOrders?pn=${pageInfo.pageNum+1}&query=' + encodeQuery + '&status=' + $status;
    }
</script>

<script>
    function loadData(id){


       $.ajax({
            type: "GET",
            url: "orderById?id=" + id,
            dataType: "json",
            success: function (data) {                    //result为返回值
                console.log(data);
                $("#recevierName").val(data.recevierName);
                $("#address").val(data.address);
                $("#recevierTel").val(data.recevierTel);
            }
        });

    }
</script>


</script>

