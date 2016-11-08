<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh">

    <head>
		<base href="<%=basePath%>gameMHJY/phoneLogin/">
        <meta charset="utf-8">
        <title>梦幻家园-选择服务器</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- CSS -->
        <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->

    </head>

    <body class="serverbody">
    <input type="hidden" value="${user.userid}" id="server_userid"/>
        <div class="mycontainer">
            <div class="row row3">
            	<div class="row1 row3bg" id="latestregionbutton">
            		<input type="hidden" id="latestserverid">
            		<span id="latestregion"></span>
            		<span style="position:relative;left:5px;">(最近登录服务器)</span>
            	</div>
            </div>
            
            <div class="row row2" id="Demo">
<!--           	<div class="row1">S1天空之城</div>
            	<div class="row1">S1天空之城</div>
            	<div class="row1">S1天空之城</div>
            	<div class="row1">S1天空之城</div>
            	<div class="row1">S1天空之城</div>  --> 
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
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.backstretch.min.js"></script>
        <script src="assets/js/server.js"></script>	
        
        <script src="https://cdn.bootcss.com/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>
		<script type="text/javascript">
			var window1 = $(window).width();
			if(window1>1000){
				$("#Demo").niceScroll({scrollspeed:"80",zIndex:"9999",cursorcolor:"#ccc"});
				$("#Demo").niceScroll("#wrapperdiv",{cursorcolor:"#ccc"});
			}
		</script>
	</body>
</html>