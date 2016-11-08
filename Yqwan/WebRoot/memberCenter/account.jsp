<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>账户中心</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/memberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/memberCenter/js/account.js" type="text/javascript"></script>
    <!-- Bootstrap -->	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/account.css">
  </head>
  <body>
  	<input type="hidden" value="${user.realname}" id="realnameaccount">
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
			<div class="account">
				<div class="top">
					<img src="../memberCenter/images/member/landian.png" height="7" width="7" />
					账号中心
				</div>
				<div class="centre1">
					<table>
						<tr>
							<td width="130">账号状态</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>当前头像</td>
							<td width="263"><img src="../memberCenter/images/member/touxiang.png" width="67" height="67" /></td>
							<td><span onclick="javascript:alert('目前未开放');">修改头像</span></td>
						</tr>
						<tr>
							<td>用户名</td>
							<td>${user.userid}</td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="centre2">
					<table>
						<tr height="30">
							<td width="130">账号资料状态</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td width="263"><img src="../memberCenter/images/member/iconfont-bi.png" width="67" height="67" /></td>
							<td class="middle">
								这有助于您的账户安全和参与我们的活动<br />
								<span><a href="memberCenter/member.jsp">完善账号资料</a></span>
							</td>
						</tr>
					</table>
				</div>
				<div class="centre3">
					<table>
						<tr height="30">
							<td width="130">安全邮箱状态</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td width="263"><img src="../memberCenter/images/member/youxiang.png" width="67" height="67" /></td>
							<td class="middle" id="middle">${user.email}</td>
						</tr>
					</table>
				</div>
				<div class="centre4">
					<table>
						<tr height="30">
							<td width="130">密码提示问题状态</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td width="263"><img src="../memberCenter/images/member/wenhaotubiao.png" width="67" height="67" /></td>
							<td class="middle">
								这有助于您的账户安全和参与我们的活动<br />
								<span onclick="javascript:alert('目前未开放');">设置密码提示问题</span>
							</td>
						</tr>
					</table>
				</div>
				<div class="centre5">
					<table>
						<tr height="30">
							<td width="130">实名认证状态</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td width="263"><img src="../memberCenter/images/member/shimingrenzheng_1.png" width="67" height="67" /></td>
							<td class="middle" id="middlerealname"></td>
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