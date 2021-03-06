<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Wee Kim Wee
  Date: 2017/12/22
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>BookStore Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Bootstrap core CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <!-- ionicons -->
    <link href="css/ionicons.min.css" rel="stylesheet">

    <!-- Simplify -->
    <link href="css/simplify.min.css" rel="stylesheet">

</head>

<body class="overflow-hidden light-background">
<div class="wrapper no-navigation preload">
    <div class="sign-in-wrapper">
        <div class="sign-in-inner">
            <div class="login-brand text-center">
                 BookStore <strong class="text-skin">新增普通管理员</strong>
            </div>

            <form id="register_form">
                <div class="form-group m-bottom-md">
                    <input id="registerAdmin" type="text" class="form-control" placeholder="请输入要注册的账户">
                    <span id="admin_message"></span>
                </div>
                <div class="form-group">
                    <input id="_password" type="password" class="form-control" placeholder="请输入密码">
                    <span id="pwd_message"></span>
                </div>

                <div class="m-top-md p-top-sm">
                    <a id="create_btn" class="btn btn-success block">确认创建</a>
                </div>


            </form>
        </div><!-- ./sign-in-inner -->
    </div><!-- ./sign-in-wrapper -->
</div><!-- /wrapper -->

<a href="" id="scroll-to-top" class="hidden-print"><i class="icon-chevron-up"></i></a>

<!-- Le javascript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->

<!-- Jquery -->
<script src="js/jquery-1.11.1.min.js"></script>

<!-- Bootstrap -->
<script src="bootstrap/js/bootstrap.min.js"></script>

<!-- Slimscroll -->
<script src='js/jquery.slimscroll.min.js'></script>

<!-- Popup Overlay -->
<script src='js/jquery.popupoverlay.min.js'></script>

<!-- Modernizr -->
<script src='js/modernizr.min.js'></script>

<!-- Simplify -->
<script src="js/simplify/simplify.js"></script>

</body>

</html>
<script>
    $('#registerAdmin')[0].focus();
    //ajax 判断账户是否已经被注册
    $('#registerAdmin').blur(function () {
        var $registerAdmin = $('#registerAdmin').val();
        if($registerAdmin.length==0){
            $('#admin_message').html("账户不能为空").css("color","red");
        }
        if($registerAdmin==""||$registerAdmin==null){
            $('#admin_message').html("账户不能为空").css("color","red");
            $('#registerAdmin')[0].focus();
            $('#admin_message').html("");
            return;
        }
       //解决中文乱码  前端采用js加密  后台使用loginName = java.net.URLDecoder.decode(name,"UTF-8");解密
        var register_name = encodeURI(encodeURI($registerAdmin));
        $.ajax({
            type: "GET",
            url: "admin"+"/"+register_name,
            dataType: "json",
            success: function(result) {                    //result为返回值
                console.log(result);
                if(result.success){
                    $('#admin_message').html(result.message).css("color","green");
                }else {

                    $('#admin_message').html(result.message).css("color","red");
                    $('#registerAdmin')[0].focus();
                }
            }
        });
    })

    $('#_password').blur(function () {
        //判断密码是否合法以及两次输入密码是否一致
        var $pwd = $('#_password').val();
        if($pwd==""||$pwd==null){
            $('#pwd_message').html("密码不能为空").css("color","red");
            $('#pwd_message')[0].focus();
            $('#pwd_message').html("");
            return;

        }
    })


    //创建账户

    $('#create_btn').click(function () {
        var $registerAdmin = $('#registerAdmin').val();
        var $pwd = $('#_password').val();

        $.ajax({
            type: "post",
            url: "admin",
            data: {
                name: $registerAdmin,
                password: $pwd,
            },
            dataType: "json",
            success: function(result) {                    //result为返回值

                if(result.success){
                    alert(result.message+"点击确定跳转到登录界面");
                    window.location.href="toLogin";
                }
            }
        });
    })
</script>

