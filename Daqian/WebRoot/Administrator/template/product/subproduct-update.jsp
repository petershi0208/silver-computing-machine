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
    
    <title>My JSP 'products-add.jsp' starting page</title>
    
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
<link href="<%=request.getContextPath()%>/Administrator/lib/icheck/icheck.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/Administrator/lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
  </head>
  
<body>
<div class="pd-20">
  <form action="/Daqian/products-add.do" method="post" class="form form-horizontal" id="form-member-add">
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>产品名：</label>
      <div class="formControls col-5">
      	<select class="select" name="productname" value="${s.pid }" size="1">
      		<c:forEach items="${plist }" var="p" >
      		<c:if test="${p.pid==s.pid }">
      			<option value="${p.pid }" selected="selected">${p.productname }</option>
      		</c:if>
      		<c:if test="${p.pid!=s.pid }">
			<option value="${p.pid }">${p.productname }</option>
			</c:if>
			</c:forEach>
		</select>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>最小金额：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text" value="${s.minamount }" placeholder="请输入最小金额" id="cycle" name="cycle"  datatype="m" nullmsg="最小金额不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
     <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>最大金额：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text" value="${s.maxamount }" placeholder="请输入最大金额" id="minmoney" name="minmoney"  datatype="m" nullmsg="最大金额不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
     <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>年回报率：</label>
      <div class="formControls col-5">
        <input type="text" style="width:205px;" class="input-text" value="${s.yearreturn }" placeholder="请输入年回报率" id="maxmoney" name="maxmoney"  datatype="m" nullmsg="年回报率不能为空">
     	<span>%</span>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>到期回报率：</label>
      <div class="formControls col-5">
        <input type="text" style="width:205px;" class="input-text" value="${s.duereturn }" placeholder="请输入到期回报率" name="lastmoney" id="lastmoney" datatype="e" nullmsg="到期回报率不能为空！">
      	<span>%</span>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>付息方式：</label>
      <div class="formControls col-5">
        <select class="select" name="productname" value="${s.monthoryear }" size="1">
        	<c:if test="${s.monthoryear==1 }">
			<option value="1" selected="selected">月付</option>
			<option value="2">年付</option>
			</c:if>
			<c:if test="${s.monthoryear==2 }">
			<option value="1">月付</option>
			<option value="2" selected="selected">年付</option>
			</c:if>
		</select>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <div class="col-9 col-offset-3">
        <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
      </div>
    </div>
  </form>
</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.admin.js"></script>
<script type="text/javascript">
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
		
	$("#form-member-add").Validform({
		tiptype:2,
		callback:function(form){
			form[0].submit();
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});
</script>
</body>
</html>