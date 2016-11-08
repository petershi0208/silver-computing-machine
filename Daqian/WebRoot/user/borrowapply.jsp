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
	
	<div style="width:100%;margin-top:110px;margin-bottom:0px;background-color:#f2f3f8;">
		<div class="first">
			<p>我要借款&nbsp;  
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
				<div class="registerMsg_stepGray_Div"></div>
				<div class="registerMsg_stepBack">
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
				<span class="registerMsg_stepGray_Font">资料审核</span>
				<span class="registerMsg_pojoDiv_08"></span>
				<span class="registerMsg_stepGray_Font">成功</span>
			</div>
			
			 <div class="point">
			 	<img src="<%=request.getContextPath()%>/borrow_files/personal.png"/>
			 	<p><img src="<%=request.getContextPath()%>/borrow_files/bell.png"/><span>温馨提示:我们将在您的必要认证资料上传齐全后为您提交审核</span></p>
			 </div>
			 
			 <form action="/Daqian/borrow.do"  method="post" enctype="multipart/form-data">
			 <div class="information">
			 	<p>
			 		<span>真实姓名&nbsp</span>
			 		<input value="${realname }" readonly="readonly" style="color:#969696;" id="realname" name="realname"/>
			 	</p>
			 	<p>
			 		<span>身份证号&nbsp</span>
			 		<input value="${card }" readonly="readonly" style="color:#969696;" id="card" name="card"/>
			 	</p>
			 	<p>
			 		<span>借款产品&nbsp</span>
			 		<input value="${product}" readonly="readonly" style="color:#969696;" id="product" name="product"/>
			 	</p>
			 	<p>
			 		<span>城市或省份</span>
			 		<input name="city" id="city"/>
			 		<span id="citytext" class="error"></span>
			 	</p>
			 	<p>
			 		<span>学历&nbsp&nbsp&nbsp</span>
			 		<select name="graduate" size="1" id="graduate">
					<!-- value是向服务器发送的数据，选择小学的时候则发送1 -->
						<option value="none">---请选择---</option>
			 			<option value="小学及以下">小学及以下</option>
			 			<option value="初中">初中</option>
			 			<option value="高中">高中</option>
			 			<option value="本科">本科</option>
			 			<option value="本科以上">本科以上</option>
					 </select>
					 <span id="graduatetext" class="error"></span>
			 	</p>
			 	 
			 	<p>
			 		<span>借款金额&nbsp</span>
			 		<input name="money" id="money"/>
			 		<span id="moneytext" class="error"></span>
			 	</p>
			 	<p>
			 		<span>借款期限&nbsp</span>
			 		<input name="day" id="day"/>
			 		<span id="daytext" class="error"></span>
			 	</p>
			 	<p class="warn" style="margin-bottom:0px;">
			 		<span>为此该产品借款最长期限，您可以根据你的财务状况灵活调整还款，提前还款不需要违约金和未来周期服务费</span>
			 	</p>
			 	<p>
			 		<span>您需要上传的资料有（如学生证，房产证）</span>
			 	</p>
			 	<p>
			 		<input type="file" id="file1" name="file1"/><br/>
			 		<input type="file" id="file2" name="file2"/><br/>
			 		<input type="file" id="file3" name="file3"/>
			 		<span id="filetext" class="error"></span>
			 	</p>
			 	
			 </div>			 		 
		</div>
				<input type="button" value="下一步" class="btn" id="btn"/>
			</form>
	</div>
	
	
	<div style="width:100%; margin:0;">
		<jsp:include page="foot.jsp"/>
	</div>
</body>
</html>
