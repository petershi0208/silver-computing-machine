<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>gameSMQJ/">
    
     <title>兽魔奇迹-登录-199Y游戏</title>
    <link rel="shortcut icon" href="images/b.png" type="image/x-icon">
     <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta name="description" content="兽魔奇迹是一款西方魔幻风的MMORPG，玩家分联盟和部落两大阵营。游戏采用大地图多副本模式，副本战斗采用伙伴制,战斗模式采用即时战斗模式，打斗爽快，酣畅淋漓。">
	<meta name="Keywords" content="兽魔，魔兽，奇迹，199y，199,199y游戏，魔兽争霸，魔兽世界，放置游戏，挂机游戏">
	<link href="scrollbars/jquery.kkScroll.css" rel="stylesheet" type="text/css" />	
	<link href="css/login.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    <div class="main">
    	<div class="mainleft">
    		<div class="lgtxt"></div>
    		<div class="wlg" id="login_no">
	    		<div class="ac">用户名：<input autoComplete="off" type="text" placeholder="请输入用户名" id="username"/><br/><span style="padding-left:85px;color:red;font-size:12px;" id="usernametext"></span></div>
	    		<div class="pw">密&nbsp;&nbsp;&nbsp;码：<input autoComplete="off" type="password" placeholder="请输入密码" id="password"/><br/><span style="padding-left:85px;color:red;font-size:12px;" id="passwordtext"></span></div>
	    		<div class="yz">验证码：<input autoComplete="off" type="text" placeholder="验证码" id="code"/>
	    			<div class="yztxt"><img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/></div>
	    			<br/><span style="padding-left:85px;color:red;font-size:12px;" id="codetext"></span>
	    		</div>
	    		<div class="login" id="loginbutton">登陆游戏</div>
	    		<a id="reg" target="_blank" class="rg">免费注册</a>
    		</div>
    		<div class="ylg" id="login_yes">
    			<table width="300" height="200">
    				<tr>
    					<td width="140" align="right" class="z22">用户名：</td>
    					<td width="92" id="login_nickname" class="z23">${user.nickname}</td>
    					<td></td>
    				</tr>
    				<tr>
    					<td width="140" align="right" class="z22">最近登录服：</td>
    					<td width="92" id="login_recent" class="z23">S5 月之港口</td>
    					<input type="hidden" id="login_recentserverid"/>
    					<td></td>
    				</tr>
    				<tr>
    					<td width="140" align="right" class="z22">推荐服务器：</td>
    					<td width="92" id="login_recomend" class="z23"></td>
    					<input type="hidden" id="login_recommendserverid"/>
    					<td></td>
    				</tr>
    				<tr>
    					<td class="tc" id="login_out"><div>退出登陆</div></td>
    					<td class="gd"><a href="server.jsp" target="_blank" class="mored">服务器列表</a></td>
    					<td></td>
    				</tr>
    			</table>
    			<div class="login" id="startgame">登陆游戏</div>
    		</div>
    	</div>
    	<div class="mainright">
    		<div class="mainright_ad">
    			<div class="mainright_ad_tubiao">最新公告：</div>
    			<div class="mainright_ad_text">
    				<marquee behavior="scroll" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3" width="420" onmouseover="this.stop();" onmouseout="this.start();"> 
						欢迎加入官方199Y玩家交流群391504664
					</marquee>
    			</div>
    		</div>
    	</div>
    	<div></div>
    	<div></div>
    	<div></div>
    </div>
    <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
