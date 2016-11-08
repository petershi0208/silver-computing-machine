<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>敬请期待</title>  
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=10"> 
		<meta name="keywords" content="199Y游戏,放置游戏,挂机游戏,游戏平台,IOS放置,安卓放置,苹果放置,PC放置,电脑放置,独立开发,独立开发游戏">
		<meta name="description" content="199Y游戏是国内第一家最全面内容最多的放置挂机等类型游戏平台，ZombieMonkey工作室旗下平台。欢乐游戏，快乐生活，就上199Y！">
		
	</head>
	<body>
		<jsp:include page="head.jsp"></jsp:include>
		<div class="center">
			<div class="center_text">
				<span>游戏未开放···敬请期待！</span>
				<div class="center_btnleft"><a href="javascript:history.back(-1)">返回上一页</a></div>
				<div class="center_btnright" onclick="javascript:window.location.href='';">刷新试试</div>
			</div>
		</div>
		<jsp:include page="foot.jsp"></jsp:include>
	</body>
	
	<style type="text/css">
		body{background:url(newindex/niao.png) top 180px center no-repeat rgb(175,226,255)}
		.center{width:100%;height:670px;}
		.center_text{width:500px;height:100px;margin:0 auto;color:#fff;font-size:30px;letter-spacing:8px;text-align:center;position:relative;top:500px;left:20px;}
		.center_text span{display:block;}
		.center_btnleft{width:170px;height:40px;float:left;cursor:pointer;font-size:20px;letter-spacing:3px;background:#09f;border-radius:5px;position:relative;top:20px;left:60px;text-align:center;line-height:40px;}
		.center_btnleft a{color:#fff;text-decoration:none; }
		.center_btnright{width:170px;height:40px;float:right;cursor:pointer;font-size:20px;letter-spacing:3px;background:#09f;border-radius:5px;position:relative;top:20px;left:-80px;text-align:center;line-height:40px;}
	</style>
</html>
