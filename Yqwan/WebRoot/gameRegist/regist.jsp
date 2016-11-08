<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">

    <head>

        <meta charset="utf-8">
        <title>199Y-手机注册</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- CSS -->
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/regist.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body>
    	<div class="head">
 			<img src="img/wlogo.png"/>					
 		</div>
        <div class="regist-container container">
            <div class="row">
                <div class="regist">
                    <form action="http://www.199y.com" method="post">
                        <label for="userid">账号</label>
                        <input type="text" id="userid" name="userid" placeholder="输入你的账号...">
                        <label for="password">输入密码</label>
                        <input type="password" id="password" name="password" placeholder="输入你的密码...">
                         <label for="password1">确认密码</label>
                        <input type="password" id="password1" placeholder="确认你的密码...">
                        
                        <label for="code">验证码</label>
                        <input type="text" id="code" name="code" placeholder="输入右侧验证码...">
                        <img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/>
                  		<button type="submit" id="registbutton">注册游戏</button>   
                    </form>
                </div>
            </div>
        </div>
 		<div class="foot">
 			<div class="foot_logo">
 				<img src="img/wlogo.png"/>
 				<img src="img/glogo.png"/>
 			</div>
 			<div class="foot_kouhao">
 				<span>世界需要游戏,你需要我们</span><br/>
 				<span>World needs games,you need us</span>
 			</div>
 		</div> 
        <!-- Javascript -->
        <script src="js/jquery-1.8.2.min.js"></script>
        <script src="js/jquery.md5.js"></script>
        <script src="js/regist.js"></script>	
	</body>
</html>