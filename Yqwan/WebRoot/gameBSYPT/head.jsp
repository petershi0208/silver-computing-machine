<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="<%=request.getContextPath()%>/gameBSYPT/css/head.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/gameBSYPT/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/gameBSYPT/js/jquery.md5.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/gameBSYPT/js/all.js"></script>

<input type="hidden" id="nickname" value="${user.nickname}"/>
<input type="hidden" id="userid" value="${user.userid}"/>

	<div class="win1000">
    		<img src="gameBSYPT/images/logobaidi.png" width=185 height=58 class="logo" onclick="javascript:window.open('http://www.199y.com','_blank');" id="headlogo"/>
<%--    	<img src="images/t1.png" width="50" height="50">
    		<img src="images/t2.png" width="50" height="50">
    		<img src="images/t3.png" width="50" height="50">
    		<img src="images/t4.png" width="50" height="50">
    		<img src="images/t5.png" width="50" height="50">--%>
    		<span class="gw"><a href="http://bsypt.199y.com" target="_blank">官网首页</a></span><span>|</span>
    		<span><a id="reg" target="_blank">快速注册</a></span><span>|</span>
    		<span id="head_recharge"><a target="_blank">游戏充值</a></span><span>|</span>
    		<span><a onclick="javascript:alert('待开放中');return;">玩家论坛</a></span>
    </div>
    <div class="head"></div>

<!-- CNZZ && 百度seo -->
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
	</script>
</span>