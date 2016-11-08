<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<link href="<%=request.getContextPath()%>/head/head.css" rel="stylesheet" type="text/css"/>
<script src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/head/head.js" ></script>  
<meta name="360-site-verification" content="c4b354b80838ed42e55fe8a8e9ac7a3d" />
<meta name="sogou_site_verification" content="kBcY31ppf8"/>
<meta baidu-gxt-verify-token="8f07b21f0cce17343c2c26efb1681cfc">
<span style="display:none;">
	<script type="text/javascript">
		var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1257484565'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1257484565' type='text/javascript'%3E%3C/script%3E"));
	</script>
	<script>
	(function(){
	    var bp = document.createElement('script');
	    var curProtocol = window.location.protocol.split(':')[0];
	    if (curProtocol === 'https') {
	        bp.src = 'https://zz.bdstatic.com/linksubmit/push.js';        
	    }
	    else {
	        bp.src = 'http://push.zhanzhang.baidu.com/push.js';
	    }
	    var s = document.getElementsByTagName("script")[0];
	    s.parentNode.insertBefore(bp, s);
	})();
	

(function(){
   var src = (document.location.protocol == "http:") ? "http://js.passport.qihucdn.com/11.0.1.js?a765a46c2f760be008f10c86415d795a":"https://jspassport.ssl.qhimg.com/11.0.1.js?a765a46c2f760be008f10c86415d795a";
   document.write('<script src="' + src + '" id="sozz"><\/script>');
})();
	
	</script>
</span>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/head/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/head/demo.css" />

<!--必要样式-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/head/component.css" />
<div id=header>
	<div class="header">
		<div class="head">
		<input type="hidden" value="${user.userid}" id="userid">
			<img src="<%=request.getContextPath()%>/head/logobaidi.png" alt="199yLogo" title="199yLogo" width='250' height='70' class="logo" onclick="javascript:window.location.href='/Yqwan/toindex.do'"/>
			<div style="width:380px;float:left;height:85px; margin-left:32px;">
				<section class="color-1">
					<nav class="cl-effect-8">
						<a href="http://www.199y.com/Yqwan/toindex.do" data-hover="首页">首页</a>
						<a href="http://www.199y.com/Yqwan/newClassify.jsp" data-hover="分类">分类</a>
						<a href="http://www.199y.com/Yqwan/toNews.do" data-hover="新闻">新闻</a>
						<a href="http://www.199y.com/Yqwan/record.jsp" data-hover="专辑">专辑</a>
						<a href="http://www.199y.com/Yqwan/codecentre.do?giftname=&page=1" data-hover="发号">发号</a>
					</nav>
				</section>
			</div>
	<!-- 	  	<ul>
		    	<li><a id="head_index">首页</a></li>
		    	<li><a id="head_classify">分类</a></li>
		    	<li><a id="head_news">新闻</a></li>
		    	<li><a id="head_record">专辑</a></li>
		    	<li><a id="head_give">发号</a></li>
		    </ul> -->
		    <div class="h_search">
			    <input class="head_text" type="text" placeholder="请输入游戏名" id="head_text">
			    <input class="head_button" type="button" id="head_button"/>
			    <span class="notloginhead" id="headtouxiang"><a href="/Yqwan/tomember.do"><img src="${user.headpicture }" width="34" height="34"/></a></span>
				<span class="notloginhead" id="notloginhead1"><a href="/Yqwan/login.jsp">登录</a></span>
				<span class="notloginhead" id="notloginhead2"><a href="/Yqwan/toRegistOne.do">注册</a></span>
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