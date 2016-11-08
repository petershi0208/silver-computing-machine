<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<title>大钱财富-安全中心</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/zczl.js"></script>		
		
		<script type="text/javascript">
		
		function disBlock(id){
			document.getElementById(id).style.display='block';
		}
		
		function disNone(id){
			document.getElementById(id).style.display='none';
		}
		
})
	</script>
	<link href="<%=request.getContextPath()%>/user/hyzx/css/head.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/user/hyzx/css/foot.css" rel="stylesheet" type="text/css">
	
	<link href="<%=request.getContextPath()%>/user/hyzx/css/security.css" rel="stylesheet" type="text/css">
	
	</head>
<body>
<div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"></div>
<div>
<!------------------------------------------------------右侧图标--------------------------------------------->
	<jsp:include page="right.jsp"></jsp:include>
	<!--------------------------------------------------头部开始--------------------------------------------->
	<div style="width:100%; margin:0;">
	<center>
		<jsp:include page="../header.jsp"></jsp:include>
	</center>
	</div>

<!---------------------------------------------------------------头部结束----------------------------------------------------------------------->
<!-----------------------------------------------------------------间隔------------------------------------------------------------------------->
	<div class="head_pojoDiv_05" style=" height:140px;"></div>
<!-----------------------------------------------------------------间隔------------------------------------------------------------------------->
<!---------------------------------------------------------------正文开始----------------------------------------------------------------------->
<div class="div_one_stratum">
	<div class="usercenter_navigationDiv_one">
<!---------------------------------------------------------------左侧开始----------------------------------------------------------------------->
	<jsp:include page="hyzxleft.jsp"></jsp:include>		
<!---------------------------------------------------------------左侧结束----------------------------------------------------------------------->
<!---------------------------------------------------------------右侧开始----------------------------------------------------------------------->
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/user/hyzx/css/hyzx.css">
		<div style="height:auto; width:770px;margin-top:15px; margin-left:20px; float:left; ">
			<div style="width:740px;  margin-left:20px; background-color:#FFFFFF">
				<div style="height:55px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;">
					<span class="hm20">安全信息</span>
				</div>
				<div style="height:20px;"></div>
				<div style="height:auto; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;" class="aaa">
					<div style="height:66px;">
						<div class="left w45m20" ><img src="<%=request.getContextPath()%>/user/hyzx/images/66985.png" /></div>
						<div class="h14 left w70">手机认证</div>
						<div class="r14 left w180">未认证（需绑定银行卡）</div>
						<div class="h14 left w350">用于实时收受资金变动，复审信息，找回密码等</div>
						<div class="r14 left w70"><span class="sjrz">认证</span></div>
					</div>
				</div>
				<div style="height:20px;"></div>
				<div style="height:66px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;" class="aaa">
					<div style="height:66px;">
						<div class="left w48m17"><img src="<%=request.getContextPath()%>/user/hyzx/images/669.png" /></div>
						<div class="h14 left w70">邮箱认证</div>
						<div class="r14 left w180">未认证</div>
						<div class="h14 left w350">用于接受资金变动，借款合同，电子账单，找回密码等</div>
						<div class="r14 left w70"><span class="yxrz">认证</span></div>
					</div>
				</div>
				
				
				<div style="height:20px;"></div>
				<div style="height:66px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;" class="aaa">
					<div style="height:66px;">
						<div class="left w48m17"><img src="<%=request.getContextPath()%>/user/hyzx/images/889.png" /></div>
						<div class="h14 left w70">实名认证</div>
						<div class="r14 left w180" id="check1">未认证</div>
						<div class="h14 left w350">用于进行资金账户操作，保证您的资金安全</div>
						<div class="r14 left w70"><span class="smrz" id="check">认证</span></div>
					</div>
				</div>
				<div id="read" class="read" style="display:none">
					<p>真实姓名&nbsp&nbsp&nbsp&nbsp&nbsp <input value="${realname }" id="dbname" readonly="readonly"/></p>
					<p>身份证号码&nbsp <input value="${card}" id="dbcard" readonly="readonly"/></p>
				</div>
				
				<div id="checkname" class="checkname" style="display:none;">
				<form action="<%=request.getContextPath()%>/checkcard.do" method="post">
					<p style="color:#878787;">为了您的账户安全，请认真填写以下内容，一旦通过实名认证，信息不能修改</p>
					<p>真实姓名&nbsp&nbsp&nbsp&nbsp&nbsp <input name="realname" id="realname"/></p>
					<p>身份证号码&nbsp <input name="card" id="card"/></p>					
					<input id="comfirm" value="确认" type="button"/>		
				</form>			
				</div>
				
				
				<div style="height:20px;"></div>
				<div style="height:66px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;" class="aaa">
					<div style="height:66px;">
						<div class="left w45m20"><img src="<%=request.getContextPath()%>/user/hyzx/images/mms.png" /></div>
						<div class="h14 left w70">登录密码</div>
						<div class="r14 left w180">已认证</div>
						<div class="h14 left w350">用于保护您的账户安全。请尽早设置复杂的密码</div>
						<div class="r14 left w70"><span class="dlmm" ><a href="/Daqian/user/forgot.jsp" style="color:red;">修改</a></span></div>
					</div>
				</div>
				
				<div style="height:20px;"></div>
				<div style="height:66px; width:740px; line-height:55px; border-bottom:1px #e5e5e5 solid;" class="aaa">
					<div style="height:66px;">
						<div class="left w45m20"><img src="<%=request.getContextPath()%>/user/hyzx/images/123.png" /></div>
						<div class="h14 left w70">交易密码</div>
						<div class="r14 left w180">已认证</div>
						<div class="h14 left w350">用于提现等操作，请不要与登录密码相同<a>（忘记？）</a></div>
						<div class="r14 left w70"><span class="jymm" id="changepay" >修改</span></div>
					</div>
				</div>
				<div id="changepwd" class="changepwd" style="display:none;">
				<form action="/Daqian/changepaypwd.do" method="post">
					<p style="color:#878787;">初始密码为登录密码,请尽快修改</p>
					<p>原交易密码&nbsp&nbsp<input type="password" id="oldpwd"></p>
					<p>新交易密码&nbsp&nbsp<input type="password" id="newpwd1"/></p>
					<p>确认交易密码&nbsp<input type="password" id="newpwd2"/></p>
					<p class="p4">验证码&nbsp&nbsp&nbsp&nbsp<input style="width:100px;" id="code"/>
					<img src="/Daqian/checkpaycode.do" onclick="this.src='/Daqian/checkpaycode.do?'+Math.random();"/>
					</p>
					
					<input id="btn" class="btn" type="button" value="提交" onclick="btnform();"/>
				</form>
				</div>
				<div style="height:30px;"></div>
			</div>
		</div>
<!---------------------------------------------------------------右侧结束----------------------------------------------------------------------->
	</div>
</div>
<!---------------------------------------------------------------正文结束----------------------------------------------------------------------->	



<!--------------------------------------------------底部开始--------------------------------------------->
<!-- WPA Button Begin 
<script charset="utf-8" type="text/javascript" src="http://wpa.b.qq.com/cgi/wpa.php?key=XzkzODAwMDY3MV8yNzE5NThfNDAwODIwMzI4OF8"></script>
 WPA Button End -->


<jsp:include page="../foot.jsp"></jsp:include>

<!--------------------------------------------------底部开始--------------------------------------------->

	</div>
</body>

		
<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/security.js"></script>
</html>

