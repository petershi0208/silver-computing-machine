<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


	<head>
   		<title>memberright</title>  
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/memberCenter/css/memberright.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/memberCenter/js/memberright.js"></script>
	</head>
  
	<body>
	<input type="hidden" value="${user.telephone}" id="memberright_telephone"/>
	<input type="hidden" value="${user.email}" id="memberright_email"/>
	<input type="hidden" value="${user.realname}" id="memberright_realname"/>
    	<div class="content_right_one">
				<span>您好,</span>
				<span>${user.nickname }</span>
				<span><a href="/Yqwan/destroy.do">退出</a></span>
				<img src="<%=request.getContextPath()%>/memberCenter/images/member/yonghudenglutuichuxiahuaxian.png"/>
				<span>我的G币：${user.gb}</span>
				<ul id="memberright_ul">
					<li>
						<img src="<%=request.getContextPath()%>/memberCenter/images/member/youxiangbangding.png"/>
						<span>未绑定</span>
					</li>
					<li>
						<img src="<%=request.getContextPath()%>/memberCenter/images/member/shiminghui.png"/>
						<span>未实名</span>
					</li>
					<li>
						<img src="<%=request.getContextPath()%>/memberCenter/images/member/bangdingshouji.png"/>
						<span>未绑定</span>
					</li>
				</ul>
				<div class="content_right_one_btn" id="content_right_one_btn">
					<span>充值</span>
				</div>
<%--			<span>账号管理</span>   --%>
				<div style="height:23px;"></div>
				<div class="content_right_one_manage one" id="one">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/zhanghaoguanoixiahauxian.png"/>
					<span>实名认证</span>
				</div>
				<div class="content_right_one_manage two" id="two">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/zhanghaoguanoixiahauxian.png"/>
					<span>修改密码</span>
				</div>
				<div class="content_right_one_manage three" id="three">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/zhanghaoguanoixiahauxian.png"/>
					<span>邮箱绑定</span>
				</div>
				<div class="content_right_one_manage four" id="four">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/zhanghaoguanoixiahauxian.png"/>
					<span>修改邮箱</span>
				</div>
				<div class="content_right_one_manage five" id="five">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/zhanghaoguanoixiahauxian.png"/>
					<span>手机绑定/解绑</span>
				</div>
				<div class="content_right_one_manage six" id="six">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/zhanghaoguanoixiahauxian.png"/>
					<span>个人信息</span>
				</div>
				<div class="content_right_one_manage seven" id="seven">
					<img src="<%=request.getContextPath()%>/memberCenter/images/member/zhanghaoguanoixiahauxian.png"/>
					<span>推广员</span>
				</div>
			</div>
			
			<div class="left">
    			<div class="add">
    				<p class="together">公告栏</p>
    				<div class="addtext">
	    				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;放置生活,由你主宰,让我们《一起玩挂机》!<br/>
	    				放置QQ群：389530007
    				</div>
    				<img src="index/QQ.jpg"/>
    				<div class="addQQ" id="addQQ">
    					<span><a target="_blank" href="http://shang.qq.com/wpa/qunwpa?idkey=da7f7d7a1c42d98f924599adfcdf1d205a718980de98ecdd5e7086d4778d17e9">加入QQ群</a></span>
    				</div>
    			</div>
    			
    			<div class="ah">
    				<p class="ahping">平台推荐</p>
    				<p class="ahtop">TOP</p>
    			</div>
    			
    			<div class="hot" id="hot">
    				<p class="together" id="hot_together">热销榜</p>
<%-- js中  				<div class="hotone">
	    					<img src="index/PAIHANGTUBIAOHUANG.jpg" class="hotpoint"/>
	    					<img src="index/REXIAOSAN.jpg" class="hotpic"/>
	    					<div class="hotstart"></div>
	    					<span>1</span>
    					</div>
    				<div class="hotfive">
    					<img src="index/ERXIAOBANGHUIDIQUAN.jpg"/>
    					<span class="hotfivenum">5</span>
    					<span class="hotfivetext">门神之塔</span>
    					<span class="hotfivequ">4区</span>
    				</div>
    				<div class="hotfive">
    					<img src="index/ERXIAOBANGHUIDIQUAN.jpg"/>
    					<span class="hotfivenum">6</span>
    					<span class="hotfivetext">门神之塔</span>
    					<span class="hotfivequ">8区</span>
    				</div>--%> 
    			</div>
    			
    			<div class="ah">
    				<p class="ahping">火爆新游</p>
    				<p class="ahtop">TOP</p>
    			</div>
    			
    			<div class="new" id="new">
    				<p class="together" id="new_together">新游榜</p>
<%--js中   				<div class="hotone">
    					<img src="index/PAIHANGTUBIAOHUANG.jpg" class="hotpoint"/>
    					<img src="index/REXIAOSAN.jpg" class="hotpic"/>
    					<div class="hotstart"></div>
    					<span>1</span>
    				</div> 
    				<div class="hotfive">
    					<img src="index/ERXIAOBANGHUIDIQUAN.jpg"/>
    					<span class="hotfivenum">5</span>
    					<span class="hotfivetext">门神之塔</span>
    					<span class="hotfivequ">4区</span>
    				</div>
    				<div class="hotfive">
    					<img src="index/ERXIAOBANGHUIDIQUAN.jpg"/>
    					<span class="hotfivenum">6</span>
    					<span class="hotfivetext">门神之塔</span>
    					<span class="hotfivequ">8区</span>
    				</div>--%>
    			</div>
    		</div>
	</body>
