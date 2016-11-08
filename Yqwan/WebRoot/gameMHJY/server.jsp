<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>gameMHJY/">
    
      <title>梦幻家园-选择服务器-199Y游戏</title>

    <link rel="shortcut icon" href="images/b.jpg" type="image/x-icon">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="199Y  199  199Y游戏  199Y游戏中心   角色扮演   挂机   mmoprpg   猎魔传说    传说   冒险    养成   娱乐交友   上班休闲    白领游戏    H5    网页游戏   手游   礼包    月卡    自动打怪    地下城    剧情闯关   高画质">
	<meta http-equiv="description" content="《猎魔传说》是以天使与恶魔在一万年前进行了名为末日之战的最后战役为背景，战役的结果是天使险胜，但元气大伤，几乎大部分天使失去了法力，坠落混沌之地。为了避免天堂的覆灭，天使最高议会的大天使联盟决定永久关闭天堂之门，从此天使彻底消失在宇宙之中再无踪迹。失去法力坠落混度之地的天使在头领的带领下艰难的生存下来，混沌之地逐渐秩序，各种族群主见生养起来。生活在这篇土地上的各种文明将混度之地称为极乐大陆，而这些坠落天使成为了创世者，被之后的族群奉为神灵">
	<link href="scrollbars/jquery.kkScroll.css" rel="stylesheet" type="text/css" />
	<link href="css/server.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>
  	<jsp:include page="head.jsp"></jsp:include>
    <div class="main">
    	<div class="top"></div>
    	<div class="content">
    		<div class="dc" id="server_yes">
    			<div class="dcleft" id="server_nickname">账户名：${user.nickname }</div>
    			<div class="dcright"><a id="server_out">登出</a></div>
    		</div>
    		<div class="dlzc" id="server_no">
    			<span class="dcleft">账户：<input type="text" name="" class="name" id="username"/></span>
    			<span class="dcright">密码：<input type="password" name="" class="password" id="password"/></span>
    			<span class="dl" id="serverbutton"></span>
    			<span class="zc"><a id="reg" target="_blank">免费注册</a></span>
    		</div>
    		<div class="dlg">
    			<div class="h16b dlgtxt"></div>
    			<div class="wdl" id="server_not">您还尚未登录</div>
    			<div class="ydl" id="server_recent"><a class="qm"></a></div>
    			<input type="hidden" id="server_recentserverid"/>
    		</div>
    		<div class="recommend">
    			<div class="h16b tuijian"></div>
    			<div class="server">
    				<div class="server3"><a class="qm" id="server_recommend"></a></div>
    				<input type="hidden" id="server_recommendserverid"/>
    			</div>
    		</div>
    		<div class="allserver">
    			<div class="h16b tuijian"></div>
    			<div class="server" id='Demo'>
 <!-- 				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div>
    				<div class="server3"><a class="qm">S1 月之港口</a></div> --> 	
    			</div>
    		</div>
    	</div>
    </div>
   <jsp:include page="foot.jsp"></jsp:include>
	<script language='javascript' src='scrollbars/jquery.mousewheel.js'></script>
	<script language='javascript' src="scrollbars/jquery.kkScroll.js"></script>
	<script>
	$(document).ready(function(){
		setTimeout(function(){
			//$("#Demo").getScrollbar({direction:"left"});
			var a = $("#Demo").children(".server3").length;				
			if(a>12){
				$("#Demo").getScrollbar();
			}
		},100);			
	});
	</script>
  </body>
</html>
