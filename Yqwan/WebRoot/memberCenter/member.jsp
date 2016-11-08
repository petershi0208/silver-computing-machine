<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>会员中心-账号中心</title> 
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/memberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/memberCenter/js/member.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/bootstrap.min.css">
    <!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/member.css">
  </head>
  <body>
	<input type="hidden" value="${user.qq}" id="informationqq"/>
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
			<div class="content">
				<div class="top">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/landian.png" height="7" width="7" />
					个人资料
				</div>
				<div class="centre">
					<table width="600" height="425" id="table">
						<tr>
							<td class="lanse" width="110">基本资料</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>当前头像：</td>
							<td><img src="http://www.199y.com/picture/yqwan/touxiang.png" width="67" height="67" /></td>
							<td>
								<div class="changehead" onclick="javascript:alert('目前未开放');">
									修改头像
								</div>
							</td>
						</tr>
						<tr>
							<td>昵称：</td>
							<td>${user.nickname}</td>
							<td></td>
						</tr>
						<tr>
							<td>上次登录时间：</td>
							<td>${user.logindate}</td>
							<td></td>
						</tr>
						<tr>
							<td>电子邮件：</td>
							<td>${user.email}</td>
							<td>
								<div class="quickconn">
									<a href="/Yqwan/memberCenter/addemail.jsp">换绑邮箱</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>手机号码：</td>
							<td>${user.telephone }</td>
							<td>
								<div class="phoneconn">
									<a href="/Yqwan/memberCenter/cellphone.jsp">换绑手机</a>
								</div>
							</td>
						</tr>
						
						<tr>
							<td>剩余GB：</td>
							<td>${user.gb}</td>
							<td></td>
						</tr>
						<tr>
							<td>最近充值游戏：</td>
							<td id="lastgame"></td>
							<td><div class="quickconn" id="morecharge">更多</div></td>
						</tr>
					</table>
				</div>
				<div class="bottom">
				<form action="/Yqwan/memberinformation.do" method="post" id="form">
				  <input type="hidden" value="${user.userid}" name="memberuserid"/>
					<table width="600" height="250" id="tablenot">
						<tr>
							<td width="130" >更多资料</td>
							<td></td>
						</tr>
						<tr>
							<td>QQ：</td>
							<td><input type="text"  id="qq" name="qq"/></td>
						</tr>
						<tr>
							<td>性别：</td>
							<td>
								<input type="radio" name="sex" value="m" checked="checked"/>男
								<input type="radio" name="sex" value="f" />女
							</td>
						</tr>
						<tr>
							<td>地址：</td>
							<td>
								<select name="province" id="province">
								</select>
								<select name="city" id="city">
								</select>
								<select name="county" id="county">
								</select>
							</td>
						</tr>
						<tr>
							<td></td>
							<td class="address"><input type="text" id="address" name="address"/></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="button" value="保存" class="btn btn-primary btn-block"  id="informationbutton"/></td>
						</tr>
					</table>
				</form>
				<table width="600" height="250" id="tableyes">
						<tr>
							<td width="130">更多资料</td>
							<td></td>
						</tr>
<%--					<tr>
							<td>昵称：</td>
							<td><input type="text"  /></td>
						</tr> --%>	
						<tr>
							<td>QQ：</td>
							<td>${user.qq }</td>
						</tr>
						<tr>
							<td>性别：</td>
							<td>${user.sex }</td>
						</tr>
						<tr>
							<td>地址：</td>
							<td>${user.address }</td>
						</tr>
					</table>
				</div>
				<div class="charge_records" id="charge_records">
					<table width="450">
						<tr id="chargetitle">
							<td>充值游戏</td>
							<td>充值金额(元)</td>
							<td>充值日期</td>
						</tr>
<%--					<tr>
							<td>像素骑士团</td>
							<td>30</td>
							<td>2016-1-31</td>
						</tr> --%>	
						
					</table>
				</div>		
			</div>
		</div>
		
	</div>
	<jsp:include page="../foot.jsp"></jsp:include>	
  </body>	
	<script src="<%=request.getContextPath()%>/memberCenter/js/area.js" type="text/javascript"></script>
	<script language="javascript">setup()</script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
</html>