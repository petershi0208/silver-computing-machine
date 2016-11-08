<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
   		<title>404</title>  
   		<meta http-equiv="X-UA-Compatible" content="IE=10">
   		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<STYLE type=text/css>
			BODY {background:url(/Yqwan/404/error.jpg) center no-repeat;height:950px;width:100%;
			MARGIN: 20px; FONT: bold 12px "lucida grande",tahoma,verdana,lucida,arial,helvetica,sans-serif,"宋体"; COLOR: #f60; TEXT-ALIGN: center
			}
			A {
				COLOR: #f60
			}
		</STYLE>
	</head>
  
	<body>
	<div style="height:100px;"></div>
    <div style="position:relative;top:160px;margin:0 auto;">
 <%--   	您访问的页面不存在或者系统繁忙，为了表示我们的歉意，组织赠送您一辆车，<BR>开着它走出迷途，以重新回到组织的怀抱......<BR><BR>--%> 
		<DIV>
		<OBJECT 
		codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0 
		height=440 width=550 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000><PARAM NAME="movie" VALUE="/Yqwan/404/404_car.swf"><PARAM NAME="quality" VALUE="high">
		<embed src="/Yqwan/404/404_car.swf" quality=high 
		pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" 
		type="application/x-shockwave-flash" width="550"
		height="440"></embed></OBJECT><BR><BR><A href="index.jsp">[马上进入199Y游戏主页]</A><A href="http://www.199y.com">(点击查看)</A>
		 </DIV>
    </div>
	</body>
</html>
