<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh">
    <head>
	<base href="<%=basePath%>gameRXQQ/phoneLogin/">
        <meta charset="utf-8">
        <title>热血球球-登录</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=PT+Sans:400,700'>
        <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Oleo+Script:400,700'>
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>
   		<div id='wx_pic' style='margin:0 auto;display:none;'>
			<img src='http://www.199y.com/picture/yqwan/201607/qiuqiu.jpg' />
		</div>
    <input type="hidden" value="${user.userid}" id="login_userid"/>
        <div class="login-container container">
            <div class="row">
                <div class="login">
                    <div id="form">
                        <label for="userid">账号</label>
                        <input type="text" id="userid" name="userid" placeholder="输入你的账号...">
                        <label for="password">密码</label>
                        <input type="password" id="password" name="password" placeholder="输入你的密码...">
                  		<button type="button" id="registbutton">注册游戏</button>   
						<button id="loginbutton">登录游戏</button>
                    </div>
                </div>
            </div>
        </div>
 		<div class="foot">
 			<div class="foot_logo">
 				<img src="assets/img/wlogo.png"/>
 				<img src="assets/img/glogo.png"/>
 			</div>
 			<div class="foot_kouhao">
 				<span>世界需要游戏,你需要我们</span><br/>
 				<span>World needs games,you need us</span>
 			</div>
 		</div> 
        <!-- Javascript -->
        <script src="assets/js/jquery-1.8.2.min.js"></script>
        <script src="assets/js/jquery.md5.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>        
        <script src="assets/js/login.js"></script>	
	</body>
</html>