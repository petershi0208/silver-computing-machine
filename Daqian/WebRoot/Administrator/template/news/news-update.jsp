<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'news-add.jsp' starting page</title>
    
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
<link href="<%=request.getContextPath()%>/Administrator/lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->


  </head>
  
<body onload="setContent()">
	<div class="pd-20 form form-horizontal">
		 <a class="btn btn-success radius r mr-20" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
		<input type="text" style="display:none" value="${news.id }" id="newsid" >
		<div class="row cl" >
			<label class="form-label col-2" ><span class="c-red">*</span>文章标题：</label>
			<div class="formControls col-10">
				<input type="text" class="input-text" value="${news.title }" placeholder="" id="tt" name="title">
			</div>
		</div>
		<div style="height:20px;"></div>
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>添加图片：</label>
			<div class="formControls col-10">
				<form id="myForm" method="post" enctype="multipart/form-data" action="fileload.do" target="hidden_frame">  
				File: <input type="file" name="myFile" value="aaaa" id="myFile"/>
				<input type="button" value="上传" onclick="changeform(this)"/><span id="imgg">请添加图片,不添加图片为原图片</span>             
				</form>  
				<iframe name='hidden_frame' id="hidden_frame" style="display:none" mce_style="display:none"></iframe>
			</div>
		</div>
		<div style="height:20px;"></div>
		
		<div class="row cl">
			<label class="form-label col-2"><span class="c-red">*</span>文章内容：</label>
			<div class="formControls col-10"> 
				<script id="editor" type="text/plain" style="width:100%;height:400px;"></script> 
			</div>
			
		</div>
		<div class="row cl" style="display:none;">
			<label class="form-label col-2"><span class="c-red">*</span>文章内容：</label>
			<input/>
			<div  id="newscontent" >${news.content }</div>
		</div>
		<div class="row cl">
			<div class="col-10 col-offset-2">
				<button onClick="setContent()" class="btn btn-primary radius" type="button"><i class="Hui-iconfont">&#xe623;</i> 点击获取文章内容</button>
				<button onClick="getUpdate();" class="btn btn-primary radius aaa" type="submit"><i class="Hui-iconfont">&#xe632;</i> 修改</button>
				<button onClick="javascript:location.replace(location.href);" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
</div>



<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/jquery/1.9.1/jquery.min.js"></script> 

<script type="text/javascript" src="lib/layer/1.9.3/layer.js"></script> 
<script type="text/javascript" src="lib/My97DatePicker/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="lib/Validform/5.3.2/Validform.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/icheck/jquery.icheck.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath()%>/Administrator/js/base.js"></script> 

<script type="text/javascript">
$(function(){
	var ue = UE.getEditor('editor');
});


</script>



<script type="text/javascript">
//获得数据
function setContent(isAppendTo) {
    var arr = [];
    var content=$("#newscontent").html();
    var content1 = content.replace(/@/g,"&");
    UE.getEditor('editor').setContent(content1, isAppendTo);
}

function changeform(btn){  
	var id = document.getElementById("myFile").value;
	if(id!=null && id!=""){
		var formnode = btn.parentNode; 
		formnode.submit();	
		document.getElementById("imgg").innerHTML="添加成功";
		alert("添加成功");
	}else{
		document.getElementById("imgg").innerHTML="添加失败"; 
		alert("请添加图片");
	}     
}
</script>
</body>
</html>
