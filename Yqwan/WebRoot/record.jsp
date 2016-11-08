<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>专辑-199y游戏</title>  
   		<meta name="keywords" content="专辑,游戏专辑">
   		<meta name="description" content="199y游戏专辑">
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>//images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/record/record.css"/>
		<script src="<%=request.getContextPath()%>/record/jquery-1.4.3.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/record/record.js" type="text/javascript"></script>
	</head>
  
	<body>
    	<jsp:include page="head.jsp"/>
    	<div class="recordbg"></div>
    	<div class="banner"></div>    	
    	<div class="center" id="gamerecord">
<!--   		<div class="center_record">
    			<div class="center_record_img">
    				<img src="record/banner_z.jpg" width="300" height="210"/>
    			</div>
    			<div class="center_record_detail">
    				<div>一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机</div>
    				<div>共12款游戏</div>
    				<div>detaildetail一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机一起玩挂机</div>
    				<div class="center_record_bottom">
    					<img src="record/shij.png"/><span>&nbsp;时间：2016-06-30&nbsp;&nbsp;&nbsp;&nbsp;</span>
    					<img src="record/liul.png"/><span>&nbsp;浏览：300&nbsp;&nbsp;&nbsp;&nbsp;</span>
    					<img src="record/pinf.png"/><span>&nbsp;评分：8.0&nbsp;&nbsp;&nbsp;&nbsp;</span>
    				</div>
    			</div>   
    			<div class="center_record_right">
    				<div><img src="record/pinf.png" width='23' height='23'/></div>
    				<span>评分8.0</span>
    			</div>			
    		</div>--> 	  		
    	</div>  
    	<div style="width:1200px;height:100px;background:#fff;margin:0 auto;" >
    		<div class="morerecord" id="morerecord">查看更多</div>
    	</div>
    	
    	<jsp:include page="foot.jsp"></jsp:include>
	</body>
</html>
