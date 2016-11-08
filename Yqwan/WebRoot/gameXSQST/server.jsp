<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>选择服务器</title>
    <link rel="shortcut icon" href="http://static.86joy.com/game/xs/images/favicon.ico" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="<%=request.getContextPath()%>/gameXSQST/scrollbars/jquery.kkScroll.css" rel="stylesheet" type="text/css" />

	<link href="<%=request.getContextPath()%>/gameXSQST/css/server.css" rel="stylesheet" type="text/css" />
	

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
    			<div class="h16b dlgtxt">我登录过的服务器</div>
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
 <%--  				<div class="server3"><a class="qm">S1 月之港口</a><div class="hot"></div></div>
    				<div class="server3"><a class="qm">S1 月之港口</a><div class="huo"></div></div> --%> 
    			</div>
    		</div>
    	</div>
    </div>
   <jsp:include page="foot.jsp"></jsp:include>
	<script language='javascript' src='<%=request.getContextPath()%>/gameXSQST/scrollbars/jquery.mousewheel.js'></script>
	<script language='javascript' src="<%=request.getContextPath()%>/gameXSQST/scrollbars/jquery.kkScroll.js"></script>
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
