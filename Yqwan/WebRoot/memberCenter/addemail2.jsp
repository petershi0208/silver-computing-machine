<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员中心-邮箱绑定</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/memberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/memberCenter/js/addemail.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/bootstrap.min.css">
    <!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/addemail.css">
  </head>
  <body>
  	<input type="hidden" value="${email}" id="addmailtwoemail"/>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="banner"></div>
	<div id="content">
		<div class="content_right">
			<jsp:include page="memberright.jsp"></jsp:include>
		</div>
		<div class="content_left">
			<jsp:include page="memberhead.jsp"/>
			<div class="addemail">
				<div class="top">
					<img src="../memberCenter/images/member/landian.png" />绑定邮箱<span  class="bh">保护您的账号安全是我们一直坚持和努力的方向</span>
				</div>
				<div class="addemail2">
					<div class="marg">
						<div class="sz">设置邮箱地址</div>
						<div class="sq">收取激活邮件</div>
						<div class="bd">绑定成功</div>
					</div>
					<div class="qrtext">您的邮箱将受到一封账号绑定确认邮件，请查收并按照<br/>邮箱提示输入验证码，完成绑定</div>
					<div class="fsyz">
						<span>验证码：</span>
						<input type="text" id="addmailtwo"/>
						<span style="color:red;" id="addmailtwotext"></span>
					</div>
					<div class="qr2" id="addmailtwobtn">确认</div>
				</div>
			</div>
		</div>
	</div>	
	<jsp:include page="../foot.jsp"></jsp:include>
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>
