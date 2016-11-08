<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/foot.css"/>

		<script type="text/javascript" src="<%=request.getContextPath()%>/foot/foot.js" ></script>
		<script src="https://cdn.bootcss.com/jquery.nicescroll/3.6.8-fix/jquery.nicescroll.min.js"></script>
		<script type="text/javascript">
			$("html").niceScroll({scrollspeed:"80",zIndex:"9999",cursorcolor:"#ccc"});
			$("html").niceScroll("#wrapperdiv",{cursorcolor:"#00F"});
		</script>
	</head>
  
	<body>
		<div class="footauto">
   		<div class="foot"> 
	    	<div class="footultext">
		    	<ul id="footultext">
		    		<li>关于我们</li>
		    		<li>诚聘英才</li>
		    		<li>友情链接</li>
		    		<li>法律声明</li>
		    		<li>收藏本站</li>
		    	</ul>
		    </div>	   
	    	<span>温馨提示：抵制不良游戏，拒绝盗版游戏，注意自我保护，谨防受骗上当,适度游戏益脑，沉迷游戏伤身，合理安排时间，享受健康生活</span>
	    	<div class="footinfo">
	    		<span>联系电话:021-51028162&nbsp&nbspQQ:2912667676&nbsp&nbsp站长邮箱:2912667676@qq.com 上海壹火网络科技有限公司</span>
	    		<span>文明办网文明上网举报电话：021-51028162  &nbsp;| &nbsp; 举报邮箱：2912667676@qq.com  &nbsp;| &nbsp; <a href="/Yqwan/parents_care/process.jsp">未成年人家长监护</a></span>
	    		<span>地址:上海市逸仙路2816号华滋奔腾大厦A1205-1206室 &nbsp;&nbsp;本平台游戏适合18岁以上的玩家进入</span>
	    		<span>沪ICP备15053788号-2 沪网文【2016】0061-061号</span>
	    	</div>
	    </div>
    </div>
	
	<script type="text/javascript">
		$(function(){
			$('html').css('overflow','hidden');
			})
	</script>
	
	
	
	
	
	
<%--		<div class="footauto">
	    	<div class="foot">
	    		<ul class="footultext" id="footultext">
		    		<li>关于我们</li>
		    		<li>|</li>
		    		<li>诚聘英才</li>
		    		<li>|</li>
		    		<li>友情链接</li>
		    		<li>|</li>
		    		<li>法律声明</li>
		    		<li>|</li>
		    		<li>收藏本站</li>
	    		</ul>
	    		<div class="footinfo">
	    			<span>地址:上海市逸仙路2816号华滋奔腾大厦A1205-1206室.&nbsp&nbspICP:沪ICP备15053788号-2</span>
	    		</div>
	    	</div>
	    </div> --%>
	</body>
</html>
