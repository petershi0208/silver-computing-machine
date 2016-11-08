<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>支付成功-199y游戏</title>
   		<meta name="keywords" content="199y游戏">
   		<meta name="description" content="199y游戏">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/regist/jquery-1.7.1.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">   
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/base.css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/newMemberCenter/css/paysuccess.css"/>
	</head>
  
	<body>
    	<jsp:include page="../head.jsp"></jsp:include>
    	<div class="center">
			<div class="center_text"><span>返回会员中心</span></div>
			<div class="center_info">
				<div class="center_info_img">
					<img src="/Yqwan/newMemberCenter/images/czwc.png"/>
					<span>恭喜您,支付成功!</span>
				</div>
				<div class="center_info_to">
					<span>现在您可以：</span>
					<span><a href="/Yqwan/totradelist.do">查看充值记录</a></span>
					<span>或</span>
					<span><a href="/Yqwan/recharge.do">返回充值中心</a></span>
				</div>
			</div>
		</div>
    	<jsp:include page="../foot.jsp"></jsp:include>
	</body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>
