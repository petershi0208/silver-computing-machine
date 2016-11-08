<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>游戏更多-199y游戏</title>  
   		<meta name="keywords" content="游戏,更多游戏,199y游戏">
		<meta name="description" content="199y游戏更多游戏">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" ></script>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/moreGame/moreGame.css"/>
		<script type="text/javascript" src="<%=request.getContextPath()%>/moreGame/moregame.js" ></script>
	</head>
  
	<body>
		<input type="hidden" value='${list1}' id="list"/>
		<input type="hidden" value="${gametype}" id="gametype">
		<input type="hidden" value="${placetype}" id="placetype">
		<div class="headborder">
    		<jsp:include page="head.jsp"/>
    	</div>
    	<div class="morebg"></div>
    	<div class="center">
    		<p class="centerp">
  				<img src="giveDetail/fangzi-.png"/>
  				<span id="moregamefrom">${from}</span>
  				<span>&gt;</span>
  				<span>${gametype }</span>
  			</p>
  			<div class="centerpic" id="centerpic">
			
  			</div>
  			<div class="fanye" id="fenye">
  			<input type="hidden" value="${maxnum }" id="maxnum">
  			<input type="hidden" value="${page }" id="page">
				<div class="nice" id="nice">					
					<span>首页</span>
					<span class="zuo"><img src="giveDetail/iconfont-jiantou.png" /></span>
					<span>1</span>
					<span>2</span>
					<span>3</span>
					<span>4</span>
					<span>5</span>
					<span class="you"><img src="giveDetail/iconfont-jiantou_57.png" /></span>
					<span>尾页</span>
				</div>
				<input type="hidden" id="hiddenpage">
			</div>
			<div class="fanye" id="fenyeshow" style="display:none;">
			</div>
    	</div>
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>
