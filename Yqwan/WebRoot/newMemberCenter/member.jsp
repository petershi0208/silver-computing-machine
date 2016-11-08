<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML5>
<html>
  <head>
    <title>会员中心-账号中心</title> 
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	 
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
		
	<!-- Bootstrap -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/bootstrap.min.css">
	<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
	<link href="<%=request.getContextPath()%>/newMemberCenter/cropper/cropper.min.css" rel="stylesheet">
	<link href="<%=request.getContextPath()%>/newMemberCenter/sitelogo/sitelogo.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/newMemberCenter/cropper/cropper.min.js"></script>
	<script src="<%=request.getContextPath()%>/newMemberCenter/sitelogo/sitelogo.js"></script>
	<script src="<%=request.getContextPath()%>/newMemberCenter/bootstrap/js/bootstrap.min.js"></script>
	
	<link href="<%=request.getContextPath()%>/newMemberCenter/css/member.css" rel="stylesheet" type="text/css">
	
	
	
  </head>
  <body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="center">
		<jsp:include page="memberleft.jsp"></jsp:include>
		<div class="center_right">
			<div class="center_right_info">
				<span>基本信息</span>
				<img src="/Yqwan/newMemberCenter/images/hyxh.png" width=750/>
			</div>
			<div class="center_right_detail">
				<table width=100% height=100% class="table">
					<tr>
						<td width=100 height=50>昵称：</td>
						<td>${user.nickname }</td>
					</tr>
					<tr>
						<td>上次登录时间：</td>
						<td>${user.logindate}</td>
					</tr>
					<tr>
						<td>电子邮件：</td>
						<td>${user.email}</td>
					</tr>
					<tr>
						<td>剩余G币：</td>
						<td>${user.gb}</td>
					</tr>
					<tr>
						<td>QQ：</td>
						<td>${user.qq}</td>
					</tr>
					<tr>
						<td>性别：</td>
						<td>${user.sex}</td>
					</tr>
					<tr>
						<td>地址：</td>
						<td>${user.address}</td>
					</tr>
				</table>
			</div>
			<div class="center_right_touxiang">
				<div class="ibox-content">
					<div class="row">
						<div id="crop-avatar" class="col-md-6">
							<div class="center_right_img avatar-view">
								<img src="${user.headpicture }" width="100" height="100"/>	
								<span>修改头像</span>			
							</div>
						</div>
					</div>
				</div>
				
								
			</div>
			<div class="center_right_infobutton" onclick="javascript:window.open('/Yqwan/newMemberCenter/updateInformation.jsp','_target');;"><span>修改我的信息</span></div>
			
			<div class="center_right_uploadtouxiang">
				<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog" tabindex="-1">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<form class="avatar-form" action="/Yqwan/uploadtouxiang.do" enctype="multipart/form-data" method="post">
								<div class="modal-header">
									<button class="close" data-dismiss="modal" type="button">&times;</button>
									<h4 class="modal-title" id="avatar-modal-label">Change Logo Picture</h4>
								</div>
								<div class="modal-body">
									<div class="avatar-body">
										<div class="avatar-upload">
											<input class="avatar-src" name="avatar_src" type="hidden">
											<input class="avatar-data" name="avatar_data" type="hidden">
											<label for="avatarInput">图片上传</label>
											<input class="avatar-input" id="avatarInput" name="avatar_file" type="file">
										</div>
										<div class="row">
											<div class="col-md-9">
												<div class="avatar-wrapper"></div>
											</div>
											<div class="col-md-3">
												<div class="avatar-preview preview-lg"></div>
												<div class="avatar-preview preview-md"></div>
												<div class="avatar-preview preview-sm"></div>
											</div>
										</div>
										<div class="row avatar-btns">
											<div class="col-md-9">
												<div class="btn-group">
													<button class="btn" data-method="rotate" data-option="-90" type="button" title="Rotate -90 degrees"><i class="fa fa-undo"></i> 向左旋转</button>
												</div>
												<div class="btn-group">
													<button class="btn" data-method="rotate" data-option="90" type="button" title="Rotate 90 degrees"><i class="fa fa-repeat"></i> 向右旋转</button>
												</div>
											</div>
											<div class="col-md-3">
												<button class="btn btn-success btn-block avatar-save" type="submit"><i class="fa fa-save"></i> 保存修改</button>
											</div>
										</div>
									</div>
								</div>
				  		</form>
				  	</div>
				  </div>
				</div>				
				<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
			</div>
			
			<div class="center_right_recommendgame">
				<jsp:include page="memberFootGame.jsp"></jsp:include>
			</div>
			
		</div>
	</div>
	
	
	<jsp:include page="../foot.jsp"></jsp:include>	
  </body>	
<!-- 	<script src="<%=request.getContextPath()%>/memberCenter/js/area.js" type="text/javascript"></script>
	<script language="javascript">setup()</script> -->
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/member.js" type="text/javascript"></script>
</html>