<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>像素骑士团-199Y游戏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<link rel="shortcut icon" href="http://static.86joy.com/game/xs/images/favicon.ico" type="image/x-icon">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="shortcut icon"
			href="http://yz.86joy.com/images/favicon.ico" type="image/x-icon">	
		<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/gameXSQST/start/game_start.css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/gameXSQST/start/jquery-1.7.2.min.js"></script>
			<script type="text/javascript"
			src="<%=request.getContextPath()%>/gameXSQST/start/start.js"></script>
	</head>
	<body>
	<div class="bgb">
		<jsp:include page="head.jsp"></jsp:include>
			<div class="page" id="page">
				<div class="page_left" id="page_left">
					<div class="page_left_l">
						<div class="logo">
							<a href="http://www.199y.com" target="_blank">
								<img src="http://www.199y.com/picture/yqwan/game/199y/199Ylogo.png" alt="199Ylogo" width='126' height='40' title="199Y游戏"/>
							</a>
						</div>
						<div class="leftL1">
							<div class="like">
								<a class="lk1" href="http://www.199y.com/Yqwan/codecentre.do?giftname=&page=1" target="_blank">领取礼包</a>
							</div>
							<div class="like">
								<a class="lk2" href="http://www.199y.com/Yqwan/tomember.do" target="_blank">会员中心</a>
							</div>
							<div class="img">
								<a href="http://www.199y.com" target="_blank" title="" id="gamer">
									<img src="http://www.199y.com/picture/yqwan/201609/2016091218212211CSQ1113.jpg" width='126' height='70'/>
								</a>
							</div>
						</div>
						<div class="leftL2">
							<div class="tit">热门游戏</div>
							<ul class="listtxt" id="listtxt">															
							</ul>
						</div>
						<div class="leftL3">
							<div class="nav" id="nav">
								<a class="cur" href="javascript:;">Q群</a>
								<a href="javascript:;">微信</a>
							</div>
							<div class="QRcode" id="one">
								<div class="img"><img src="http://www.199y.com/picture/yqwan/game/199y/199yQqun.png" alt="${gamename}" width="118" height="118"/></div>
								<div class="con">扫描加入Q群<br/>领取199Y专属礼包</div>
							</div>
							<div class="QRcode none" id="two">
								<div class="img"><img src="http://www.199y.com/picture/yqwan/game/199y/199ygongzhonghao.jpg" alt="扫一扫关注" width="118" height="118"/></div>
								<div class="con">扫描关注公众号<br/>获取199Y最新资讯</div>
							</div>
							<div class="txt1">客服Q号：<a class="qun" href="http://wpa.qq.com/msgrd?v=3&uin=2912667676&site=qq&menu=yes" target="_blank" title="联系客服"></a></div>
							<div class="txt2">玩家1群：391504664</div>
							<div class="txt2">公众号：199Y游戏乐园</div>
						</div>
					</div>	
					<div class="page_left_r" id="page_left_r"></div>			
				</div>
				<div class="page_right" id="page_right">
				<div class="page_right_l" id="page_right_l"></div>
					<div class="page_right_r" id="page_right_r">
						<div class="page_right_r_ad">
							<div class="page_right_r_gamead">
								<span>游戏公告</span>
							</div>
							<div class="page_right_r_adcontent">
										<div class="box_con">
											<h2>加入疯人院！</h2>
											<div class="detail_con">
												<p>活动时间：从今天到未来！</p>
												<p>活动范围：全服 </p>
												<p>活动内容：</p>
												<p>1、成功加入官方像素玩家交流群485799008<a target="_blank" href="http://jq.qq.com/?_wv=1027&k=2CEdlTj"><img border="0" src="/Yqwan/gameXSQST/images/i1.png"></a></p>
												<p>2、修改群名片（例：区服+角色名）</p>
												<p>3、调戏群主即可获得血钻*2000 ！（发送帐号、角色、服区给GM-小樱）</p>
												<p>4、GM小樱QQ：2912667676 <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2912667676&site=qq&menu=yes"><img border="0" src="/Yqwan/gameXSQST/images/i2.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></p>
											</div>
										</div>		
							</div>
							<div class="page_right_r_player">
								<span>玩家互动</span>
							</div>
						</div>
						<div class="page_right_r_content">
							<!--高速版-->
							<div id="SOHUCS" sid="199"></div>
							<script charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/changyan.js" ></script>
							<script type="text/javascript">
							    window.changyan.api.config({
							        appid: 'cyspwWHlh',
							        conf: 'prod_dc1fe799c2edfedc580b4fc30882fbf0'
							    });
							</script>  
						</div>					      
					</div>
				</div>
				
			<div class="wid1500"  id="center_game">
				<div class="center_game_gonggao">
					<div class="center_game_region">${gameregion }</div>
					<div class="center_game_zuixingonggao">最新公告：</div>
					<div class="center_game_gonggao_content">
						<marquee behavior="scroll" contenteditable="true" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3" width="620" onmouseover="this.stop();" onmouseout="this.start();"> 
						成功加入官方像素玩家交流群485799008，即可获得血钻*2000 ！加群备注：大区加游戏ID
						</marquee>
					</div>
				</div>
				<div class="center">
					<div class="sider" style="float:left;">					
						<iframe id="ifm" src="/Yqwan/gameXSQST/start/left.html"
							frameborder="0" scrolling="no" width="100%" height="707"
							allowtransparency="true"></iframe>
					</div>
					<div class="content" style="float:left;">
						<div class="header"></div>
						<div class="frame">
							<iframe id="ifm" src="${game_url}"
								frameborder="0" scrolling="no" width="100%" height="601"
								allowtransparency="true"></iframe>
						</div>
						<!---->
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<div class='fix'> 
		<div class='fixtop'><span>账号登录</span> 
			<img src='/Yqwan/gameXSQST/start/cuo.png' class='cuo' /> 
		</div> 
		<div class="logobaidi1">
			<img src="/Yqwan/gameXSQST/start/logobaidi.png" width=185 height=48/>
		</div>
		<div class='fixcon'> 
			输入账号：<input type="text" name="user" id="username" class="user" /><span style="color:red" id="usernametext"></span><br/>
			输入密码：<input type="password" name="password" id="password" class="password"/><span style="color:red" id="passwordtext"></span><br/>
			<span class="gogame" id="startgamebutton">进入游戏</span><a class="reg" target="_blank">免费注册</a>
		</div> 
	</div>
	<div class="fixbo"></div>
	</body>
	
	<link rel="stylesheet" type="text/css"
			href="<%=request.getContextPath()%>/gameXSQST/start/game_start.css">
</html>