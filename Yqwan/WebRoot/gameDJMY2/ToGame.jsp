<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>

<!DOCTYPE HTML>
<html>
	<head>
	<script type="text/javascript" src="<%=request.getContextPath()%>/gameDJMY/start/jquery-1.7.2.min.js"></script>
	
	</head>
	<body>
		<input type="hidden" value="${user.userid }" id="useridgame">
	</body>
	<script type="text/javascript">
		 var userid = $('#useridgame').val();
		 var gamename = encodeURI(encodeURI("刀剑魔药2"));
    	window.onload=function(){
    		window.location.href="/Yqwan/startgame.do?serverid=1&gameid=60184&originalpage=gameDJMY";
   	 	}
	</script>
</html>