<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("path", request.getContextPath());
    pageContext.setAttribute("basePath",request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://cdn.bootcss.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <title>学籍管理系统</title>
</head>
<body>




<div class="container " style="margin-top:100px">
    <h2 class="text-center">学籍管理系统</h2>

    <div class="col-md-5 mx-auto">

        <form id="loginForm" onsubmit="return false" action="#" method="post">

            <div class="form-group">
                <input id="username" type="text" name="username" class="form-control" placeholder="用户名">
                <span id="alertUsername" style="color:red;"></span>
            </div>

            <div class="form-group">
                <input id="password" type="password" name="password" class="form-control" placeholder="密码">
                <span id="alertPassword" style="color:red;"></span>
            </div>

            <span id="alertFailure" style="color:red;"></span>
            <button id="loginButton" class="btn btn-primary btn-lg btn-block" >登录</button>

        </form>


    </div>


</div>



<!-- JavaScript -->
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>


<script>

    /**
     * 验证账号密码是否为空，并且通过ajax的方式响应服务器的信息，进行页面跳转或是提示登录失败
     */
    $(function(){

        $("#loginButton").click(function () {

            $("#alertFailure").text("");

            var username = $("#username").val();
            var password = $("#password").val();

            if(username == null || username == ""){
                $("#alertUsername").text("请输入用户名");
            }else{
                $("#alertUsername").text("");
            }

            if(password == null || password == ""){
                $("#alertPassword").text("请输入密码");
            }else{
                $("#alertPassword").text("");
            }

            var login = {username:username,password:password};

            if(username !=null && username != "" && password !=null && password != ""){

                $.ajax({
                    url:"${path}/login/toLogin",
                    type:"POST",
                    data:JSON.stringify(login),
                    contentType:"application/json",
                    success:function(result){

                        console.log(result);
                        if(result != null && result != ""){
                            // 虽然jackson返回的json没问题，但是到result有问题
                            var json = $.parseJSON(JSON.stringify(result));
                            var login = json.login;
                            $("#alertFailure").text(login);

                            var url = json.url;
                            if(url != null && url != ""){
                                window.location.href = "${basePath}${path}"+url;
                            }

                        }
                    }

                });

            }

        });

    });

</script>

</body>
</html>