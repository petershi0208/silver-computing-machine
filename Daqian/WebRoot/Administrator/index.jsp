<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/jquery/1.9.1/jquery.min.js"></script> 
    <base href="<%=basePath%>">
    
    <title>大钱后台管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />

<link href="<%=request.getContextPath()%>/Administrator/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/Administrator/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/Administrator/skin/default/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="<%=request.getContextPath()%>/Administrator/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/Administrator/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		window.onload = function(){
			var role = $('#type').val();
			if(role=="admin"){
				$('.adminshow').show();
				$(".newsmanage").show();
				$('.purchaseproduct').show();
			}else if(role=="news"){
				$(".newsmanage").show();			
			}else if(role=="products"){
				$('.purchaseproduct').show();
			}else{
				window.location.href="http://www.199y.com/Daqian/Administrator/login.jsp";
			}
		}
	</script>


  </head>
  
<body>
<!--------------------------------------------- 头部开始 -------------------------------------------------->
<header class="Hui-header cl"> 
	<a class="Hui-logo l" title="大钱首页" href="/">大钱首页</a> <a class="Hui-logo-m l" href="/" title="H-ui.admin"></a> <span class="Hui-subtitle l"></span>
	<nav class="mainnav cl" id="Hui-nav">
	</nav>
	<ul class="Hui-userbar">
		<li>超级管理员</li>
		<li class="dropDown dropDown_hover"><a href="#" class="dropDown_A">${admin.username } <i class="Hui-iconfont">&#xe6d5;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="<%=request.getContextPath()%>/Administrator/login.jsp">切换账户</a></li>
				<li><a href="<%=request.getContextPath()%>/Administrator/login.jsp">退出</a></li>
			</ul>
		</li>
		<li id="Hui-skin" class="dropDown right dropDown_hover"><a href="javascript:;" title="换肤"><i class="Hui-iconfont" style="font-size:18px">&#xe62a;</i></a>
			<ul class="dropDown-menu radius box-shadow">
				<li><a href="javascript:;" data-val="default" title="默认（黑色）">默认（黑色）</a></li>
				<li><a href="javascript:;" data-val="blue" title="蓝色">蓝色</a></li>
				<li><a href="javascript:;" data-val="green" title="绿色">绿色</a></li>
				<li><a href="javascript:;" data-val="red" title="红色">红色</a></li>
				<li><a href="javascript:;" data-val="yellow" title="黄色">黄色</a></li>
				<li><a href="javascript:;" data-val="orange" title="绿色">橙色</a></li>
			</ul>
		</li>
	</ul>
	<a aria-hidden="false" class="Hui-nav-toggle" href="#"></a> 
	
	
</header>
<!--------------------------------------------- 头部结束  ------------------------------------------------>
	<!--------------------------------------------- 左侧开始  ------------------------------------------------>
<aside class="Hui-aside">
	<input runat="server" id="divScrollValue" type="hidden" value="" />
	<input type="hidden" id="type" value="${type}"/>
	
	
	<div class="menu_dropdown bk_2">
<div class="adminshow" style="display:none;">	
		<dl id="menu-article">
			<dt><i class="Hui-iconfont">&#xe616;</i> 理财产品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/products-info.do" href="javascript:void(0)">理财产品列表</a></li>			
					<li><a _href="<%=request.getContextPath()%>/subproduct-info.do" href="javascript:void(0)">产品利率查询</a></li>
				</ul>
			</dd>
		</dl>
		
		<dl id="menu-picture">
			<dt><i class="Hui-iconfont">&#xe613;</i> 借款产品管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/borrow-list.do" href="javascript:void(0)">借款信息查询</a></li>
				</ul>
			</dd>
		</dl>
</div>		
		<c:if test="${admin.username == 'admin' or admin.username == 'news' }">
		<dl id="menu-picture" class="newsmanage">
			<dt><i class="Hui-iconfont">&#xe613;</i> 新闻管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/news-list.do" href="javascript:void(0)">新闻查询</a></li>
				</ul>
			</dd>
		</dl>
		</c:if>
<div class="adminshow" style="">		
		<dl id="menu-member">
			<dt><i class="Hui-iconfont">&#xe60d;</i> 会员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/user-list.do" href="javascript:;">会员列表</a></li>
					<li><a _href="<%=request.getContextPath()%>/userassets-list.do" href="javascript:;">会员资产列表</a></li>
					<li><a _href="<%=request.getContextPath()%>/purchase-list.do" href="javascript:;">会员购买信息列表</a></li>
					<li><a _href="<%=request.getContextPath()%>/trade-list.do" href="javascript:;">会员充值列表</a></li>
				</ul>
			</dd>
			
		</dl>
		<c:if test="${admin.username == 'admin' }">
		<dl id="menu-admin">
			<dt><i class="Hui-iconfont">&#xe62d;</i> 管理员管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a href="javascript:void(0)" _href="<%=request.getContextPath()%>/admininfo.do" >查看管理员</a></li>
					<li><a href="javascript:void(0)" _href="<%=request.getContextPath()%>/Administrator/template/admin/addadmin.jsp" >添加管理员</a></li>
				</ul>
			</dd>
		</dl>
		</c:if>
		<dl id="menu-system">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 系统管理<i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/log-list.do" href="javascript:;">系统日志</a></li>
				</ul>
			</dd>
		</dl>		
</div>	
<dl id="menu-system" class="purchaseproduct" style="display:none;">
			<dt><i class="Hui-iconfont">&#xe62e;</i> 发标管理 <i class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i></dt>
			<dd>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/Administrator/template/register/register.jsp" href="javascript:;">理财一键注册</a></li>
				</ul>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/Administrator/template/register/creditor-add.jsp" href="javascript:;">添加债务人</a></li>
				</ul>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/ht/producadd.do" href="javascript:;">发布标的</a></li>
				</ul>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/subproduct.do" href="javascript:;">购买及修改标的信息</a></li>
				</ul>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/userassets-list.do" href="javascript:;">理财者加钱</a></li>
				</ul>
				<ul>
					<li><a _href="<%=request.getContextPath()%>/ht/creditor.do" href="javascript:;">债务人信息</a></li>
				</ul>
			</dd>
		</dl>	
	</div>
</aside>
<!--------------------------------------------- 左侧结束  ------------------------------------------------>

<div class="dislpayArrow"><a class="pngfix" href="javascript:void(0);" onClick="displaynavbar(this)"></a></div>
<!--------------------------------------------- 右侧开始  ------------------------------------------------>
<section class="Hui-article-box">
	<div id="Hui-tabNav" class="Hui-tabNav">
		<div class="Hui-tabNav-wp">
			<ul id="min_title_list" class="acrossTab cl">
				<li class="active"><span title="我的桌面" data-href="<%=request.getContextPath()%>/welcome.do">我的桌面</span><em></em></li>
			</ul>
		</div>
		<div class="Hui-tabNav-more btn-group"><a id="js-tabNav-prev" class="btn radius btn-default size-S" href="javascript:;">
			<i class="Hui-iconfont">&#xe6d4;</i></a>
			<a id="js-tabNav-next" class="btn radius btn-default size-S" href="javascript:;"><i class="Hui-iconfont">&#xe6d7;</i></a>
		</div>
	</div>
	<div id="iframe_box" class="Hui-article">
		<div class="show_iframe">
			<div style="" class="loading"></div>
			<iframe scrolling="yes" frameborder="0" src="<%=request.getContextPath()%>/welcome.do"></iframe>
		</div>
	</div>
</section>

<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.admin.js"></script> 
<script type="text/javascript">
/*资讯-添加*/
function article_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*产品-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
</script> 
<script type="text/javascript">
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s)})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
</body>
