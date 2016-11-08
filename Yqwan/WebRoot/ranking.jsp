<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>排行-199y游戏网</title>
    <meta name="keywords" content="游戏,游戏网,游戏排行">
    <meta name="description" content="199y游戏排行">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" ></script>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="css/ranking.css">
<style>

</style>
</head>
<body>
	 <div id="nav">
		<jsp:include page="head.jsp"></jsp:include>
	</div>
	<div id="banner"></div>
	<div id="content">
		<div class="ranking_title">
			<ul>
				<li><img src="images/ranking/biaoshengbang.jpg" width="204" height="93" /></li>
				<li><img src="images/ranking/pingfenbang.jpg" width="204" height="93" /></li>
				<li><img src="images/ranking/xiazaibang.jpg" width="204" height="93" /></li>
				<li class="b4"><img src="images/ranking/xinruibang.jpg" width="204" height="93" /></li>
			</ul>
		</div>
		<div class="top1">
			<div style="height:235px; width:1000px; overflow:hidden;">
				<div class="left"><img src="images/ranking/fengyunbang.jpg" width="488" height="235" /></div>
				<div class="left zuoc">
					<div class="gamecontent left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gamecontent left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gamecontent left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gamecontent left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
				</div>
			</div>
			<div class="findby">
				<div class="findb">
					<span class="qb">全部</span>
					<span class="rm">热门</span>
					<span class="zx">最新</span>
				</div>
				<div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
					<div class="gameqb left">
						<span class="left gameimg"><img src="images/ranking/JINGPINYOUXIWU.jpg" height="98" width="100"/></span>
						<span class="gamename">乔峰转</span><br/>
						<span class="gametype">类别：单机类游戏</span><br/>
						<span class="gamejj">游戏简介：《乔峰转》正宗金庸武侠类大作</span>
						<span class="gogame"><img src="images/ranking/JINGPINYOUXIANNIUDA.png" height="28" width="80"/></span>
						<img src="images/ranking/SHOUYEANZHUOLV.jpg" style="z-index:0; position:relative;  left:89px; top:-96px;" />
					</div>
				</div>
				<div class="fanye">
					<div class="nice">
						<span>首页</span>
						<span class="zuo"><img src="images/codecentre/iconfont-jiantou.png" /></span>
						<span>1</span>
						<span>2</span>
						<span>3</span>
						<span>4</span>
						<span>5</span>
						<span class="you"><img src="images/codecentre/iconfont-jiantou_57.png" /></span>
						<span>尾页</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>
