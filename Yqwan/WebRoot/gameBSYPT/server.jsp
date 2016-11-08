<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
      <title>宝石与爬塔-选择服务器-199Y游戏</title>

    <link rel="shortcut icon" href="gameBSYPT/images/b.jpg" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="宝石与爬塔,玩法简单,乐趣无穷,消灭敌人">
	<meta http-equiv="description" content="宝石与爬塔是一款挂机放置类游戏，玩家可以通过不断升级自己的勇士与英雄，消灭层层出现的敌人，闯入更高的关卡。 各种华丽的武器装备能为您的武将提供大量的增益，玩法简单乐趣无穷">
	<link href="<%=request.getContextPath()%>/gameBSYPT/scrollbars/jquery.kkScroll.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/gameBSYPT/css/server.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    <div class="main">
    	<div class="top"></div>
    	<div class="content">
    		<div class="dc" id="server_yes">
    			<div class="dcleft" id="server_nickname">账户名：${user.nickname }</div>
    			<div class="dcright"><a id="server_out">登出</a></div>
    		</div>
    		<div class="dlzc" id="server_no">
    			<span class="dcleft">账户：<input type="text" name="" class="name" id="username"/></span>
    			<span class="dcright">密码：<input type="password" name="" class="password" id="password"/></span>
    			<span class="dl" id="serverbutton"></span>
    			<span class="zc"><a id="reg" target="_blank">免费注册</a></span>
    		</div>
    		<div class="dlg">
    			<div class="h16b dlgtxt"></div>
    			<div class="wdl" id="server_not">您还尚未登录</div>
    			<div class="ydl" id="server_recent"><a class="qm"></a></div>
    			<input type="hidden" id="server_recentserverid"/>
    		</div>
    		<div class="recommend">
    			<div class="h16b tuijian"></div>
    			<div class="server">
    				<div class="server3"><a class="qm" id="server_recommend"></a></div>
    				<input type="hidden" id="server_recommendserverid"/>
    			</div>
    		</div>
    		<div class="allserver">
    			<div class="h16b tuijian"></div>
    			<div class="server" id='Demo'>
 <%--   			<div class="server3"><a class="qm">S1 月之港口</a><div class="hot"></div></div>
    				<div class="server3"><a class="qm">S1 月之港口</a><div class="huo"></div></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div> --%>
    			</div>
    		</div>
    	</div>
    </div>
   <jsp:include page="foot.jsp"></jsp:include>
	<script language='javascript' src='<%=request.getContextPath()%>/gameBSYPT/scrollbars/jquery.mousewheel.js'></script>
	<script language='javascript' src="<%=request.getContextPath()%>/gameBSYPT/scrollbars/jquery.kkScroll.js"></script>
	<script>
	$(document).ready(function(){
		setTimeout(function(){
			var a = $("#Demo").children(".server3").length;				
			if(a>12){
				$("#Demo").getScrollbar();
			}
		},100);			
	});
	</script>
  </body>
</html>
