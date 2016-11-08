<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>gameJDZSSEED/">
    
      <title>机动战士SEED-选择服务器-199Y游戏</title>

    <link rel="shortcut icon" href="images/b.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="高达、机动战士、seed、高达seed、机动战士seed、基拉、基拉·大和、阿斯兰、拉克丝、自由、强袭自由、圣盾、强袭、strike、freedom、正义、无限正义、justice、自由高达、强袭自由高达、圣盾高达、强袭高达、正义高达、无限正义高达、扎夫特、哈罗">
	<meta name="description" content="《SD高达》是一款以为高达Seed为背景的回合制RPG+SNS网页游戏，游戏极度简化了玩家的操作，以高达机体的收集、强化；基地的升级建设；副本推图为核心乐趣。">
	<link href="css/server.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    <div class="main">
    	<div class="malf">
    		<div class="lgtxt">登陆游戏</div>
    		<div class="dc" id="server_yes">
	    		<div class="dcleft" id="server_nickname">账户名：${user.nickname }</div>
	    		<div class="dcright"><a id="server_out">登出</a></div>
	    	</div>
	    	<div class="dlzc" id="server_no">
	    		<span style="display: block;" class="dcleft">账户：<input type="text" name="" class="name" id="username"/></span>
	    		<span style="display: block;" class="dcright">密码：<input type="password" name="" class="password" id="password"/></span>
	    		<span style="display: block;" class="dl" id="serverbutton">游戏登陆</span>
	    		<span style="display: block;" class="zc"><a id="login_regist" target="_blank">免费注册</a><a href="http://www.199y.com/Yqwan/forgetOne.jsp" target="_blank">忘记密码</a></span>
	    	</div>
	    	<div class="divnews"><div class="divtit">新闻</div></div>
	    	<div class="mc3">
	        	<div><img src="http://www.199y.com/picture/yqwan/game/jdzsseed/xiao.png" width="24" height="24" /><span>互动专区</span></div>
	        	<div><img src="http://www.199y.com/picture/yqwan/game/jdzsseed/ma.png" style="padding-top: 10px;" width='120' height='120'/></div>
	        	<div>199y公众号</div>
	        	<div><a href="http://jq.qq.com/?_wv=1027&k=2GfRoyD"><img src="http://www.199y.com/picture/yqwan/game/jdzsseed/zxkf.png" /></a></div>
	        	<div>QQ群：485799008</div>
	        	<div>客服电话：021-21028162</div>
	        </div>
    	</div>
    	<div class="mamr">
	    	<div class="content">
	    		<div class="dlg">
	    			<div class="h16b dlgtxt">最近登陆过的服务器</div>
	    			<div class="wdl" id="server_not">您还尚未登录</div>
	    			<div class="ydl" id="server_recent"><a class="qm"></a></div>
	    			<input type="hidden" id="server_recentserverid"/>
	    		</div>
	    		<div class="recommend">
	    			<div class="h16b tuijian">推荐服务器</div>
	    			<div class="server">
	    				<div class="server3"><a class="qm" id="server_recommend"></a></div>
	    				<input type="hidden" id="server_recommendserverid"/>
	    			</div>
	    		</div>
	    		<div class="allserver">
	    			<div class="h16b tuijian">所有服务器列表</div>
	    			<div class="server" id='Demo'>
	   					
	    			</div>
	    		</div>
	    	</div>
    	</div>
    </div>
   <jsp:include page="foot.jsp"></jsp:include>
	<script language='javascript' src='scrollbars/jquery.mousewheel.js'></script>
	<script language='javascript' src="scrollbars/jquery.kkScroll.js"></script>
	<script>
	$(document).ready(function(){
		setTimeout(function(){
			//$("#Demo").getScrollbar({direction:"left"});
			var a = $("#Demo").children(".server3").length;				
			if(a>15){
				$("#Demo").getScrollbar();
			}
		},100);			
	});
	</script>
  </body>
</html>
