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
	<form action="borrow-list.do" method="post">
	<div class="text-c"> 日期范围：
		<input type="text" name="date1" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" name="date2" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
		<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> 
		<span class="l">
			<a href="javascript:;" onclick="member_add('添加产品','<%=request.getContextPath()%>/Administrator/template/product/products-add.jsp','','510')" class="btn btn-primary radius">
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
				<th width="80">用户名</th>
				<th width="80">产品名</th>
				<th width="80">待还本金</th>
				<th width="80">待还利息</th>
				<th width="80">借款时间</th>
				<th width="80">真实姓名</th>
				<th width="80">身份证</th>
				<th width="80">城市</th>
				<th width="60">学历</th>
				<th width="80">还款期限</th>
				<th width="100">上传的文件</th>
				<th width="60">状态</th>
				<th width="120">操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${blist }" var="b">
			<tr class="text-c">
				<td>${b.id }</td>
				<td>${b.username }</td>
				<td>${b.productname }</td>
				<td>${b.principal }</td>
				<td>${b.interest }</td>
				<td>${b.borrowdate }</td>
				<td>${b.realname }</td>
				<td>${b.card }</td>
				<td>${b.city }</td>
				<td>${b.graduate }</td>
				<td>${b.deadline }</td>
				<td>${b.file }</td>
				<td class="td-status"><span class="label label-success radius">${b.state }</span></td>
				<td class="td-manage1">
					<c:if test="${b.state=='待审核' }">
						<a style="text-decoration:none" style="display:block;" class="qiyong1" href="javascript:;" title="已审核"><span style="display:none;">${b.id }</span><i class="Hui-iconfont">&#xe631;</i></a>
					</c:if>
					<c:if test="${b.state=='已审核' }">
						<a style="text-decoration:none" style="display:block;" class="tingyong1" href="javascript:;" title="待审核"><span style="display:none;">${b.id }</span><i class="Hui-iconfont">&#xe6e1;</i></a>	
					</c:if>
				</td>
			</tr>
			</c:forEach>
			<div class="aaa">aaa</div>
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
	$('.aaa').click(function(){
		$('.show_iframe',parent.document).show().find("iframe").attr("href","/Daqian/subproduct-info.jsp.do");
	});
		
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
	$('.table-sort tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
});
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
