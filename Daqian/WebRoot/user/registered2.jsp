<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><script src="registered2_files/hm.js"></script><script>
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
<link href="<%=request.getContextPath()%>/registered2_files/register_share.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/registered2_files/register_verify.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/registered2_files/jquery-1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/registered2_files/register_verify.js"></script>
</head>
<body>
 
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
			
			
		
			<form action="/Daqian/registtwo.do" id="form" method="post">
		<!--   	 <input id="reg_name" name="reg_name" value="44944" type="hidden">
             <input id="password" name="password" value="l44944" type="hidden">
             <input type="hidden" id="email" name="email" value=""/> 
             <input id="refereeMobile" name="refereeMobile" value="" type="hidden">
             <input id="reg_type" name="reg_type" value="manageMoney" type="hidden"> 
             -->
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
						
						<div class="registerMsg_stepGray_Div"></div>
						
						<div class="registerMsg_stepBack">
							<span class="registerMsg_stepFont">3</span>			
						</div>	
					</div>
					
					<div class="registerMsg_pojoDiv_05"></div>
					
					<div class="registerMsg_pojoDiv_06">
						<span class="registerMsg_stepGreen_Font">填写用户信息</span>
						<span class="registerMsg_pojoDiv_07"></span>
						<span class="registerMsg_stepGreen_Font">手机信息验证</span>
						<span class="registerMsg_pojoDiv_08"></span>
						<span class="registerMsg_stepGray_Font">注册成功</span>
					</div>
								
					<div class="registerVrify_pojoDiv_01"></div>
								
					<div class="registerVrify_pojoDiv_02">
					  <div class="registerVrify_pojoDiv_03"></div>	
						<div class="registerVrify_phoneText">手机号码</div>	
						
						
						<div class="registerVrify_phoneDiv">
							<input id="mobile" name="mobile" value="${phone}" readonly="readonly" class="registerVrify_phoneNumber" type="text">
							
						</div>	
						
						
						<div class="registerVrify_pojoDiv_03"></div>	
						<div class="registerVrify_vrifyText">验证码</div>	
						
						
						<div class="registerVrify_vrifyDiv">
							<input  name="checkcode" id="verification" title="务必不要将验证码告知他人" value="输入验证码" class="registerVrify_vrifyNumber" onfocus="clickVerification(this.value,'verification')" onmouseout="SmsValidate()" maxlength="6" type="text">
							
						</div>	

						<div class="registerVrify_vrifyHint">					
							<input id="send" title="发送手机验证码" value="获取验证码" style="width: 110px; height: 32px; background-color: WHITE; border: 0px; outline: none; cursor: pointer; margin-top: -5px; border-radius:5px; -webkit-border-radius: 5px; color: #666666; border:1px solid #CCC; font-family: Microsoft YaHei;" 
									 type="button">
						</div>
							
						<div class="registerVrify_pojoDiv_04">
							<div style="width: 140px; height: 20px; float: left;"></div>
							<div id="verificationText" style="width: 200px; height: 20px; float: left; color: red; font-size: 13px; text-align: left; margin-top: 5px; font-family: Microsoft YaHei;"></div>
						</div>												
						<div class="registerVrify_pojoDiv_05"></div>	
						
						
						<div class="registerVrify_vrifybtnDiv">
							<input value="验证" title="手机验证" onclick="btnSmsValidate(this);" class="registerVrify_vrifyBTN" type="button">
						</div>	
							
				  </div>
					
					
					<hr class="registerVrify_pojoDiv_09">
				</div>
				<input id="code" style="display: none;">
				<input id="uu" style="display: none;" name="username" value="${registname}">
				<input id="cc" style="display: none;" name="password" value="${password}">
				<input id="tt" style="display: none;" name="type" value="${type}">
			</form>
		</center>
		
		<div class="registerMsg_pojoDiv_09"></div>
	</div>
	
	
	<div id="registerVerify_hint" class="msg_hint_DIV"></div>	
<!--	
	<div id="registerVerify_hint_DIV" style="display:none; width:350px; height:10px; background-color: #FFF; z-index: 110; position:absolute; ">	
		<div class="a">
			<div class="b"> 
				<div class="c">
        			<div style="width:190px; height:12px; background-color: #FFF;"></div>
        			<span style="font-size: 16px; font-family:Microsoft YaHei; color: red; font: bold;">&nbsp;&nbsp;验证</span>
					<div style="width:10px; height:10px; float:right;"></div>
    				<div id="close_registerVerify" title="关闭" style="width:18px; height:18px; background-image:url('../new_style/web_image/user_center/close_img_02.png'); background-repeat:no-repeat; float:right; cursor:pointer; "></div>
   					<div style="width:325px; clear:right; ">
   						<div style="width: 20px; height: 80px; float: left;"></div>
   		 				<div style="width: 300px; height: 80px; float: left;">
   		 				<div style="width: 300px; height: 15px;"></div>
   		 					<div style="width: 290px; height: 70px; margin-left: 10px;">
   		 						<div style="float: left; width: 170px; height: 40px;">
   		 							<span style="font-size: 15px; font-family:Microsoft YaHei; color: #555555;">验证码</span>
   		 							<input id="verificationCode" style="width: 100px; height: 30px; " type="text">
   		 						</div>
   		 						<div style="float: left; width: 120px; height: 40px;">
   		 							<img id="imgs" src="registered2_files/getImg.jpg" alt="验证码" title="点击刷新验证码" style="cursor: pointer;" onclick="refreshValidation('imgs')">
   		 						</div>
   		 						<div style="width: 50px; height: 20px;  clear: left; float: left;"></div>
   		 						<div id="erroe_code" style="width: 160px; height: 20px; float: left; font-family:Microsoft YaHei; text-align: left; font-size: 12px;"></div>
   		 					</div>			
   		 				</div>
           	 		</div>
           	 		<center>
	            		<div style="clear:left;  width: 90px; height: 22px; ">
		            		<div id="verification_code" style="float:left; width: 85px; height: 22px; background-color: #3598d8; border-radius:5px; -webkit-border-radius: 5px; cursor: pointer; color: #FFF; font-family:Microsoft YaHei; font-size: 15px;">验证</div>
	            		</div>
	            	</center>  	
    		   </div>
  			</div>  
		</div>	
	</div>
-->	
	


<link href="<%=request.getContextPath()%>/registered2_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>
</body>

<script type="text/javascript">
//验证码倒计时
var wait=60;
document.getElementById("send").onclick=function(){time(this);}
function time(o) {
var reg = "^1[3|4|5|8][0-9]{9}$";
var value=$('#mobile').val();
   if(value.match(reg)){
	   if(wait == 0) {
            o.removeAttribute("disabled");           
            o.value="获取验证码";
            wait = 60;
       }else{
            o.setAttribute("disabled", true);
            o.value="重新发送(" + wait + ")";
            wait--;
            setTimeout(function(){
                time(o)
             },
         1000)
	   }
   }
}
</script>
</html>