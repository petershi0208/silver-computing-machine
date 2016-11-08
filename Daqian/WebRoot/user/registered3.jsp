<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="registered3_files/hm.js"></script><script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?7a4194d0e685be66c947452dc8646475";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大钱--信息注册页</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
<link href="<%=request.getContextPath()%>/registered3_files/register_share.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/registered3_files/register_succeed.css" rel="stylesheet" type="text/css">



<script type="text/javascript" src="<%=request.getContextPath()%>/registered3_files/jquery-1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/registered3_files/register_succeed.js"></script>



</head>
<body onload="startTimes();">
	<div class="registerMsg_Head_DIV">
		<center>
			<div id="top">
				<div class="registerMsg_Head_DIV_02">
					<div class="registerMsg_Head_DIV_03">
						<div class="registerMsg_Head_DIV_04">
							<a href="<%=request.getContextPath()%>/index.do">
								<div class="registerMsg_Head_DIV_05"></div>
								<div class="registerMsg_Head_logo"><img src="<%=request.getContextPath()%>/index_files/logo.png" width="159" height="48" /></div>
							</a>
							<div class="registerMsg_Head_title02"><img src="<%=request.getContextPath()%>/index_files/l.png" style="margin-left:15px; margin-top:-10px"/></div>
							<div class="registerMsg_Head_title03"><img src="<%=request.getContextPath()%>/index_files/ll.png" width="270" height="23" /></div>	
							<div class="registerMsg_Head_pojoDiv_01">
								<div class="registerMsg_Head_title04"></div>
								<div class="registerMsg_Head_registerText">注册</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>	
			<div class="registerMsg_Head_pojoDiv_02"></div>
			
			

			<form action="/webApplicationSign/registerSucceed" id="form" method="post">
				<div class="registerMsg_Head_pojoDiv_03">
					<div class="registerMsg_Head_pojoDiv_04"></div>
					
					<div class="registerMsg_step_Div">
						
						<div class="registerMsg_stepGreen">
							<span class="registerMsg_stepFont">1</span>		
						</div>
				
						<div class="registerMsg_stepGreen_Div"></div>
						
						<div class="registerMsg_stepGreen">
							<span class="registerMsg_stepFont">2</span>	
						</div>
						
						<div class="registerMsg_stepGreen_Div"></div>
						
						<div class="registerMsg_stepGreen">
							<span class="registerMsg_stepFont">3</span>			
						</div>	
					</div>
					
					<div class="registerMsg_pojoDiv_05"></div>
					
					<div class="registerMsg_pojoDiv_06">
						<span class="registerMsg_stepGreen_Font">填写用户信息</span>
						<span class="registerMsg_pojoDiv_07"></span>
						<span class="registerMsg_stepGreen_Font">手机信息验证</span>
						<span class="registerMsg_pojoDiv_08"></span>	
						<span class="registerMsg_stepGreen_Font">注册成功</span>
					</div>
								
					<div class="registerSucceed_pojoDiv_01"></div>
								
					<div class="registerSucceed_pojoDiv_02">
						
						
							<div class="registerSucceed_succeedImg"></div>
							<div class="registerSucceed_succeedDiv">
								恭喜<span style="color: #F53918;"></span>用户注册成功
							</div>		

							<div class="registerSucceed_pojoDiv_03">
														
								<div class="registerSucceed_pojoDiv_04"></div>
								<div class="registerSucceed_succeedHint" id="error">
									页面将在<span id="secondes" style="color:#F30;">8</span>秒后自动跳转 <a href="<%=request.getContextPath()%>/user/login.jsp" title="用户中心" style="color: blue;">用户登录</a>
								</div>
								<div class="registerSucceed_pojoDiv_04"></div>
								
								<div class="registerSucceed_succeedHint_02">如果此页面长时间不跳转，请手动操作</div>
								
								<div class="registerSucceed_pojoDiv_04"></div>
								<a href="<%=request.getContextPath()%>/user/login.jsp">
								<div class="registerSucceed_loginDiv">		
									<input value="登    录" title="登录" class="registerSucceed_loginInput" type="button">
								</div> </a>
										
							</div>
					</div>
					<hr class="registerSucceed_pojoDiv_05">
					<div class="registerSucceed_pojoDiv_06"></div>
				
				</div>
			</form>
			
		</center>
		<div class="registerMsg_pojoDiv_09"></div>
	</div>
	
	<script type="text/javascript" language="javascript">
  
</script>

<link href="<%=request.getContextPath()%>/registered3_files/foot.css" rel="stylesheet" type="text/css">


<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>


</body></html>