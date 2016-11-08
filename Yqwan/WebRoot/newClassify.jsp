<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>游戏分类-199y游戏网</title>  
   		<meta name="description" content="199Y游戏分类">
   		<meta name="keywords" content="分类,199Y游戏分类"> 
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" ></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/newClassify/classify.js" ></script>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/newClassify/classify.css"/>
	</head>
  
	<body>
    	<jsp:include page="head.jsp"/>
    	<div class="classifybanner"></div>
    	<div class="center">
  			<div class="placetype">
  				<div class="pcclick">电脑放置</div>
  				<div class="anzhuoclick">安卓放置</div>
  				<div class="pingguoclick">苹果放置</div>
  				<img src="newClassify/xh.jpg"/>
  			</div>
  			
  			<div class="centerrole centerroleone" id="onemore">
  				<span><a target="_blank">角色扮演</a></span>
  				<span><a target="_blank">更多>></a></span>
  			</div>
  			<div class="centerrolefour" id="classifyrole">
<!-- 			<div class="centerrolefour_one">
  					<div class="centerrolefour_one_nei">
  						<img src="newClassify/iconfont-123.png" width='196' height='144'/>
  						<img src="newClassify/H5.jpg">
  					</div>
  					<div class="centerrolefour_one_info">
  						<div class="centerrolefour_one_info_name">像素骑士团</div>
  						<div class="centerrolefour_one_info_score">8.2</div>
  					</div>
  				</div>  --> 
  			</div>
  			
  			<div class="centerrole" id="twomore">
  				<span><a target="_blank">角色策略</a></span>
  				<span><a target="_blank">更多>></a></span>
  			</div>
  			<div class="centerrolefour" id="classifyplan"></div>
  			
  			<div class="centerrole" id="threemore">
  				<span><a target="_blank">角色经营</a></span>
  				<span><a target="_blank">更多>></a></span>
  			</div>
  			<div class="centerrolefour" id="classifymanage"></div>
  			
  			<div class="centerrole" id="fourmore">
  				<span><a target="_blank">特色类型</a></span>
  				<span><a target="_blank">更多>></a></span>
  			</div>
  			<div class="centerrolefour" id="classifyspecial"></div>
  			
    	</div>
    	<jsp:include page="foot.jsp"/>
	</body>
</html>
