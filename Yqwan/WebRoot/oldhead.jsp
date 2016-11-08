<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<link href="<%=request.getContextPath()%>/head/head.css" rel="stylesheet" type="text/css"/>
<script src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/head/head.js" ></script>  

<span style="display:none;"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1257484565'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1257484565' type='text/javascript'%3E%3C/script%3E"));</script></span>

<div id=header>
	<div class="header">
		<div class="head">
		<input type="hidden" value="${user.userid}" id="userid">
			<img src="<%=request.getContextPath()%>/head/logobaidi.png" class="logo" onclick="javascript:window.location.href='/Yqwan/index.jsp'"/>
		  	<ul>
		    	<li><a id="head_index">首页</a></li>
		    	<li><a id="head_classify">分类</a></li>
		    	<li><a id="head_news">新闻</a></li>
		    	<li><a id="head_record">专辑</a></li>
		    	<li><a id="head_give">发号</a></li>
		    </ul>
		    <div class="h_search">
			    <input class="head_text" type="text" placeholder="请输入游戏名" id="head_text">
			    <input class="head_button" type="button" id="head_button"/>
			    <span class="notloginhead" id="headtouxiang"><a href="/Yqwan/tomember.do"><img src="<%=request.getContextPath()%>/gamePicture/touxiang1.png" width="34" height="34"/></a></span>
				<span class="notloginhead" id="notloginhead1"><a href="/Yqwan/login.jsp">登录</a></span>
				<span class="notloginhead" id="notloginhead2"><a href="/Yqwan/registOne.jsp">注册</a></span>
				<span class="loginhead" id="loginhead1">您好,</span>
				<span class="notloginhead" id="loginhead2"><a href="/Yqwan/tomember.do">${user.nickname}</a></span>
				<span class="loginhead" id="loginhead3"><a href="/Yqwan/destroy.do">[退出]</a></span>
				<div class="gameselect" id="gameselect">
					<ul>
					</ul>
				</div>
		    </div>
		</div>
	</div>
	<div class="head_tubiao"></div>
</div>
<div style="height:85px;"></div>