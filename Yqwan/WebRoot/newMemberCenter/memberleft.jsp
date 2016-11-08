<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


	<head>
   		<title>memberright</title>  
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/memberleft.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/newMemberCenter/js/memberleft.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/newMemberCenter/js/loginornot.js"></script>
		<link href="<%=request.getContextPath()%>/index/slider/css/jquery.slideBox.css" rel="stylesheet" type="text/css" />	
		<script src="<%=request.getContextPath()%>/index/slider/js/jquery.slideBox.js" type="text/javascript"></script>
		<script>
			jQuery(function($){
					$('#demo3').slideBox({
						duration : 0.3,//滚动持续时间，单位：秒
						easing : 'linear',//swing,linear//滚动特效
						delay : 5,//滚动延迟时间，单位：秒
						hideClickBar : false,//不自动隐藏点选按键
						clickBarRadius : 10
					});
				});
		</script>
	</head>
  
	<body>
	<input type="hidden" value="${user.telephone}" id="memberright_telephone"/>
	<input type="hidden" value="${user.email}" id="memberright_email"/>
	<input type="hidden" value="${user.realname}" id="memberright_realname"/>
    	<div class="center_left">
			<div class="center_left_img">
				<img src="${user.headpicture }" width="100" height="100"/>
			</div>
			<div class="center_left_name">
				<span>您好&nbsp;,&nbsp;${user.nickname }</span>
			</div>
			<div class="center_left_gb">
				<span>我的G币：</span>
				<div>${user.gb }</div>
				<span>[<a href="/Yqwan/destroy.do">退出</a>]</span>
			</div>
			<div class="center_left_recharge" onclick="javascript:window.open('/Yqwan/recharge.do','_blank')">
				<img src="/Yqwan/newMemberCenter/images/chongzhi.png"/>
				<span><a>充值</a></span>
			</div>
			<div class="center_left_list">
				<div id="navcontainer">
					<ul id="navlist">
						<li>
							<a href="/Yqwan/tomember.do"><img src="/Yqwan/newMemberCenter/images/geren.png"><span>个人信息</span></a>
						</li>
						<li>
							<a href="/Yqwan/newMemberCenter/security.jsp"><img src="/Yqwan/newMemberCenter/images/zhanghao.png"><span>账号安全</span></a>
						</li>
						<li>
							<a href="/Yqwan/totradelist.do"><img src="/Yqwan/newMemberCenter/images/jilu.png"><span>充值记录</span></a>
						</li>
						<li>
							<a href="/Yqwan/toinvitation.do"><img src="/Yqwan/newMemberCenter/images/tuiguang.png"><span>推广员&nbsp;&nbsp;&nbsp;</span></a>
						</li>
						<li>
							<a href="/Yqwan/togift.do"><img src="/Yqwan/newMemberCenter/images/xiaoxi.png"><span>我的礼包</span></a>
						</li>
					</ul>
				</div>
			</div>
			<div class="toprank">
	    		<div class="toprank_ad">
	    			<div id="demo3" class="slideBox">
				 		 <ul class="items" id="items">				 
				 		 </ul>
					</div>
	    		</div>
	    		<div class="toprank_allgame" id="toprank_allgame">	
	    		</div>    		
	    	</div>
		</div>
	</body>
