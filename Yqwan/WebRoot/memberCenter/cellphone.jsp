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
	<script src="<%=request.getContextPath()%>/memberCenter/js/cellphone.js" type="text/javascript"></script>
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
				<div class="tell1">
					<div class="marg">
						<div class="jb">确认解绑</div>
						<div class="yz">安全验证</div>
					</div>
					<p>注意:解绑手机将会极大程度的降低您的账号安全</p>
					<br/>
					<input type="text" placeholder="请填写您的密保手机号码,以确认本人操作" id="telephoneone"/>
					<span style="position:relative;top:10px;color:red;" id="telephoneonetext"></span>
					<div class="qr1" id="telephoneonebtn">确认</div>
				</div>
			</div>
		</div>
	</div>	
	<jsp:include page="../foot.jsp"></jsp:include>
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>