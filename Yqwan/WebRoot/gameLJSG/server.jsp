<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>gameLJSG/">
    <title>199Y-龙降三国选服</title>
    <link rel="shortcut icon" href="http://www.199y.com/picture/yqwan/game/ljsg/lj.png" type="image/x-icon">
    <meta name="keywords" content="三国,三国之怒,三国志9,三国志10,三国志11,三国志12,三国志13,热血传奇,大皇帝,传奇,关羽,张飞,吕布,热血PK,PK,貂蝉,小乔,赵云,三国演义,新三国,怒三国,三国志,真三国无双,三国杀,三国女志,三国之志,199,199y,9游戏,199游戏,9y游戏,199y游戏">
	<meta name="description" content="《龙降三国》是一款写实风格的三国策略卡牌手游。三个国家特点鲜明各有千秋，为您展现景区级的场景画面以及酷炫带感的角色造型,游戏里霸气精美的卡牌人物，华丽的技能特效，史诗般的场景和画面，致力于打造次时代的手游美术品质。气势磅礴的万人国战，极高策略性的副本关卡让你欲罢不能！更能与数千玩家同战沙场。">
	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="css/server.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="css/login.css">
    <link href="scrollbars/jquery.kkScroll.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div style="margin: 0 auto; width: 1100px; height: 885px;margin-top:150px;">
		<jsp:include page="left.jsp"></jsp:include>
	    <div class="serverDiv">
	        <div class="topDiv">
	            <h3>所有服务器</h3>
	        </div>
	        <div class="loginDiv">
	            <div class="serverName">
	                <a class="noWord"></a>
	            </div>
	        </div>
	        <div class="loginShow">
	            <a class="hasWord" id="click_recent">
	                <img class="fireLogo" src="images/serverimage/huo.png" alt="火logo">
	                <span class="firstW" id="server_recent">天空之城</span>
	                <span class="secondW">火爆开启</span>
	            </a>
	            <div id="wdl" class="wdl">您还尚未登陆</div>
	            <input type="hidden" id="server_recentserverid"/>
	        </div>
	        <div class="recommendDiv">
	            <div class="serverName">
	                <a class="noWord"></a>
	            </div>
	        </div>
	        <div class="recommendShow">
	            <a class="hasWord" id="click_recommend">
	                <img class="fireLogo" src="images/serverimage/huo.png" alt="火logo">
	                <span class="firstW" id="server_recommend"></span>
	                <span class="secondW"> 火爆开启</span>
	            </a>
	            <input type="hidden" id="server_recommendserverid"/>
	        </div>
	        <div class="allServerDiv">
	            <div class="serverName">
	                <a class="noWord"></a>
	            </div>
	        </div>
	        <div id="Demo" class="allServerShow">
	        </div>
	    </div>
	</div>
	<div style="width:122px;height:122px;position:absolute;left:50%;top:150px;margin-left:-470px;background:url(http://www.199y.com/picture/yqwan/game/ljsg/logo.png) center"></div>
    <jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript" src="js/jquery.md5.js"></script>
<script language='javascript' src="scrollbars/jquery.mousewheel.js"></script>
<script language='javascript' src="scrollbars/jquery.kkScroll.js"></script>
<script>
    $(document).ready(function(){
        setTimeout(function(){
            //$("#Demo").getScrollbar({direction:"left"});
            var a = $("#Demo").children("a").length;
            if(a>20){
                $("#Demo").getScrollbar();
            }
        },100);
    });
</script>
</body>
</html>