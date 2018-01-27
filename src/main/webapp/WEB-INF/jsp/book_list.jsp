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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
        <%-- <jsp:include page="/common/menu.jsp"></jsp:include>--%>
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

                <li class="active open">
                    <a href="#" class="dropdown-toggle">
                        <i class="icon-tag"></i>
                        <span class="menu-text"> 图书管理 </span>
                        <b class="arrow icon-angle-down"></b>
                    </a>

                    <ul class="submenu">
                        <li class="active">
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
                        书籍管理
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
                                        书籍列表
                                        <input id="query" type="search" name="query" placeholder="请输入图书名称"
                                               value="${query }">
                                        <button onclick="search()" class="btn help-btn">查询</button>
                                    </div>

                                    <div class="table-responsive">
                                        <table id="sample-table-2"
                                               class="table table-striped table-bordered table-hover">
                                            <thead>
                                            <tr>
                                                <th class="center">
                                                    ID
                                                </th>
                                                <th style="width: 48%">书名</th>
                                                <th style="width: 7%">状态</th>
                                                <th style="width: 10%">
                                                    <i class="icon-time bigger-110 hidden-480"></i> 入库时间
                                                </th>
                                                <th style="width: 5%">库存</th>
                                                <th style="width: 30%">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody id="dataTbody">
                                            <c:forEach items="${pageInfo.list }" var="book">
                                                <tr>
                                                    <th>${book.id }</th>
                                                    <th>${book.bookname }</th>
                                                    <c:if test="${book.status==1&&book.salesVolume>=50}">
                                                        <th style="color: red">热销中</th>
                                                    </c:if>
                                                    <c:if test="${book.status==1&&book.salesVolume<50}">
                                                        <th>上架</th>
                                                    </c:if>
                                                    <c:if test="${book.status==2}">
                                                        <th style="color: black">已下架</th>
                                                    </c:if>
                                                    <th><fmt:setLocale value="zh"/>
                                                        <fmt:formatDate value="${book.created}" pattern="yyyy-MM-d"/>
                                                    </th>
                                                    <th>${book.inventory}</th>
                                                    <th>
                                                        <button class="btn btn-primary btn-sm">
                                                            <a role="button" class="blue"
                                                               data-toggle="modal"
                                                               data-target="#book-modal-table"
                                                               onclick="loadData(${book.id})">
                                                                查看
                                                            </a>
                                                        </button>
                                                        <c:if test="${book.status==1}">
                                                            <button class="btn btn-toolbar btn-sm"
                                                                    onclick="down(${book.id} )">
                                                                <span class="glyphicon glyphicon-trash"
                                                                      aria-hidden="true"></span>
                                                                下架
                                                            </button>
                                                        </c:if>
                                                        <c:if test="${book.status==2}">
                                                            <button class="btn btn-toolbar btn-sm">
                                                                <span class="glyphicon glyphicon-trash"
                                                                      aria-hidden="true"></span>
                                                                <a href="javascript:up(${book.id} )"> 上架 </a>
                                                            </button>
                                                        </c:if>
                                                        <button class="btn btn-toolbar btn-sm" onclick="add(${book.id})">
                                                            <span class="glyphicon glyphicon-trash"
                                                                  aria-hidden="true"></span>
                                                            <input type="hidden"  id="bookAddName${book.id}" value="${book.bookname}">
                                                            <input type="hidden"  id="bookAddId${book.id}" value="${book.id}">
                                                            <a  role="button" class="blue"
                                                                data-toggle="modal"
                                                                data-target="#book-modal-add"> 入库 </a>
                                                        </button>
                                                        <button class="btn btn-toolbar btn-sm" onclick="sub(${book.id})">
                                                            <span class="glyphicon glyphicon-trash"
                                                                  aria-hidden="true"></span>
                                                            <input type="hidden"  id="bookOutName${book.id}" value="${book.bookname}">
                                                            <input type="hidden"  id="bookOutId${book.id}" value="${book.id}">
                                                            <a  role="button" class="blue"
                                                                data-toggle="modal"
                                                                data-target="#book-modal-out"> 出库 </a>
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
                                            <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                                                页,总 ${pageInfo.total } 条记录
                                            </div>
                                            <!-- 分页条信息 -->
                                            <div class="col-md-6">
                                                <nav aria-label="Page navigation">
                                                    <ul class="pagination">
                                                        <li><a href="listBooks?pn=1">首页</a></li>
                                                        <c:if test="${pageInfo.hasPreviousPage }">
                                                            <li><a href="listBooks?pn=${pageInfo.pageNum-1}"
                                                                   aria-label="Previous"> <span
                                                                    aria-hidden="true">&laquo;</span>
                                                            </a></li>
                                                        </c:if>


                                                        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                                            <c:if test="${page_Num == pageInfo.pageNum }">
                                                                <li class="active"><a href="#">${page_Num }</a></li>
                                                            </c:if>
                                                            <c:if test="${page_Num != pageInfo.pageNum }">
                                                                <li><a href="listBooks?pn=${page_Num }">${page_Num }</a>
                                                                </li>
                                                            </c:if>

                                                        </c:forEach>
                                                        <c:if test="${pageInfo.hasNextPage }">
                                                            <li><a href="listBooks?pn=${pageInfo.pageNum+1 }"
                                                                   aria-label="Next"> <span
                                                                    aria-hidden="true">&raquo;</span>
                                                            </a></li>
                                                        </c:if>
                                                        <li><a href="listBooks?pn=${pageInfo.pages}">末页</a></li>
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

<%--图书详情弹出层--%>
<div id="book-modal-table" class="modal fade" tabindex="-1" style="padding-top: 300px">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header no-padding">
                <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="white">&times;</span>
                    </button>
                    图书详情

                </div>
            </div>

            <div class="modal-body no-padding">
                <table id="showDetail"
                       class="table table-striped table-bordered table-hover no-margin-bottom no-border-top">
                </table>
            </div>
            <div class="modal-footer">
                <a href="#" class="btn" data-dismiss="modal">取消</a>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- PAGE CONTENT ENDS -->
<%--图书入库弹出层--%>
<div id="book-modal-add" class="modal fade" tabindex="-1" style="padding-top: 300px">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header no-padding">
                <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="white">&times;</span>
                    </button>
                    图书入库
                </div>
            </div>

            <div class="modal-body no-padding">
                <form id="showBookAdd" action="">
                    <input id="bookId" type="hidden" value="">
                    <div>
                    <label for="bookname">书　　名:</label>
                    <input type="text" id="bookname" name="bookname"value=""  style="width: 60%">
                    </div>
                    <div>
                        <label for="bookNum">入库数量:</label>
                        <input type="text" id="bookNum" value=""  style="width: 60%">
                    </div>
                    <div>
                        <label for="bookIsbn">入库价格:</label>
                        <input type="text" id="bookIsbn" value=""  style="width: 60%">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-default" onclick="addBook()" value="提交">
                <a href="#" class="btn" data-dismiss="modal">取消</a>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<%--图书出库弹出层--%>
<div id="book-modal-out" class="modal fade" tabindex="-1" style="padding-top: 300px">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header no-padding">
                <div class="table-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span class="white">&times;</span>
                    </button>
                    图书出库
                </div>
            </div>

            <div class="modal-body no-padding">
                <form id="showBookOut" action="">
                    <input id="bookOutId" type="hidden" value="">
                    <div>
                        <label for="bookOutName">书　　名:</label>
                        <input type="text" id="bookOutName" value=""  style="width: 60%">
                    </div>
                    <div>
                        <label for="outNum">出库数量:</label>
                        <input type="text" id="outNum" value=""  style="width: 60%">
                    </div>
                    <div>
                        <label for="price">销售价格:</label>
                        <input type="text" id="price" value=""  style="width: 60%">
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-default" onclick="outBook()" value="提交">
                <a href="#" class="btn" data-dismiss="modal">取消</a>
            </div>

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
</body>

</html>
<%--//搜索--%>
<script>
    function search() {
        var $query = $('input[name=query]').val();
        var $encodeQuery = encodeURI(encodeURI($query));
        window.location.href = 'listBooks?pn=${page_Num }&query=' + $encodeQuery ;
    }
</script>
<%--入库弹出层赋值--%>
<script>
    function add(bid) {
        var bookname=$('#bookAddName'+bid).val();
        var bookId=$("#bookAddId"+bid).val();
        console.log(bookname);
        $("#bookname").val(bookname);
        $("#bookId").val(bookId);
    }
</script>
<%--图书入库--%>
<script>
    function addBook() {
        var bookId= $("#bookId").val();
        var inventory=$("#bookNum").val();
        var isbn=$("#bookIsbn").val();
        $.ajax({
            type: "GET",
            url: "addInventory" + "/" + bookId+"/"+inventory+"/"+isbn,
            dataType: "json",
            success: function (data) {
                alert(data.message);
                location.reload();
            }
        });

    }
</script>
<%--出库弹出层赋值--%>
<script>
    function sub(bid) {
        var bookname=$('#bookOutName'+bid).val();
        var bookId=$("#bookOutId"+bid).val();
        console.log(bookname);
        $("#bookOutName").val(bookname);
        $("#bookOutId").val(bookId);
    }
</script>
<%--图书出库--%>
<script>
    function outBook() {
        var bookId= $("#bookOutId").val();
        var inventory=$("#outNum").val();
        var price=$("#price").val();
        $.ajax({
            type: "GET",
            url: "subInventory" + "/" + bookId+"/"+inventory+"/"+price,
            dataType: "json",
            success: function (data) {
                alert(data.message);
                location.reload();
            }
        });
    }
</script>
<%--上架图书--%>
<script>
    function up(ids) {
        var up = window.confirm("您确定要上架这本书吗？");

        if (up) {
            $.ajax({
                type: "GET",
                url: "upBook" + "/" + ids,
                dataType: "json",
                success: function (data) {
                    location.reload();
                    alert(data.message);
                }
            });
        }
    }
</script>
<%--下架图书--%>
<script>
    function down(ids) {
        var down = window.confirm("您确定要下架这本书吗？");
        if (down) {
            $.ajax({
                type: "GET",
                url: "downBook" + "/" + ids,
                dataType: "json",
                success: function (data) {
                    alert(data.message);
                    location.reload();
                }
            });
        }
    }
</script>
<%--查看图书详情--%>
<script>
    function loadData(id) {
        $.ajax({
            type: "GET",
            url: "bookById?id=" + id,
            dataType: "json",
            success: function (data) {
                //result为返回值
                console.log(data);
                var $showDetail = $('#showDetail');
                var str = ' <tr>';
                str += '<td class="center" style="width: 30%;">书名</td>';
                str += '<td class="center">' + data.bookname + '</td>';
                str += '</tr>';
                str += '<tr>';
                str += '<td class="center">作者</td>';
                str += '<td class="center">' + data.author + '</td>';
                str += '</tr>';
                str += ' <tr>';
                str += '<td class="center">图书类别</td>';
                str += '<td class="center">' + data.categoryName + '读物</td>';
                str += '</tr>';
                str += ' <tr>';
                str += '<td class="center">入库价格</td>';
                str += '<td class="center">' + data.isbn + 'RMB</td>';
                str += '</tr>';
                str += ' <tr>';
                str += '<td class="center">销售价格</td>';
                str += '<td class="center">' + data.price + 'RMB</td>';
                str += '</tr>';
                str += ' <tr>';
                str += '<td class="center">图书简介</td>';
                str += '<td class="center">' + data.sellPoint + '</td>';
                str += '</tr>';


                $showDetail.html(str);
            }
        });

    }
</script>

