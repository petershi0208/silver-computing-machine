<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<c:if test="${admin.username == 'admin' }">
<div class="pd-20">
  <form action="/Daqian/addadmin.do" method="post" class="form form-horizontal addform" id="form-member-add">
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>用户名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text username" value="" placeholder="请输入用户名" id="username" name="username" datatype="*" nullmsg="">
        <span class="vusername" style="display: none;"></span>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>密码：</label>
      <div class="formControls col-5">
        <input type="password" class="input-text password" value="" placeholder="请输入密码" id="password" name="password" datatype="*" nullmsg="请输入密码">
        <span class="vpassword" style="display: none;"></span>
      </div>
      <div class="col-4"> </div>
    </div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>确认密码：</label>
      <div class="formControls col-5">
        <input type="password" class="input-text repwd" value="" placeholder="确认密码" id="repwd" name="repwd" datatype="*" nullmsg="请输入密码">
        <span class="vrepwd" style="display: none;"></span>
      </div>
      <div class="col-4"> </div>
    </div>
   <!-- 
   <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>获取验证码：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text code" style="width: 60%;" value="" placeholder="请输入验证码" id="code" name="code" datatype="n" nullmsg="请输入验证码">
        <input type="button" class="input-text valider phoneva" value="获取验证码" style="width: 39.4%; font-size: 16px; cursor: pointer;" id="cycle" name="cycle" datatype="*" nullmsg="请输入金额">
      </div>
      <div class="col-4"> </div>
    </div>
     -->
    <div class="row cl">
      <div class="col-9 col-offset-3">
        <input class="btn btn-primary radius addbtn" type="button" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
      </div>
    </div>
  </form>
  <input type="text" class="res" value="${res }" style="display: none;">
</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/layer/1.9.3/layer.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.admin.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/adminvalid.js"></script>
<script type="text/javascript">
$(function(){
	var res = $(".res").val();
	if(res!=""){
		if(res>0){
			alert("添加成功");
		}
	}
	$(".addfrom").Validform();
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
});
</script>
</c:if>
</body>
</html>