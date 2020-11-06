<!DOCTYPE html>
<html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <title></title>
</head>
<body>
我是页面web1
<button type="button" id="getdata">点我ajax请求主页面数据</button><br/>
<button type="button" id="loginout">点我退出到登陆页面</button><br/>
<script type="text/javascript" src="../jquery-2.1.0.js" ></script>
<script>
    $("#getdata").on('click',function(e){
        $.ajax({
            type:"get",
            dataType:"json",
            url:"/getInfo1",
            headers:{
                token:localStorage.getItem("token")//将token放到请求头中
            },
            success:function(resp){
                alert(resp.msg);
                if(resp.success){
                    $('body').append(JSON.stringify(resp.data));
                }
            }
        });
    });

    $("#loginout").on("click",function(){
        localStorage.removeItem("token");
        location.href="login.html";
    });
</script>
</body>
</html>
