<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
	    <title>H5游戏-199Y游戏</title>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
		<script type="text/javascript">				
				window.onload=function(){
					var gamename = '${gamename}';
					var gameurl = '${game_url}';
					if(gameurl==''){
		    			window.location.href="/Yqwan/gameH5/phoneLogin/login.jsp?gamename="+encodeURI(encodeURI(gamename))+"&gameid="+GetQueryString("gameid")+"&originalpage="+GetQueryString("originalpage");
		    		}
   				}

				function GetQueryString(name)
				{
				     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
				     var r = window.location.search.substr(1).match(reg);
				     if(r!=null)return  unescape(r[2]); return null;
				}
	</script>
	</head>
	<body style="margin:0;">
	<div style="width:100%;height:100%;" id="frame">
							<iframe id="ifm" src="${game_url}"
								frameborder="0" scrolling="no" width="100%" height="100%"
								allowtransparency="true"></iframe>
						</div>
	</body>
</html>