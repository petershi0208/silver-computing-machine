<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>gameCQSJ/">
    
    <title>199Y-传奇世界</title>
    <link rel="shortcut icon" href="http://www.199y.com/picture/yqwan/game/cqsj/cc1.png" type="image/x-icon">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="传奇，热血传奇，传奇世界，私服，传世，传奇霸业，副本，砍怪，挂机，自动升级，秒杀，礼包，法师，道士，武士，奖励,199,199y,9游戏,199游戏,9y游戏,199y游戏">
	<meta name="description" content="《传奇世界H5》是由盛大唯一正版授权，蝴蝶互动倾力打造并发行的首款《传奇世界》Html 5游戏。游戏以可视化挂机为核心玩法，百分百还原了《传奇世界》的核心精髓，同时结合Html 5特性，使得玩家无需下载客户端点击即玩！">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<body>
	
		<jsp:include page="head.jsp"></jsp:include>
	<div class="main">
		<div>
			<jsp:include page="left.jsp"></jsp:include>
			<div class="maright">
				<div style="height:286px;"></div>
				<div class="system">
					
				</div>
				<div class="newthree">
					<a href="http://cqsj.199y.com" target="_blank"><span>新服活动</span></a>
					<a href="http://cqsj.199y.com" target="_blank"><span>游戏系统</span></a>
					<a href="http://cqsj.199y.com" target="_blank"><span>新手常见问题</span></a>
				</div>
			</div>
		</div>
		<div class="mainbom">
			<div class="loop">
				<img src="images/login/tu002.png" />
			</div>
			<div class="news">
				<div class="newstop">
					<a id="a1" class="zh act">最新</a>
					<a id="a2" class="xw">新闻</a>
					<a id="a3" class="hd">活动</a>
					<a id="a4" class="wf">玩法</a>
					
				</div>
				<div id="ua1" class="newstitle"></div>
				<div id="ua2" class="newstitle"></div>
				<div id="ua3" class="newstitle"></div>
				<div id="ua4" class="newstitle"></div>
				
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/jquery.md5.js"></script>
</body>
</html>