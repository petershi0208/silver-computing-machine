<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>gameMHJY/">
    
    <title>梦幻家园-199Y游戏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="﻿在浪漫大陆上发现了一种奇特的浮空石，大家纷纷采集搭建岛屿，于是许多美丽的飞行岛屿诞生了，它们与云朵作伴，它们和彩虹争艳，在蓝天和白云之间出现了一个个新的彩虹庄园。在这里可以喂养动物、种植果树，体验着原汁原味儿的田园生活。通过简单有趣的DIY系统可以把庄园按照搭积木的方式打造成你心中最美的梦幻庄园。经常和朋友交流和分享设计的心得，您一定会成为鼎鼎有名的设计大师！">
	<meta http-equiv="description" content="199Y,199,199Y游戏,199Y游戏中心,DIY,挂机,设计,梦幻家园,庄园,种植 ,喂养宠物,娱乐交友,上班休闲,白领游戏,田园,H5,网页游戏 ,手游 ,礼包,月卡">
		<link rel="shortcut icon" href="images/b.jpg" type="image/x-icon">
	
			
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
								<a href="javascript:;">游戏</a>
							</div>
							<div class="QRcode" id="one">
								<div class="img"><img src="http://www.199y.com/picture/yqwan/game/199y/199yQqun.png" alt="${gamename}" width="118" height="118"/></div>
								<div class="con">扫描加入Q群<br/>领取199Y专属礼包</div>
							</div>
							<div class="QRcode none" id="two">
								<div class="img"><img src="http://www.199y.com/picture/yqwan/erweima/${gameid}.jpg" alt="${gamename}" width="118" height="118"/></div>
								<div class="con">用手机扫一扫<br/>玩起来更方便快捷</div>
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
											<h2>归园田居！</h2>
											<div class="detail_con">
												<p>活动时间：从今天到未来！</p>
												<p>活动范围：全服 </p>
												<p>活动内容：</p>
												<p>1、成功加入官方梦幻家园玩家交流群245476016<a target="_blank" href="http://jq.qq.com/?_wv=1027&k=2Gi5AKw"><img border="0" src="/Yqwan/gameBSYPT/images/i1.png"></a></p>
												<p>2、修改群名片（例：区服+角色名）</p>
												<p>3、呼叫群主即可获得丰厚奖品！（发送帐号、角色、服区给GM-小樱）</p>
												<p>4、GM小樱QQ：2912667676 <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2912667676&site=qq&menu=yes"><img border="0" src="/Yqwan/gameMHJY/images/i2.png" alt="点击这里给我发消息" title="点击这里给我发消息"/></a></p>
											</div>
										</div>		
							</div>
							<div class="page_right_r_player">
								<span>玩家互动</span>
							</div>
						</div>
						<div class="page_right_r_content">
							<!--高速版-->
							<div id="SOHUCS" sid="1980"></div>
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
						<marquee behavior="scroll" onstart="this.firstChild.innerHTML+=this.firstChild.innerHTML;" scrollamount="3" width="620" onmouseover="this.stop();" onmouseout="this.start();"> 
						<span>欢迎加入官方梦幻家园玩家交流群245476016</span>
						</marquee>
					</div>
				</div>
				<div class="center">
					<div class="content" style="float:left;">
						<div class="frame">
							<iframe id="ifm" src="${game_url}"
								frameborder="0" scrolling="no" width="100%" height="100%"
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
			<img src='start/cuo.png' class='cuo' /> 
		</div> 
		<div class="logobaidi1">
			<img src="start/logobaidi.png" width=185 height=48/>
		</div>
		<div class='fixcon'> 
			输入账号：<input type="text" name="user" id="username" class="user" /><span style="color:red" id="usernametext"></span><br/>
			输入密码：<input type="password" name="password" id="password" class="password"/><span style="color:red" id="passwordtext"></span><br/>
			<span class="gogame" id="startgamebutton">进入游戏</span><a class="reg" target="_blank">免费注册</a>
		</div> 
	</div>
	<div class="fixbo"></div>
	</body>
	<script src="https://cdn.bootcss.com/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>
		<script type="text/javascript">
			$(".page_left_l").niceScroll({scrollspeed:"80",zIndex:"9999",cursorcolor:"#ccc"});
			$(".page_left_l").niceScroll("#wrapperdiv",{cursorcolor:"#00F"});
		</script>
	<link rel="stylesheet" type="text/css"
			href="start/game_start.css">
			<script type="text/javascript"
			src="start/start.js"></script>
</html>