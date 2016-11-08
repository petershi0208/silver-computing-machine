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
  <form action="/Daqian/ht/creditor-update1.do" method="post" class="form form-horizontal addfrom" id="form-member-add">
  	<div style="font-size: 22px;">基本信息</div>
  	<input type="text" style="display:none;" value="${creditor.id }" name="id" />
  	<input type="text" style="display:none;" value="${res }" class="res" name="res" />
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>姓名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text uname" value="${creditor.uname }" placeholder="请输入姓名" id="uname" name="uname" datatype="*2-16" nullmsg="姓名不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>性别：</label>
      <div class="formControls col-5">
      	<c:if test="${creditor.sex=='男' }">
      	<input type="radio" name="sex" value="男" checked="checked" />男
      	<input type="radio" name="sex" value="女"/>女
      	</c:if>
      	<c:if test="${creditor.sex=='女' }">
      	<input type="radio" name="sex" value="男"/>男
      	<input type="radio" name="sex" value="女" checked="checked" />女
      	</c:if>
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>婚姻状况：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text marital" value="${creditor.marital }" placeholder="请输入婚姻状况" id="marital" name="marital" datatype="" nullmsg="婚姻状况不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>身份证号：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text idcard" value="${creditor.idcard }" placeholder="请输入身份证号" id="idcard" name="idcard" datatype="" nullmsg="身份证号不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>年龄：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text age" value="${creditor.age }" placeholder="请输入年龄" id="age" name="age" datatype="" nullmsg="年龄不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>手机：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text phone" value="${creditor.phone }" placeholder="请输入手机" id="phone" name="phone" datatype="" nullmsg="手机不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>固定电话：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text telephone" value="${creditor.telephone }" placeholder="请输入固定电话" id="telephone" name="telephone" datatype="" nullmsg="固定电话不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red">*</span>申请金额：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text money" value="${creditor.money }" placeholder="请输入申请金额" id="money" name="money" datatype="" nullmsg="申请金额不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>本地房产：</label>
      <div class="formControls col-5">
      	<c:if test="${creditor.localhouse=='有' }">
      		<input type="radio" name="localhouse" value="有" checked="checked" />有
      		<input type="radio" name="localhouse" value="无"/>无
      	</c:if>
      	<c:if test="${creditor.localhouse=='无' }">
      		<input type="radio" name="localhouse" value="有" />有
      		<input type="radio" name="localhouse" value="无" checked="checked"/>无
      	</c:if>
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>居住状况：</label>
      <div class="formControls col-5">
      	<input type="radio" name="live" value="自建"/>自建
      	<input type="radio" name="live" value="自购"/>自购
      	<input type="radio" name="live" value="租用"/>租用
      	<input type="radio" name="live" value="单位"/>单位
      	<input type="radio" name="live" value="与父母同住"/>与父母同住
      	
        <input type="text" class="live" value="${creditor.live }" style="display: none;">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>社保：</label>
      <div class="formControls col-5">
      	<c:if test="${creditor.sociensure=='有' }">
      		<input type="radio" name="sociensure" value="有" checked="checked" />有
      		<input type="radio" name="sociensure" value="无"/>无
      	</c:if>
      	<c:if test="${creditor.sociensure=='无' }">
      		<input type="radio" name="sociensure" value="有" />有
      		<input type="radio" name="sociensure" value="无" checked="checked"/>无
      	</c:if>
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>公积金：</label>
      <div class="formControls col-5">
      	<c:if test="${creditor.commpf=='有' }">
      		<input type="radio" name="commpf" value="有" checked="checked" />有
      		<input type="radio" name="commpf" value="无"/>无
      	</c:if>
      	<c:if test="${creditor.commpf=='无' }">
      		<input type="radio" name="commpf" value="有" />有
      		<input type="radio" name="commpf" value="无" checked="checked"/>无
      	</c:if>
      </div>
      <div class="col-4"> </div>
    </div>
    <div style="font-size: 22px;">单位信息</div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>单位名称：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text unit_name" value="${creditor.unit_name }" placeholder="请输入单位名称" id="unit_name" name="unit_name" datatype="" nullmsg="单位名称不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>单位地址：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text unit_site" value="${creditor.unit_site }" placeholder="请输入单位地址" id="unit_site" name="unit_site" datatype="" nullmsg="单位地址不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>单位性质：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text unit_nature" value="${creditor.unit_nature }" placeholder="请输入单位性质" id="unit_nature" name="unit_nature" datatype="" nullmsg="单位性质不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>单位电话：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text unit_phone" value="${creditor.unit_phone }" placeholder="请输入单位电话" id="unit_phone" name="unit_phone" datatype="" nullmsg="单位电话不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>职位：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text position" value="${creditor.position }" placeholder="请输入职位" id="position" name="position" datatype="" nullmsg="职位不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>学历：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text education" value="${creditor.education }" placeholder="请输入学历" id="education" name="education" datatype="" nullmsg="学历不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>工资收入：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text wages" value="${creditor.wages }" placeholder="请输入工资收入" id="wages" name="wages" datatype="" nullmsg="工资收入不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    <div style="font-size: 22px;">家庭情况</div>
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>家庭人数：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text home_number" value="${creditor.home_number }" placeholder="请输入家庭人数" id="home_number" name="home_number" datatype="" nullmsg="家庭人数不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>户籍地地址：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text home_registry" value="${creditor.home_registry }" placeholder="请输入户籍地地址" id="home_registry" name="home_registry" datatype="" nullmsg="户籍地地址不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>户号：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text home_registryid" value="${creditor.home_registryid }" placeholder="请输入户号" id="home_registryid" name="home_registryid" datatype="" nullmsg="户号不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>现居住地：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text address" value="${creditor.address }" placeholder="请输入现居住地" id="address" name="address" datatype="" nullmsg="现居住地不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>微信：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text wechat" value="${creditor.wechat }" placeholder="请输入微信" id="wechat" name="wechat" datatype="" nullmsg="微信不能为空">
      </div>
      <div class="col-4"> </div>
    </div>
 	 <div style="font-size: 22px;">家庭成员信息</div> 		
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人1：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela1" value="${creditor.rela1 }" placeholder="请输入关系人1" id="rela1" name="rela1">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人1姓名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela1_name" value="${creditor.rela1_name }" placeholder="请输入关系人1姓名" id="rela1_name" name="rela1_name">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人1电话：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela1_phone" value="${creditor.rela1_phone }" placeholder="请输入关系人1电话" id="rela1_phone" name="rela1_phone">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人2：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela2" value="${creditor.rela2 }" placeholder="请输入关系人2" id="rela2" name="rela2">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人2姓名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela2_name" value="${creditor.rela2_name }" placeholder="请输入关系人2姓名" id="rela2_name" name="rela2_name">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人2电话：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela2_phone" value="${creditor.rela2_phone }" placeholder="请输入关系人2电话" id="rela2_phone" name="rela2_phone">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人3：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela3" value="${creditor.rela3 }" placeholder="请输入关系人3" id="rela3" name="rela3">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人3姓名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela3_name" value="${creditor.rela3_name }" placeholder="请输入关系人3姓名" id="rela3_name" name="rela3_name">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人3电话：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text rela3_phone" value="${creditor.rela3_phone }" placeholder="请输入关系人3电话" id="rela3_phone" name="rela3_phone">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人1姓名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text contact1_name" value="${creditor.contact1_name }" placeholder="请输入关系人1姓名" id="contact1_name" name="contact1_name">
      </div>
      <div class="col-4"> </div>
    </div>
    <div style="font-size: 22px;">联系人信息</div> 		
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人1电话：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text contact1_phone" value="${creditor.contact1_phone }" placeholder="请输入关系人1电话" id="contact1_phone" name="contact1_phone">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人2姓名：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text contact2_name" value="${creditor.contact2_name }" placeholder="请输入关系人2姓名" id="contact2_name" name="contact2_name">
      </div>
      <div class="col-4"> </div>
    </div>
    	
    <div class="row cl">
      <label class="form-label col-3"><span class="c-red"></span>关系人2电话：</label>
      <div class="formControls col-5">
        <input type="text" class="input-text contact2_phone" value="${creditor.contact2_phone }" placeholder="请输入关系人2电话" id="contact2_phone" name="contact2_phone">
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
	var live = $(".live").val();
	$("input[name='live']").each(function(){
		if($(this).val()==live){
			$(this).attr("checked","checked");
		}
	})
	var res = $(".res").val();
	if(res=="-1"){
		alert("修改失败");
		}
	if(res=="1"){
		alert("修改成功");
		}
	$(".addfrom").Validform();
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
});
</script>
</body>
</html>