<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>会员中心-邮箱修改</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/memberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/memberCenter/js/modifyemail.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/bootstrap.min.css">
    <!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/modifyemail.css">
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
			<div class="modifyemail">
				<div class="top">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/landian.png" />绑定邮箱<span  class="bh">保护您的账号安全是我们一直坚持和努力的方向</span>
				</div>
				<div class="modifyemail2">
					<div class="marg">
						<div class="sz">设置邮箱地址</div>
						<div class="sq">收取激活邮件</div>
						<div class="bd">修改成功</div>
					</div>
					<div class="srtext"><span>当前绑定邮箱:</span><input type="text" value="${user.email}" style="border:none;" readonly="readonly"/></div>
					<div class="srtext">
						<span> 重新绑定邮箱:</span>
						<input type="text" id="modifyemailtwo"/>
						<input name="send" id="send" value="发送邮件" style="cursor:pointer;width:110px;" type="button">
						<span style="color:red" id="modifyemailtwotext"></span>
					</div>
					<div class="srtext"><span> 确认验证码:&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<input type="text" id="modifytwocode"/>
						<span id="modifytwocodetext" style="color:red;"></span>
					</div>
					<div class="qr2" id="modifymailtwobtn">确认</div>
				</div>
			</div>
		</div>	
	</div>	
	<jsp:include page="../foot.jsp"></jsp:include>
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>