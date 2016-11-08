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
				<div class="modifyemail1" style="overflow:hidden;">
					<table>
						<tr>
							<td width="140" rowspan="3"><img src="<%=request.getContextPath()%>/memberCenter/images/modifyemail/youxiangbangding1.png" width="112" height="131" /></td>
							<td height="24" style="font-size:24px;">绑定邮箱:</td>
							<td></td>
						</tr>
						<tr>
							
							<td height="14">快速找回您的密码</td>
							<td></td>
						</tr>
						<tr>
							
							<td valign="bottom" width="320">您已经绑定了邮箱：${user.email }</td>
							<td valign="bottom"><div class="qr1" onclick="javascript:href=window.location.href='memberCenter/modifyemail2.jsp'">修改绑定邮箱</div></td>
						</tr>
					</table>					
				</div>
			</div>
		</div>		
	</div>	
	<jsp:include page="../foot.jsp"></jsp:include>
  </body>
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>