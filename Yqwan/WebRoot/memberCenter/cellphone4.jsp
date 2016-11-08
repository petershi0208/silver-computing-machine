<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>会员中心-手机绑定</title> 
    <link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/memberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/bootstrap.min.css">
    <!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/cellphone.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/memberhead.css">
  </head>
  <body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="banner"></div>
	<div id="content">
		<div class="content_right">
			<jsp:include page="memberright.jsp"></jsp:include>
		</div>
		<div class="content_left">
			<jsp:include page="memberhead.jsp"></jsp:include>
			<div class="tell">
				<div class="top">
					<span  class="bdsj">绑定手机账号</span> &nbsp;|&nbsp; <span class="jbsj">解绑手机账号</span>
				</div>			
				<div class="tell4">
					<div class="marg">
						<div class="jb">确认解绑</div>
						<div class="yz">安全验证</div>
					</div>
					<div class="succ"><img src="<%=request.getContextPath()%>/memberCenter/images/cellphone/shoujizhanghaobangchenggong.png" />手机账号解绑成功！</div>
				</div>			
			</div>
		</div>
	</div>	
	<jsp:include page="../foot.jsp"></jsp:include>
	<script src="<%=request.getContextPath()%>/memberCenter/js/cellphone.js" type="text/javascript"></script>
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>