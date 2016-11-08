<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>gameLJSG/">
    
    <title>199Y-龙降三国</title>
    <link rel="shortcut icon" href="http://www.199y.com/picture/yqwan/game/ljsg/lj.png" type="image/x-icon">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="三国,三国之怒,三国志9,三国志10,三国志11,三国志12,三国志13,热血传奇,大皇帝,传奇,关羽,张飞,吕布,热血PK,PK,貂蝉,小乔,赵云,三国演义,新三国,怒三国,三国志,真三国无双,三国杀,三国女志,三国之志,199,199y,9游戏,199游戏,9y游戏,199y游戏">
	<meta name="description" content="《龙降三国》是一款写实风格的三国策略卡牌手游。三个国家特点鲜明各有千秋，为您展现景区级的场景画面以及酷炫带感的角色造型,游戏里霸气精美的卡牌人物，华丽的技能特效，史诗般的场景和画面，致力于打造次时代的手游美术品质。气势磅礴的万人国战，极高策略性的副本关卡让你欲罢不能！更能与数千玩家同战沙场。">
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
					<a href="http://ljsg.199y.com" target="_blank"><span>新服活动</span></a>
					<a href="http://ljsg.199y.com" target="_blank"><span>游戏系统</span></a>
					<a href="http://ljsg.199y.com" target="_blank"><span>新手常见问题</span></a>
				</div>
			</div>
		</div>
		<div class="mainbom">
			<div class="loop">
				<img src="http://www.199y.com/picture/yqwan/game/ljsg/tu002.png" />
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
	<div style="width:122px;height:122px;position:absolute;left:50%;top:150px;margin-left:-470px;background:url(http://www.199y.com/picture/yqwan/game/ljsg/logo.png) center"></div>
	<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/jquery.md5.js"></script>
</body>
</html>