<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>gameSGZN/">
    
    <title>199Y-三国之怒登录</title>
    <link rel="shortcut icon" href="http://www.199y.com/picture/yqwan/201608/sanggg.jpg" type="image/x-icon">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="三国,三国之怒,三国志9,三国志10,三国志11,三国志12,三国志13,热血传奇,大皇帝,传奇,关羽,张飞,吕布,热血PK,PK,貂蝉,小乔,赵云,三国演义,新三国,怒三国,三国志,真三国无双,三国杀,三国女志,三国之志,199,199y,9游戏,199游戏,9y游戏,199y游戏">
	<meta name="description" content="华丽的技能和优良的操作手感带来极致战斗体验，打怪PK更为爽快。召集各路英豪，一统天下，尽在《三国之怒》">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<body>
	<div class="navright">
		<ul>
			<li><i></i><a id="login_regist" target="_blank">注册账号</a></li>
			<li><i></i><a href="http://www.199y.com/Yqwan/toRegistOne.do" id="news" target="_blank">新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;闻</a></li>
			<li><i></i><a target="_blank" id="activity">活&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;动</a></li>
			<li><i></i><a href="http://sgzn.199y.com/gameSGZN/gamedatum/rhsj.jsp" target="_blank">玩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;法</a></li>
			<li><i></i><a href="http://sgzn.199y.com/gameSGZN/gamedatum/vipxt.jsp" target="_blank">VIP系统</a></li>
			<li><i></i><a href="http://www.199y.com/Yqwan/codecentre.do?giftname=&page=1" target="_blank">礼包兑换</a></li>
		</ul>
	</div>
		<jsp:include page="head.jsp"></jsp:include>
	<div class="main">
		<div>
			<jsp:include page="left.jsp"></jsp:include>
			<div class="maright">
				<div style="height:286px;"></div>
				<div class="system">
					<p><img src="images/login/dengtu1.png"/>系统介绍</p>
					<ul>
						<li>
							<i></i>
							<div>霸&nbsp;&nbsp;&nbsp;皇业&nbsp;&nbsp;&nbsp;城</div>
						</li>
						<li>
							<i></i>
							<div>兵&nbsp;&nbsp;&nbsp;骑器&nbsp;&nbsp;&nbsp;战</div>
						</li>
						<li>
							<i></i>
							<div>系&nbsp;&nbsp;&nbsp;法统&nbsp;&nbsp;&nbsp;宝</div>
						</li>
						<li>
							<i></i>
							<div>成&nbsp;&nbsp;&nbsp;坐长&nbsp;&nbsp;&nbsp;骑</div>
						</li>
						<li>
							<i></i>
							<div>合&nbsp;&nbsp;&nbsp;装成&nbsp;&nbsp;&nbsp;备</div>
						</li>
					</ul>
					<div class="synmore">
						<div>
							<img src="images/login/tu09.png" width="227" height="175" />
							<div>
								<span>骑战兵器</span>
								<span>王者霸业，</span>
								<span>诸豪群雄共而谋之！</span>
								<span>骑兵在手，</span>
								<span>剑指苍穹谁人能敌！</span>
								<a></a>
								
							</div>
						</div>
						<div>
							<img src="images/login/2.jpg" width="227" height="175" />
							<div>
								<span>千军万马</span>	
								<span>踏平广阔疆土，</span>
								<span>干戈起！</span>
								<span>刀光剑影，</span>
								<span>何谓一世英名！</span>
								<a></a>
							</div>
						</div>
						<div>
							<img src="images/login/5.jpg" width="227" height="175" />
							<div>
								<span>神兵出</span>
								<span>天下动，</span>
								<span>能者持之，呼风唤雨！</span>
								<span>天地为之变色，</span>
								<span>豪情谁与共！</span>
								<a></a>	
							</div>
						</div>
						<div>
							<img src="images/login/4.jpg" width="227" height="175" />三、	
							<div>
								<span>成长坐骑</span>
								<span>千里马常有，</span>
								<span>而伯乐不常有！</span>
								<span>一骑红尘绝去，</span>
								<span>孰与争锋！</span>
								<a></a>
							</div>
						</div>
						<div>
							<img src="images/login/3.jpg" width="227" height="175" />
							<div>
								<span>合成装备</span>
								<span>冷光金甲，</span>
								<span>如入无人之境！</span>
								<span>毫发未损，</span>
								<span>笑傲苍穹！</span>
								<a></a>
							</div>
						</div>
					</div>
				</div>
				<div class="newthree">
					<a href="http://sgzn.199y.com/newsinfo.do?id=624170" target="_blank"><span>新服活动</span></a>
					<a href="http://sgzn.199y.com/morenews.do?type=%25E6%259C%2580%25E6%2596%25B0&num=1" target="_blank"><span>游戏系统</span></a>
					<a href="http://sgzn.199y.com/newsinfo.do?id=624171" target="_blank"><span>新手常见问题</span></a>
				</div>
			</div>
		</div>
		<div class="mainbom">
			<div class="loop">
				<img src="images/login/tu002.png" />
			</div>
			<div class="news">
				<div class="newstop">
					<a id="a1" class="zh act">最新</a>
					<a id="a2" class="xw">新闻</a>
					<a id="a3" class="hd">活动</a>
					<a id="a4" class="wf">玩法</a>
					
				</div>
				<div id="ua1" class="newstitle"></div>
				<div id="ua2" class="newstitle"></div>
				<div id="ua3" class="newstitle"></div>
				<div id="ua4" class="newstitle"></div>
				
			</div>
		</div>
	</div>
	<jsp:include page="foot.jsp"></jsp:include>
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/jquery.md5.js"></script>
</body>
</html>