<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'products-info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!--[if lt IE 9]>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/html5.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/respond.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/PIE_IE678.js"></script>
<![endif]-->
<link href="<%=request.getContextPath()%>/Administrator/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/Administrator/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/Administrator/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
</head>
  
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 用户管理 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
	<div class="text-c"> 日期范围：
	<form action="news-list.do" method="post">
		<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" name="date1" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" name="date2" class="input-text Wdate" style="width:120px;">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" onclick="article_add('添加新闻','<%=request.getContextPath()%>/Administrator/template/news/news-add.jsp')" class="btn btn-primary radius">
				<i class="Hui-iconfont">&#xe600;</i> 添加产品
			</a>
		</span> 
		<span class="r">共有数据：<strong></strong> 条</span> 
	</div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="80">ID</th>
				<th width="100">标题</th>
				<th width="300" style="width:800px;overflow:hidden">正文</th>
				<th width="100">发布时间</th>
				<th width="200">图片</th>
				<th width="90">状态</th>
				<th width="120">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${nlist }" var="n">
			<tr class="text-c">
				<td>${n.id }</td>
				<td>${n.title }</td>
				<td class="contte" style="width:800px;overflow:hidden">${n.content }</td>
				<td>${n.date }</td>
				<td><img src="D:/10.png" /></td>
				<td class="td-status"><span class="label label-success radius">${n.state }</span></td>
				<td class="td-manage">
					<c:if test="${n.state=='停用' }">
						<a style="text-decoration:none" style="display:block;" class="qiyong" href="javascript:;" title="启用"><span style="display:none;">${n.id }</span><i class="Hui-iconfont">&#xe631;</i></a>
					</c:if>
					<c:if test="${n.state=='启用' }">
						<a style="text-decoration:none" style="display:block;" class="tingyong" href="javascript:;" title="停用"><span style="display:none;">${n.id }</span><i class="Hui-iconfont">&#xe6e1;</i></a>	
					</c:if>
					<a href="javascript:;" onclick="article_add('添加新闻','<%=request.getContextPath()%>/news-info.do?id=${n.id }')" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/laypage/1.2/laypage.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/base.js"></script> 
<script type="text/javascript">
  	$(function(){
  		var a=$(".table tr").length-1;
  		$(".r strong").text(a);
  	});
</script>
<script type="text/javascript">
$(function(){
    $("td.contte").each(function () {
	    var content=$(this).html();
	    var content1 = content.replace(/@/g,"&");
		$(this).html(content1);
	});

	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[]}// 制定列不参与排序
		]
	});
	
});
/*资讯-添加*/
function article_add(title,url){
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
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
	});
}
</script> 
</body>
