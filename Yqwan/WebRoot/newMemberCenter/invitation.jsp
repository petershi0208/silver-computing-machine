<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>会员中心-推广页面</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">  
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=10">
	<script src="<%=request.getContextPath()%>/newMemberCenter/js/jquery-1.7.1.js" type="text/javascript"></script>
	
    <!-- Bootstrap -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/base.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/newMemberCenter/css/invitation.css">
  </head>
  <body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
<!-- 	<div class="banner"></div> -->
	<div id="content">
		<jsp:include page="memberleft.jsp"></jsp:include>
		<div class="content_left">
			<div class="content">
				<div class="top">
					<img src="<%=request.getContextPath()%>/newMemberCenter/images/member/landian.png" height="7" width="7" />
					推广员资料
				</div>
				<div class="center">
					<div class="centerinform" id="centerinform">
						<form action="/Yqwan/spreadapply.do" method="post">
							<span class="baseinform">基本资料</span>
							<div class="centerdetail">
								<span>&nbsp;&nbsp;&nbsp;用户姓名：</span>
								<input type="text" placeholder="请输入姓名" name="realname" id="realname" style="margin-left:12px;">
								<span style="color:red;margin-left:10px;" id="realnametext"></span>
							</div>
							<div class="centerdetail">
								<span>支付宝账号：</span>
								<input type="text" placeholder="请输入支付宝账号" name="aliaccount" id="aliaccount">
								<span style="color:red;margin-left:10px;" id="aliaccounttext"></span>
							</div>
							<div class="centerdetail">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号：</span>
								<input type="text" placeholder="请输入手机号" name="telephone" id="telephone" style="margin-left:12px;">
								<span style="color:red;margin-left:10px;" id="telephonetext"></span>
							</div>
							<div class="centerdetail">
								<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;qq：</span>
								<input type="text" name="qq" id="qq" placeholder="请输入qq号">
								<span style="color:red;margin-left:10px;" id="qqtext"></span>
							</div>
							<input class="applybutton" type="button" id="applybutton" value="立即申请加入"/>
						</form>
					</div>
					<div class="centerinform_login" id="centerinform_login">
						<span class="baseinform">基本资料</span>
						<div class="centerdetail">
							<span>&nbsp;&nbsp;&nbsp;用户姓名：</span>
							<input type="text" value="${promoter.name}" readonly="readonly" style="margin-left:12px;" id="recommend_name">
						</div>
						<div class="centerdetail">
							<span>支付宝账号：</span>
							<input type="text" readonly="readonly" value="${promoter.aliaccount }">
						</div>
						<div class="centerdetail">
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;手机号：</span>
							<input type="text" readonly="readonly" value="${promoter.telephone}" style="margin-left:12px;">
						</div>
						<div class="centerdetail">
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;qq：</span>
							<input type="text" readonly="readonly" value="${promoter.qq}">
						</div>
						<div class="centerdetail">
							<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;推广码：</span>
							<input type="text" readonly="readonly" value="${promoter.recommendcode }">
							<span class="centerdetail_span" id="getrecommendurl">获得推广链接</span>
						</div>
					</div>
					<div class="center_icon">
						<span class="center_icon_join">参与推广,开始赚钱</span>
						<div class="center_icon_img">
							<img src="/Yqwan/newMemberCenter/images/member/1-.png"/>
							<span>提交您的资料</span>
						</div>
						<img src="/Yqwan/newMemberCenter/images/member/lx.png" class="img1"/>
						<div class="center_icon_img02">
							<img src="/Yqwan/newMemberCenter/images/member/2.png"/>
							<span>申请后完成任务</span>
						</div>
						<img src="/Yqwan/newMemberCenter/images/member/lx.png" class="img2"/>
						<div class="center_icon_img03">
							<img src="/Yqwan/newMemberCenter/images/member/-----3.png"/>
							<span>获得任务赏金</span>
						</div>
					</div>
					<div class="center_show" id="center_show">
						<div class="center_show_list">
							<img src="<%=request.getContextPath()%>/newMemberCenter/images/member/landian.png" height="7" width="7" />
							<span>推广收益清单</span>
						</div>
						<div class="center_show_record center_show_recordone">
							<span>当月推广工资</span><span>${promoterrecord.recommendmoney }元</span>
						</div>
						<div class="center_show_record">
							<span>当月推广人数</span><span>${promoterrecord.recommendperson }</span>
						</div>
						<div class="center_show_record">
							<span>历史推广工资</span><span>${historyamount.moneysum }元</span>
						</div>
						<div class="center_show_record">
							<span>历史推广人数</span><span>${historyamount.personsum }</span>
						</div>
						<div class="center_show_more" id="center_show_more">更多清单</div>
						<div class="charge_records" id="charge_records">
							<table width="600">
								<tr id="chargetitle">
									<td>推广人数</td>
									<td>推广金额(元)</td>
									<td>日期</td>
									<td>状态</td>
								</tr>
		<%--					<tr>
									<td>像素骑士团</td>
									<td>30</td>
									<td>2016-1-31</td>
								</tr> --%>								
							</table>
						</div>
					</div>
				</div>	
				<div class="rule">
					<span>推广规则</span><br/><br/>
					<span>考核标准(随时更新)</span><br/><br/>
					<span>本月推广20人</span><br/><br/>
					<span>本月推广人数中1人付费</span><br/><br/>
					<span>得到2个条件,可对历史推广用户当月收益进行1%分成</span><br/><br/>
					<span>首次充值用户30%归推广用户所有</span>
				</div>			
			</div>
		</div>
	</div>
	<div class='fix' id="fix"> 
			<div class='fixtop'><span>获取成功</span> 
				<img src='giveDetail/cuo.png' class='cuo' /> 
			</div> 
			<div class='fixcon'> 
				<p style='margin:14px auto;margin-left:30px;font-size:16px;'>推广链接为:</p>
				<p style='margin-left:40px;'></p> 
				<div class='haoma line' id='p1'>
					<span class='input'>http://www.199y.com/registOne.jsp?invitecode=${promoter.recommendcode}</span> 
					<span class='copy'>复制</span> 
				</div>
			</div> 
		</div>
	<div class="fixbo"></div>
	<jsp:include page="../foot.jsp"></jsp:include>	
  </body>
  <script src='<%=request.getContextPath()%>/giveDetail/jquery.zclip.js' type='text/javascript'></script>
	<script src='<%=request.getContextPath()%>/giveDetail/jquery.zclip.min.js' type='text/javascript'></script>
  <script type="text/javascript">
	$(function () {
    	$(".copy").zclip({
            path: "giveDetail/ZeroClipboard.swf",
            copy: function(){
            return $(this).parent().find(".input").text();
            },
            afterCopy:function(){/* 复制成功后的操作 */
                var $copysuc = $("<div class='copy-tips'><div class='copy-tips-wrap'>☺ 复制成功</div></div>");
                $("body").find(".copy-tips").remove().end().append($copysuc);
                $(".copy-tips").fadeOut(3000);
            }
        });
    });
	</script>
  
  
  <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/foot/somefoot.css"/>
  <script src="<%=request.getContextPath()%>/newMemberCenter/js/invitation.js" type="text/javascript"></script>
</html>