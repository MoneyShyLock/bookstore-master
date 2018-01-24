<%--
  Created by IntelliJ IDEA.
  User: Wee Kim Wee
  Date: 2017/12/21
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>BookStore 后台登陆</title>
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
                <i class="fa fa-database m-right-xs"></i> 书城 <strong class="text-skin">后台登录界面</strong>
            </div>

            <form>
                <div class="form-group m-bottom-md">
                    <input id="_name" name="name" type="text" class="form-control" placeholder="请输入管理员账号">
                    <span id="admin_message"></span>
                </div>
                <div class="form-group">
                    <input id="pwd" name="password" type="password" class="form-control" placeholder="请输入密码">
                </div>


                <div class="m-top-md p-top-sm">
                    <a id="signin" class="btn btn-success block" type="button">登　录</a>
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

<script>
    $('#_name')[0].focus();
    //ajax 判断账户是否已经被注册
    $('#_name').blur(function () {
        var $name = $('#_name').val();
        if($name==""||$name==null){
            $('#admin_message').html("账户不能为空").css("color","red");
            $('#_name')[0].focus();
            $('#admin_message').html("");
            return;
        }
        //解决中文乱码  前端采用js加密  后台使用loginName = java.net.URLDecoder.decode(name,"UTF-8");解密
        var login_name = encodeURI(encodeURI($name));
        $.ajax({
            type: "GET",
            url: "admin"+"/"+login_name,
            dataType: "json",
            success: function(result) {                    //result为返回值
                console.log(result);
                if(result.success){
                    $('#admin_message').html("账户不存在").css("color","red");
                    $('#_name')[0].focus();
                }else {
                    $('#admin_message').html("账户可用").css("color","green");

                }
            }
        });
    })

        $("#signin").click(function () {
            var name = $('#_name').val();
            var password = $('#pwd').val();
            // alert(name);
            // alert(password);
            $.ajax({
                type: "post",
                url: "admin/login",
                data: {
                    name: name,
                    password: password
                },
                dataType: "json",
                success: function(result) {                    //result为返回值
                    if(result.success) {
                        window.location.href = "index";
                    } else {
                        alert(result.message);
                    }
                },
                error:function () {
                    alert("服务器异常")
                }
            });
        });

</script>
</html>

