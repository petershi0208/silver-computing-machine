<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML5>
<html>
  <head>
    <title>会员中心-账号安全</title> 
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico"> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	 
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	<link href="<%=request.getContextPath()%>/newMemberCenter/popbox/style.css" rel="stylesheet" type="text/css">
	<!-- Bootstrap -->
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/bootstrap.min.css">
	
	
	
	
	
  </head>
  <body class="updateinform">
  	<input type="hidden" value="${user.email}" id="email"/>
  	<input type="hidden" value="${user.realname}" id="realname"/>
  	<input type="hidden" value="${user.pwdproblem}" id="pwdproblem"/>
  	<input type="hidden" value="${user.telephone}" id="telephone"/>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="center">
		<jsp:include page="memberleft.jsp"></jsp:include>
		<div class="center_right">
			<div class="center_right_info">
				<span>账号安全</span>
				<img src="/Yqwan/newMemberCenter/images/hyxh.png" width=750/>
			</div>			
			<div class="cente_right_detail">
				<div class="cente_right_detail_line">
					<div>账号安全</div>
					<div class="cente_right_detail_line_bg">
						<div id="orangeline"></div>
					</div>
					<span>账号安全：</span>
					<span id="securitys">中</span>
				</div>
				<div class="cente_right_detail_info">
					<div class="cente_right_detail_info_one">
						<div class="cente_right_detail_info_one_img">
							<img src="/Yqwan/newMemberCenter/images/zhzl.png"/>
						</div>
						<div class="cente_right_detail_info_one_text">
							<span>账号资料状态</span><span>这有助于你的账号资料安全</span>
						</div>
						<div class="cente_right_detail_info_one_state">
							<span id="wanshan">完善50%</span>
						</div>
						<a href="/Yqwan/newMemberCenter/updateInformation.jsp" target="_blank">
							<div class="cente_right_detail_info_one_button">
								完善账户资料
							</div>
						</a>
					</div>
					<div class="cente_right_detail_info_one">
						<div class="cente_right_detail_info_one_img">
							<img src="/Yqwan/newMemberCenter/images/mmts.png"/>
						</div>
						<div class="cente_right_detail_info_one_text">
							<span>密码提示问题状态</span><span>方便找回密码</span>
						</div>
						<div class="cente_right_detail_info_one_state">
							<span id="pwdproblemresult">已设置</span>
						</div>
						<a href="#loginmodal" id="modaltrigger2">
							<div class="cente_right_detail_info_one_button" id="clickpwdproblem">
								查看密码提示问题
							</div>
						</a>
					</div>
					<div class="cente_right_detail_info_one">
						<div class="cente_right_detail_info_one_img">
							<img src="/Yqwan/newMemberCenter/images/smrz.png"/>
						</div>
						<div class="cente_right_detail_info_one_text">
							<span>实名认证状态</span><span id="realnamecheck">您已通过实名认证</span>
						</div>
						<div class="cente_right_detail_info_one_state">
							<span id="realnameresult">已认证</span>
						</div>
						<a href="#loginmodal" id="modaltrigger3">
							<div class="cente_right_detail_info_one_button" id="realnameclick">
								点击查看
							</div>
						</a>
					</div>
					<div class="cente_right_detail_info_one">
						<div class="cente_right_detail_info_one_img">
							<img src="/Yqwan/newMemberCenter/images/aqsj.png"/>
						</div>
						<div class="cente_right_detail_info_one_text">
							<span>安全手机</span><span>方便找回密码</span>
						</div>
						<div class="cente_right_detail_info_one_state">
							<span id="telephoneresult">已绑定</span>
						</div>
						<a href="#loginmodal" id="modaltrigger">
							<div class="cente_right_detail_info_one_button" id="clicktelephone">
								立即解绑
							</div>
						</a>
					</div>
					
					<!-- 弹出框 -->
						<div id="loginmodal" style="display:none;">
						    <div id="telephone_box" class="telephone_box">
						    	<div class="telephone_box_jiebang">解绑手机</div>
						    	<div class="telephone_box_tishi">提示：解绑手机后,您将无法使用原手机号进行登录等操作</div>
						    	<div class="telephone_box_shoujihao imgcode">
						    		<span>验证码：</span>
						    		<input type="text" id="imgcode" placeholder="输入右侧验证码"/>
						    		<img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/>
						    	</div>
						    	<div class="telephone_box_shoujihao">
						    		<span>手机号：</span>
						    		<input type="text" readonly="readonly" value="${user.telephone }" id="telephone_box_telephone"/>
						    		<input name="send" id="send" value="发送验证码" class="phone_code" style="cursor:pointer;" type="button">
						    	</div>
						    	<div class="telephone_box_shoujihao">
						    		<span>验证码：</span>
						    		<input type="text" id="telephone_box_phonecode" style="width:100px;"/>
						    		<span style="color:red;" id="telephone_box_phonecodetext"></span><br/>
						    		<input type="button" class="phone_code" value="确认" id="telephone_box_button" style="left:60px;top:10px"/>
						    	</div>					    	
						    </div>
						    
						     <div id="telephonebind_box" class="telephonebind_box">
						    	<div class="telephone_box_jiebang">绑定手机</div>
						    	<div class="telephone_box_tishi">提示：绑定手机后,您将可以用手机号进行登录等操作</div>
						    	<div class="telephone_box_shoujihao imgcode">
						    		<span>验证码：</span>
						    		<input type="text" id="imgcode1" placeholder="输入右侧验证码"/>
						    		<img src="/Yqwan/checkregistcode.do" onclick="this.src='/Yqwan/checkregistcode.do?'+Math.random();"/>
						    	</div>
						    	<div class="telephone_box_shoujihao">
						    		<span>手机号：</span>
						    		<input type="text" id="telephonebind_box_telephone"/>
						    		<span id="telephonebind_box_telephone_text" style="color:red;"></span>
						    		<input name="send" id="send_bind" value="发送验证码" class="phone_code" style="cursor:pointer;" type="button">
						    	</div>
						    	<div class="telephone_box_shoujihao">
						    		<span>验证码：</span>
						    		<input type="text" id="telephonebind_box_phonecode" style="width:100px;"/>
						    		<span style="color:red;" id="telephonebind_box_phonecodetext"></span><br/>
						    		<input type="button" class="phone_code" value="确认" id="telephonebind_box_button" style="left:60px;top:10px"/>
						    	</div>					    	
						    </div>
						    
						    <div id="realname_box" class="realname_box">
						    	<div class="telephone_box_jiebang">实名认证</div>
						    	<table width=95%>
						    		<tr>
						    			<td width=30%>账户名：</td>
						    			<td>${user.userid }</td>
						    		</tr>
						    		<tr>
						    			<td>真实姓名：</td>
						    			<td>${user.realname }</td>
						    		</tr>
						    		<tr>
						    			<td>身份证号码：</td>
						    			<td>${fn:substring(user.idcard,0,10)}********</td>
						    		</tr>
						    	</table>
						    	<div class="realname_box_queding" id="realname_box_queding">确定</div>
						    </div>
						    <div id="realname_box_not" class="realname_box_not">
						    	<div class="telephone_box_jiebang">实名认证</div>
						    	<table width=95%>
						    		<tr>
						    			<td width=30%>账户名：</td>
						    			<td>${user.userid }</td>
						    		</tr>
						    		<tr>
						    			<td>真实姓名：</td>
						    			<td><input type="text" id="realname_box_not_realname"/>
						    			<span id="realname_box_not_realname_text" style="color:red;"></span></td>
						    		</tr>
						    		<tr>
						    			<td>身份证号码：</td>
						    			<td><input type="text" id="realname_box_not_idcard"/>
						    			<span id="realname_box_not_idcard_text" style="color:red;"></span></td>
						    		</tr>
						    	</table>
						    	<div class="realname_box_queding" id="realname_box_not_tijiao">提交</div>
						    </div>
						    
						    
						    <div id="pwdproblem_box" class="pwdproblem_box">
						    	<div class="telephone_box_jiebang">密码提示</div>
						    	<table width=95%>
						    		<tr>
						    			<td width=30%>账户名：</td>
						    			<td>${user.userid }</td>
						    		</tr>
						    		<tr>
						    			<td>密码提示问题：</td>
						    			<td><input type="text" readonly="readonly" value="${user.pwdproblem }"/>
						    		</tr>
						    	</table>
						    	<div class="realname_box_queding" id="pwdproblem_box_queren">确认</div>
						    </div>
						    
						    <div id="pwdproblem_box_not" class="pwdproblem_box_not">
						    	<div class="telephone_box_jiebang">密码提示</div>
						    	<table width=95%>
						    		<tr>
						    			<td width=30%>账户名：</td>
						    			<td>${user.userid }</td>
						    		</tr>
						    		<tr>
						    			<td>密码提示问题：</td>
						    			<td><input type="text" id="pwdproblem_box_not_pwd"/>
						    			<span style="color:red;font-size:12px;" id="pwdproblem_box_not_pwd_text">少于15个中文汉字</span>
						    		</tr>
						    	</table>
						    	<div class="realname_box_queding" id="pwdproblem_box_not_tijiao">提交</div>
						    </div>
						    
						    <div id="success_box" class="success_box">
						    	<div class="telephone_box_jiebang">操作状态</div>
						    	<div class="success_box_chenggong">
									<img src="/Yqwan/newMemberCenter/images/duihao.png"/>
									<span>恭喜您,操作成功</span>
								</div>
						    </div>
					    </div>
					
					
				</div>
			</div>
			<div class="center_right_recommendgame">
				<jsp:include page="memberFootGame.jsp"></jsp:include>
			</div>
			
		</div>
	</div>
	
	
	
	<jsp:include page="../foot.jsp"></jsp:include>	
  </body>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
	<link href="<%=request.getContextPath()%>/newMemberCenter/css/security.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/security.js" type="text/javascript"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/newMemberCenter/popbox/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/newMemberCenter/popbox/jquery.leanModal.min.js"></script>
    <script type="text/javascript">
		$(function(){
		  $('#loginform').submit(function(e){
		    return false;
		  });
		  
		  $('#modaltrigger,#modaltrigger1,#modaltrigger2,#modaltrigger3').leanModal({ top: 200, overlay: 0.45, closeButton: ".hidemodal" });
		});
	</script>
	
	
</html>