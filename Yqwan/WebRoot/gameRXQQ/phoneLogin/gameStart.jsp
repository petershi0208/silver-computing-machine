<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
	    <title>热血球球-199Y游戏</title>
		<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
		<script type="text/javascript">
				window.onload=function(){
					var gameurl = '${game_url}';
					if(gameurl==''){
		    			window.location.href="/Yqwan/gameRXQQ/phoneLogin/login.jsp";
		    		}
   				}
	</script>
	</head>
	<body style="margin:0;">
	<div style="width:100%;height:100%;border">
							<iframe id="ifm" src="${game_url}"
								frameborder="0" scrolling="no" width="100%" height="100%"
								allowtransparency="true"></iframe>
						</div>
	</body>
</html>