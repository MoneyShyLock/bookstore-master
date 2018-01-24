<%--
  Created by IntelliJ IDEA.
  User: Shen
  Date: 2018/1/11
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="css/lanrenzhijia.css" type="text/css" rel="stylesheet" />
<div id="lanrenzhijia">
    <ul class="jd_menu" id="lanren_nav">
        <li><a href='protal'>首页</a></li>
        <li><a href='cart'>我的购物车</a></li>
        <li><a href='#'>我的订单</a></li>
        <li><a href='#'>个人中心</a></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <c:if test="${session_User == null}">
            <li><a href='toLoginProtal'>登陆</a></li>
            <li><a href='register' >注册</a></li>
        </c:if>
        <c:if test="${session_User !=null}">
            <li>欢迎您: ${session_User.username}</li>
            <li><a href='user_logout' >退出</a></li>
        </c:if>
    </ul>
</div>
