<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>大钱财富-招贤纳士</title>
<link rel="shortcut icon" href="/Daqian/image/5987.ico">
 <link  href="<%=request.getContextPath()%>/index_files/logotitle.ico" rel="shortcut icon">
 <link href="<%=request.getContextPath()%>/Recruitment%20_files/ligerui-all.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/Recruitment%20_files/all.css" rel="stylesheet" type="text/css">
    <script src="<%=request.getContextPath()%>/Recruitment%20_files/jquery-1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Recruitment%20_files/base.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Recruitment%20_files/ligerDrag.js" type="text/javascript"></script> 
    <script src="<%=request.getContextPath()%>/Recruitment%20_files/ligerDialog.js" type="text/javascript"></script>


<!-- <script src="../styles/web/js/jquery1.42.min.js" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/Recruitment%20_files/jquery_002.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/Recruitment%20_files/jquery.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/Recruitment%20_files/member_center.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/Recruitment%20_files/WdatePicker.js" type="text/javascript"></script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/Recruitment%20_files/WdatePicker.css">
<script type="text/javascript">
 function b() {
	h = $(window).height(),
	t = $(document).scrollTop(),
	t > h ? $("#moquu_top").show() : $("#moquu_top").hide();
}
$(document).ready(function() {
	b(),
	$("#moquu_top").click(function() {
		$(document).scrollTop(0)
	})
}),
$(window).scroll(function() {
	b()
}); 
 
 
</script>

<link href="<%=request.getContextPath()%>/Recruitment%20_files/borrower_user.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/Recruitment%20_files/borrower.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/Recruitment%20_files/head.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/Recruitment%20_files/qq.css" rel="stylesheet" type="text/css">

<script src="<%=request.getContextPath()%>/js/head.js" type="text/javascript"></script>
</head>

<body><div style="position: absolute; z-index: 19700; top: -1970px; left: -1970px; display: none;"><iframe style="width: 186px; height: 199px;" src="Recruitment%20_files/My97DatePicker.htm" border="0" scrolling="no" frameborder="0"></iframe></div>

	<div style="width:100%; margin:0;">

		<center style="background-color: #f3f4f8;">
			<jsp:include page="header.jsp"></jsp:include>
		</center>
	</div>

	<div></div>
	<script type="text/javascript">
			
// 			function showTime(){
//                                 var show_day=new Array('星期一','星期二','星期三','星期四','星期五','星期六','星期日');
//                                 var week_day = new Array(7);
//                                 week_day[0] = '日';
//                                 week_day[1] = '一';
//                                 week_day[2] = '二';
//                                 week_day[3] = '三';
//                                 week_day[4] = '四';
//                                 week_day[5] = '五';
//                                 week_day[6] = '六';
//                                 var time=new Date();
//                                 var day=time.getDay();
//                                 var now_time = time.toLocaleString() +' '  + '星期' + week_day[day];
//                                 document.getElementById('showtime').innerHTML=now_time;
//                                 setTimeout("showTime();",1000);
//                             }
                            

			        /*判断浏览器版本是否过低*/
					function getIEversion(){
						var b_name = navigator.appName; 
						var b_version = navigator.appVersion; 
						var version = b_version.split(";"); 
						
						if (b_name == "Microsoft Internet Explorer") { 
							var trim_version = version[1].replace(/[ ]/g, ""); 					
							if (trim_version == "MSIE8.0" || trim_version == "MSIE7.0" || trim_version == "MSIE6.0") { 
								alert("此浏览器版本过低，请到指定网站去下载相关版本。"); 
								//然后跳到需要连接的下载网站
								//window.location.href="http://windows.microsoft.com/zh-CN/internet-explorer/download-ie"; 
							}
						}
					}
					
 

				//加入收藏
				function addFavorite2() {
				     var url = window.location;
				     var title = document.title;
				     var ua = navigator.userAgent.toLowerCase();
				     if (ua.indexOf("360se") > -1) {
				         alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
				     }
				     else if (ua.indexOf("msie 8") > -1) {
				         window.external.AddToFavoritesBar(url, title); //IE8
				     }
				     else if (document.all) {
				   try{
				    window.external.addFavorite(url, title);
				   }catch(e){
				    alert("您的浏览器不支持,请按 Ctrl+D 手动收藏!");
				   }
				     }
				     else if (window.sidebar) {
				         window.sidebar.addPanel(title, url, "");
				     }
				     else {
				   alert("您的浏览器不支持,请按 Ctrl+D 手动收藏!");
				     }
				 }
				//借款页面跳转
				function borproduct(){
					if($("#username").val()=="" || $("#username").val() == null){
						 window.location.href = "/webApplicationLoan/borProducts";
					}else if($("#username").val()!="" || $("#username").val() != null){
					 $.ajax({ 
						        url: "/webApplicationLoanApply/borvalproduct", 
						        dataType: 'json', 
						        error : function() {
						        $.ligerDialog.question("请求异常！请联系管理员...");
							      },
				                success:function(meg){
				                if(meg.statusCode== 300){
				                 window.location.href = "/webApplicationLoanApply/borMessage?productname="+meg.message+"&statu="+meg.navTabId;
				                }else{
				                 window.location.href = "/webApplicationLoan/borProducts";
				                }
                         }
                          });
					}
				}
				 
				//设为首页
				function SetHome(url){
					if (document.all) {
						document.body.style.behavior='url(#default#homepage)';
						document.body.setHomePage(url);
					}else{
						alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
					}
				}
								
	</script>

<center style="background-color: #f3f4f8;">
<div class="about_recruitContentMain">
		<div id="about_recruitContent">	
			<div class="about_recruitContentTop">			  <span class="about_top_shouye"><a href="<%=request.getContextPath()%>/index.do">首页</a></span>  
				<i style="font-family: serif;margin: 0 5px;font-style: normal;font-weight:bold;">&gt;</i>
				<a href="###"><span class="about_top_myAccount">诚聘英才</span></a>			</div>
			<div class="about_recruitContent_center">
				<div class="about_recruitContent_center_left">
<link href="<%=request.getContextPath()%>/Recruitment%20_files/about.css" rel="stylesheet" type="text/css">
<script src="<%=request.getContextPath()%>/Recruitment%20_files/about.js" type="text/javascript"></script>


 <div class="about_left" id="about_left">
 		<input id="nav_id" value="6" type="hidden">
 				<a id="anav1" href="<%=request.getContextPath()%>/user/aboutourself.jsp">
 				<div class="nav" id="nav1">
				公司介绍
			</div></a>
			<a id="anav4" href="<%=request.getContextPath() %>/dynamic.do">
				<div class="nav" id="nav4">
				公司动态
				</div>
			</a>
			
			<a href="<%=request.getContextPath()%>/user/media.jsp">
				<div class="nav">
				媒体动态			</div></a>
			
			<a  href="<%=request.getContextPath()%>/user/Recruitment.jsp" id="anav6" style="color: white;" >
				<div style="background-color: rgb(231, 76, 60);" class="nav" id="nav6">
				诚聘英才
				</div></a>
				<!-- <a id="anav7" href="/webApplicationAbout/toMerchantsjoin">
				<div class="nav" id="nav7" >
				招商加盟
				</div></a> -->
				<a id="anav8" href="">
				</a>
				<div class="nav" id="nav8">
				  <a href="<%=request.getContextPath()%>/user/callme.jsp">联系我们</a>				</div>    
				   
		  </div></div>
				<div class="about_recruitContent_center_right">		
						<div class="about_recruitContent_center_right_title">
						加入我们
						</div>
						
						<div class="about_recruitContent_center_right_txt">
							<div class="about_recruitContent_center_right_lili"><ul><li style="list-style: disc;">理财经理</li></ul></div>
							<div class="about_recruitContent_center_right_com">招聘人数：若干</div>
							<div class="about_recruitContent_center_right_li">岗位职责：</div>
							<div class="about_recruitContent_center_right_com">1、客户开发，提供相应理财咨询、建议服务，制定相应的投资组合和策略；</div>
							<div class="about_recruitContent_center_right_com">2、负责保持与客户沟通联系，了解客户需求，为客户提供金融投资理财方面等服务；</div>
							<div class="about_recruitContent_center_right_com">3、负责为客户提供完善的理财计划及信息咨询；</div>
							<div class="about_recruitContent_center_right_com">4、负责根据客户的委托，帮助客户实施理财计划；</div>
							<div class="about_recruitContent_center_right_com">5、负责对公司理财产品能够全力宣传、推广、销售；</div>
							<div class="about_recruitContent_center_right_com">6、负责为重要客户需求提供理财咨询；</div>
							<div class="about_recruitContent_center_right_com">7、负责维持重要客户关系，通过与客户沟通，满足客户的需求。</div>
							<div class="about_recruitContent_center_right_li">岗位要求：</div>
							<div class="about_recruitContent_center_right_com">1、大专及以上学历，金融、财务、保险、基金证券、管理等相关专业；</div>
							<div class="about_recruitContent_center_right_com">2、有较强的沟通能力语言组织能力，应变能力和解决问题的能力；</div>
							<div class="about_recruitContent_center_right_com">3、吃苦耐劳，有责任感，具有良好的团队协作精神和客户服务意识，能短时间适应工作；</div>
							<div class="about_recruitContent_center_right_com">4、具备2年以上金融、房产行业工作经验（包括银行、证券、信托、基金、三方理财等）。</div>					
						</div>

						<div class="about_recruitContent_center_right_txt">
							<div class="about_recruitContent_center_right_lili"><ul><li style="list-style: disc;">业务人员</li></ul></div>
							<div class="about_recruitContent_center_right_com">招聘人数：若干</div>
							<div class="about_recruitContent_center_right_li">岗位职责：</div>
							<div class="about_recruitContent_center_right_com">1、信贷销售：开拓销售渠道，主动寻找和开发客户，销售公司信贷产品；</div>
							<div class="about_recruitContent_center_right_com">2、信贷评审：受理客户贷款申请，并对客户贷款申请进行调查、分析、评估和初审；</div>
							<div class="about_recruitContent_center_right_com">3、信贷风控：跟进客户偿还贷款，催收客户逾期贷款；</div>
							<div class="about_recruitContent_center_right_com">4、客户关系：维护客户，为客户提供优质的贷前、贷中及贷后服务。</div>
							<div class="about_recruitContent_center_right_li">岗位要求：</div>
							<div class="about_recruitContent_center_right_com">1、 大专或相当学历，专业不限，金融、财经及市场营销类专业优先；</div>
							<div class="about_recruitContent_center_right_com">2、 经验不限，具备1年以上销售行业工作经验，有金融产品销售经验者优先。应届毕业生尚可，在校大学生可兼职；</div>
							<div class="about_recruitContent_center_right_com">3、 具良好的沟通影响力、团队合作力和自我激励能力；</div>
							<div class="about_recruitContent_center_right_com">4、 工作积极、能吃苦耐劳，有高度的责任心和职业操守。</div>					
						</div>
												
						<div class="about_recruitContent_center_right_txt">
							<div class="about_recruitContent_center_right_lili"><ul><li style="list-style: disc;">审核专员</li></ul></div>
							<div class="about_recruitContent_center_right_com">招聘人数：若干</div>
							<div class="about_recruitContent_center_right_li">岗位职责：</div>
							<div class="about_recruitContent_center_right_com">1、通过面审对贷款申请人资料的真实性能迅速作出判断；</div>
							<div class="about_recruitContent_center_right_com">2、能根据公司要求对贷款申请人的资信状况、是否能通过审批作出客观公正的判定；</div>
							<div class="about_recruitContent_center_right_com">3、与其他部门同事合作，完善核审流程，加强信用管理，降低风险及信贷损失； </div>
							<div class="about_recruitContent_center_right_com">4、在工作中积极提出自己的意见和建议，优化工作流程。</div>
							<div class="about_recruitContent_center_right_li">岗位要求：</div>
							<div class="about_recruitContent_center_right_com">1、营销、管理、金融、经济等相关专业，大专或以上学历；</div>
							<div class="about_recruitContent_center_right_com">2、工作主动负责，认真仔细，勤勉敬业，善于沟通，有较强的客户服务意识； </div>
							<div class="about_recruitContent_center_right_com">3、具有良好的心理素质，思维敏捷，善于在短时间内对客户情况作出判定的能力； </div>
							<div class="about_recruitContent_center_right_com">4、能很快的学习新事物和新知识，责任心强，具备较强的团队合作精神和高度的工作热情；</div>	
							<div class="about_recruitContent_center_right_com">5、诚实守信，为人谦虚、正直，性格开朗； </div>
							<div class="about_recruitContent_center_right_com">6、愿意接受外派到外省市者优先。 </div>				
						</div>
						
						<div class="about_recruitContent_center_right_txt">
							<div class="about_recruitContent_center_right_lili"><ul><li style="list-style: disc;">营业专员</li></ul></div>
							<div class="about_recruitContent_center_right_com">招聘人数：若干</div>
							<div class="about_recruitContent_center_right_li">岗位职责：</div>
							<div class="about_recruitContent_center_right_com">1、负责整理业务合同；</div>
							<div class="about_recruitContent_center_right_com">2、签发各种合同，票据；</div>
							<div class="about_recruitContent_center_right_com">3、熟悉公司业务 解答客户业务咨询；</div>
							<div class="about_recruitContent_center_right_com">4、协助处理其他行政工作。</div>
							<div class="about_recruitContent_center_right_li">岗位要求：</div>
							<div class="about_recruitContent_center_right_com">1、熟练使用电脑及各种办公软件；</div>
							<div class="about_recruitContent_center_right_com">2、稳重，细心，学习能力强，有良好的抗压能力及沟通技巧；</div>
							<div class="about_recruitContent_center_right_com">3、有文职或助理岗位工作经验者优先（2014届毕业生也可应聘）；</div>
							<div class="about_recruitContent_center_right_com">4、口齿清晰，普通话标准；</div>			
							<div class="about_recruitContent_center_right_com">5、中专或者以上学历；</div>		
							<div class="about_recruitContent_center_right_com">6、愿意接受外派到外省市者优先。</div>				
						</div>
						
						<div class="about_recruitContent_center_right_txt">
							<div class="about_recruitContent_center_right_lili"><ul><li style="list-style: disc;">市场拓展专员</li></ul></div>
							<div class="about_recruitContent_center_right_com">招聘人数：2人</div>
							<div class="about_recruitContent_center_right_li">岗位职责：</div>
							<div class="about_recruitContent_center_right_com">1、负责信贷信息的收集、整理，业务渠道的建立；</div>
							<div class="about_recruitContent_center_right_com">2、负责与外部机构建立广泛的销售线索来源和良好的合作关系；</div>
							<div class="about_recruitContent_center_right_com">3、负责与各金融机构、银行、政府及相关机构联络、接洽；</div>
							<div class="about_recruitContent_center_right_com">4、管理维护渠道关系及客，为客户提供优质的贷前、贷中及贷后服务；</div>
							<div class="about_recruitContent_center_right_com">5、开拓目标市场，发展吸收销售线索的渠道，增加公司品牌及产品的市场份额占有率；</div>
							<div class="about_recruitContent_center_right_com">6、负责与渠道放合作的商务谈判，撰写相关报告和文件；</div>
							<div class="about_recruitContent_center_right_com">7、负责处理公司贷款相关的各种外部事宜；</div>
							<div class="about_recruitContent_center_right_li">岗位要求：</div>
							<div class="about_recruitContent_center_right_com">1、具备熟练的计算机办公软件操作能力；</div>
							<div class="about_recruitContent_center_right_com">2、具备良好的语言表达能力和沟通技巧，较强的市场拓展能力和团队领导能力；</div>
							<div class="about_recruitContent_center_right_com">3、具有金融行业工作背景，或行业资源者可优先考虑；</div>
							<div class="about_recruitContent_center_right_com">4、能吃苦耐劳、服从公司管理，承担较大的压力，有着挑战高薪的强烈欲望；</div>					
							<div class="about_recruitContent_center_right_com">5、独立工作能力强，学习能力强，有责任心；</div>		
						</div>
						
						<div class="about_recruitContent_center_right_txt">
							<div class="about_recruitContent_center_right_lili"><ul><li style="list-style: disc;">法务收款专员</li></ul></div>
							<div class="about_recruitContent_center_right_com">招聘人数：若干</div>
							<div class="about_recruitContent_center_right_li">岗位职责：</div>
							<div class="about_recruitContent_center_right_com">1、负责不良贷款的催收、现场调查、信息收集、统计监测等工作；</div>
							<div class="about_recruitContent_center_right_com">2、负责对不良贷款客户进行尽职调查和现场核查、调查客户收入及财产信息、分析客户偿债能力，并及时向公司汇报；</div>
							<div class="about_recruitContent_center_right_com">3、综合运用各种催收方法和手段(如电话、上门等形式），实现不良贷款回收、风险化解；</div>
							<div class="about_recruitContent_center_right_com">4、催收过程中的其他事宜。</div>
							<div class="about_recruitContent_center_right_li">岗位要求：</div>
							<div class="about_recruitContent_center_right_com">1、男性，两年以上债权催收工作经验优先，可接受应届毕业生；</div>
							<div class="about_recruitContent_center_right_com">2、具较强的沟通协调能力，较强洞察力，责任心强、勤奋好学、身体健康、精力充沛；</div>
							<div class="about_recruitContent_center_right_com">3、有信用卡催收工作及外包催收工作经历优先考虑。</div>
				
						</div>
							
				</div>						
		  </div>
	</div>
			<div class="about_bottom"></div>	
		</div>

</center>





<link href="<%=request.getContextPath()%>/Recruitment%20_files/foot.css" rel="stylesheet" type="text/css">
<center>
	<jsp:include page="foot.jsp"></jsp:include>
</center>

</body>
</html>