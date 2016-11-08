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
<link href="<%=request.getContextPath()%>/Administrator/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/Administrator/css/chosen.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/Administrator/css/ace.min.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
  </head>
  
<body>
<div class="pd-20">
  <form action="/Daqian/products-update2.do" method="post" class="form form-horizontal addfrom" id="form-member-add">
    <input type="text" name="pid" value="${p.pid }" style="display: none;" />
  <input type="text" name="sid" value="${s.sid }" style="display: none;" />
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>产品名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text isproduct" value="${p.productname }" placeholder="请输入产品名" id="productname" name="productname" datatype="*2-16" nullmsg="产品名不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>周期：</label>
      <div class="formControls col-5">
      <select name="cycle">
     	 <option value="${p.cycle }">${p.cycle }月</option>
      		<option value="1">1月</option>
      		<option value="2">2月</option>
      		<option value="3">3月</option>
      		<option value="4">4月</option>
      		<option value="5">5月</option>
      		<option value="6">6月</option>
      		<option value="7">7月</option>
      		<option value="8">8月</option>
      		<option value="9">9月</option>
      		<option value="10">10月</option>
      		<option value="11">11月</option>
      		<option value="12">12月</option>
      		<option value="13">13月</option>
      		<option value="14">14月</option>
      		<option value="15">15月</option>
      		<option value="16">16月</option>
      		<option value="17">17月</option>
      		<option value="18">18月</option>
      		<option value="19">19月</option>
      		<option value="20">20月</option>
      		<option value="21">21月</option>
      		<option value="22">22月</option>
      		<option value="23">23月</option>
      		<option value="24">24月</option>
      		<option value="25">25月</option>
      		<option value="26">26月</option>
      		<option value="27">27月</option>
      		<option value="28">28月</option>
      		<option value="29">29月</option>
      		<option value="30">30月</option>
      		<option value="31">31月</option>
      		<option value="32">32月</option>
      		<option value="33">33月</option>
      		<option value="34">34月</option>
      		<option value="35">35月</option>
      		<option value="36">36月</option>
      	</select>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>金额：</label>
      <div class="formControls col-1">
        <input type="text" class="input-text" value="${p.lastmoney }" placeholder="请输入金额" id="money" name="money"  datatype="n" nullmsg="金额不能为空"><div class="col-4" style="font-size:20px;">元</div>
      </div>
      <div class="col-4"> </div>
    </div>
     <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>年化回报率：</label>
      <div class="formControls col-1">
        <input type="text" class="input-text" value="${s.yearreturn }" placeholder="年化回报率" id="yearreturn" name="yearreturn"  datatype="n" nullmsg="年化回报率">
      </div>
      <div class="col-4" style="font-size:20px;">%</div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>到期回报率：</label>
      <div class="formControls col-1">
        <input type="text" class="input-text" value="${s.duereturn }" placeholder="到期回报率" id="duereturn" name="duereturn"  datatype="n" nullmsg="到期回报率">
      </div>
      <div class="col-4" style="font-size:20px;">%</div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>债务人：</label>
      <div class="formControls col-5">
      	<select class="width-40 chosen-select" id="form-field-select-3" name="sperson" data-placeholder="请选择债务人">
				<option value="${cc.id }">${cc.uname } -- <span style="float: right;">${cc.date }</span></option>
				<c:forEach var="cr" items="${creditor }">
					<option value="${cr.id }">${cr.uname } -- <span style="float: right;">${cr.date }</span></option>
				</c:forEach>
		</select>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <div class="col-9 col-offset-3">
        <input class="btn btn-primary radius isbtn1" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
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
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/chosen.jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".addfrom").Validform();
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
});
</script>
<script type="text/javascript">
			jQuery(function($) {
				

			
				$(".chosen-select").chosen(); 
			
			
			
			
			
			});
		</script>
</body>
</html>