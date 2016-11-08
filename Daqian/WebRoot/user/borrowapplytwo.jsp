<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>大钱--借款申请</title>
	<link rel="shortcut icon" href="/Daqian/image/5987.ico">
	<script src="<%=request.getContextPath()%>/borrow_files/jquery-1.js" type="text/javascript"></script>
	<link href="<%=request.getContextPath()%>/borrow_files/head.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/borrow_files/foot.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/borrow_files/borrow_share.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/borrow_files/borrowapply.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/js/head.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/borrow_files/borrowapply.js" type="text/javascript"></script>
  </head>
  
  <body>
	<div style="width:100%; margin:0;">
		<center>
			<jsp:include page="header.jsp"/>
		</center>
	</div>
	<div style="width:100%;margin-top:110px;background-color:#f2f3f8;">	
		<div class="first">
			<p>t我要借款&nbsp;   
				<i>&gt;</i>&nbsp;产品介绍&nbsp;
				<i>&gt;</i>&nbsp;
				<span>填写借款申请</span>
			</p>
		</div>
		
		<div class="center">	
			<div class="registerMsg_Head_pojoDiv_04"></div>
			<div class="registerMsg_step_Div">
				<div class="registerMsg_stepGreen1">
					<span class="registerMsg_stepFont">1</span>		
				</div>
				<div class="registerMsg_stepGreen_Div"></div>
				<div class="registerMsg_stepGreen1">
					<span class="registerMsg_stepFont">2</span>	
				</div>
				<div class="registerMsg_stepGray_Div"></div>
				<div class="registerMsg_stepBack">
					<span class="registerMsg_stepFont">3</span>			
				</div>	
			</div>
			<div class="registerMsg_pojoDiv_05"></div>
			<div class="registerMsg_pojoDiv_06">
				<span class="registerMsg_stepGreen_Font">填写借款申请</span>
				<span class="registerMsg_pojoDiv_07"></span>
				<span class="registerMsg_stepGreen_Font">资料审核</span>
				<span class="registerMsg_pojoDiv_08"></span>
				<span class="registerMsg_stepGray_Font">成功</span>
			</div>
			
			<p class="text">资料审核</p>
			
			<div class="point2">
			 	<p><img src="<%=request.getContextPath()%>/borrow_files/bell.png"/><span>温馨提示:您的借款申请我们将尽快为你审核完成，请耐心等待</span></p>
			</div>
			
			<p class="text2">借款申请</p>
			<p class="text3">
				<span>借款金额</span><input readonly="readonly" value="${money}"/>元
			</p>
			<p class="text3">
				<span>借款期限</span><input readonly="readonly" value="${deadline }"/>
			</p>
			<p class="text3">
				<span>审核状态</span><input readonly="readonly" value="审核中"/>
			</p>
			
			<p class="text4">
				为此该产品借款最长期限，您可以根据您的财务状况灵活调整还款，提前还款不需要违约金和未来周期
				服务费，上传证件后由我们的工作人员进行审核，审核通过后会以电话的方式通知你
			</p>	
		</div>
			<input type="button" value="审核中" class="btn2" id="btn2"/>
	</div>
	
	<div style="width:100%; margin:0;">
		<jsp:include page="foot.jsp"/>
	</div>
  </body>
</html>
