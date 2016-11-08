<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>加入我们-199y游戏</title>
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/5987.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=10">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="加入我们,199y游戏">
	<meta name="description" content="199y游戏加入我们">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap-theme.css">

<script src="<%=request.getContextPath()%>/js/jquery-1.7.1.js" type="text/javascript"></script>
<style type="text/css">

</style>

</head>

<body>
    <div id="nav">
		<jsp:include page="../head.jsp"></jsp:include>
	</div>
	<div class="synopsisbanner"></div>
	<div class="joicontent">
		<div class="synleft">
			<jsp:include page="left.jsp"></jsp:include>
		</div>
		<div class="joiright">
			<div class="toup"><img src="<%=request.getContextPath()%>/synopsis/images/cengpinyingcaidatu.jpg"/></div>
			<div class="mt40">
				职能招聘联系人：宋女士<br/>
				联系电话：400-011-7281<br/>
				简历投递至：song@qq.com（请在邮件中注明岗位）<br/>
			</div>
			<h4>Flash设计开发/H5程序工程师</h4>
			<h5>岗位职责：</h5>
			<div class="line">
				1、根据策划案能够独立完成FLASH AS3代码效果编写；<br/>
				2、在美工的配合下完成相关互动效果的FLASH项目；<br/>
				3、熟悉PS/AI等其他平面软件的应用；<br/>
				4、能过与团队合作，承受项目压力，积极完成项目开发进度；<br/>
				5、会使用egret或layabox的优先。<br/>
			</div>
			<h5>任职要求：</h5>
			<div class="line">
				1、精通Flash AS3.0，熟悉AIR开发环境，具有1年以上开发经验；<br/>
				2、精通flash的多点触摸或使用flash multitouch开发过相关的项目的优先考虑；<br/>
				3、熟悉AS网络编程，熟悉AS3与服务端的通讯与交互，熟悉AS3的资源管理优先；<br/>
				4、基本功扎实，有良好的代码书写规范；<br/>
				5、对于用户体验与功能易用性有较深的理解，精准实现项目开发需求。<br/>
			</div>
			<h4>Egret/Html5/Flash游戏开发工程师</h4>
			<h5>岗位职责：</h5>
			<div class="line">
				1、使用TypeScript和Egret引擎开发HTML5手机游戏<br/>
				2、负责项目的客户端开发，功能模块的编写，以及程序设计、开发、优化工作<br/>
				3、使用Egret Wing开发项目的客户端UI<br/>
				4、能和服务端Node.js的开发人员一起完成功能和模块的开发及调试<br/>
			</div>
			<h5>任职要求：</h5>
			<div class="line">
				1、大专及以上学历欢迎应届毕业生前来<br/>
				2、对Html5手机页面游戏开发具有浓厚兴趣；<br/>
				3、具有良好的编程习惯和代码规范，独立解决问题能力强；<br/>
				4、身体健康，精力充沛，责任心强，有积极乐观的生活态度且无不良嗜好，能够与公司长期稳定共同发展；<br/>
			</div>
			<h5>优先考虑：</h5>
			<div class="line">
				1、精通AS3，javascript，TypeScript，Html5语言<br/>
				2、能熟练使用Egret以及Egret Wing等相关工具<br/>
				3、能熟练使用Cocos2d-x以及CocoStudio等相关工具<br/>
				4、计算机专业毕业，或者对计算机程序编程较为熟悉<br/>
				5、有过一款及以上的游戏开发经验，无论是页游还是手游均可<br/>
			</div>
			<h4>网页设计/制作/美工</h4>
			<h5>岗位职责：</h5>
			<div class="line">
				1、网站设计、改版优化工作；<br/>
				2、活动专题推广页面设计，微信活动页面设计；<br/>
				3、设计制作合作商广告及页面；<br/>
				4、APP客户端，移动web页面设计。<br/>
			</div>
			<h5>任职要求：</h5>
			<div class="line">
				1、美术设计、网页设计、计算机等相关专业；<br/>
				2、有美术设计，网页制作等设计经验，有交互设计经验者优先考虑；<br/>
				3、精通PHOTOSHOP，ILLUSTRATOR、DREAMWEAVER，熟悉AS3、HTML、CSS语言；<br/>
				4、思维活跃，勇于创新勇于接受新鲜事物，有较强的抗压能力；<br/>
				5、有手机客户端设计工作经验的优先，有美术基础优先（面试请携带个人作品或链接）<br/>
			</div>
			<h4>PHP或java网站开发程序员</h4>
			<h5>岗位职责：</h5>
			<div class="line">
				1、负责公司网站程序开发及维护； <br/>
				2、协同美工、策划完成公司需要的PHP动态页面的功能，负责web应用系统的架构设计、开发、测试等工作； <br/>
				3、能够独立完成公司网站系统web版和移动版的各模块开发工作。<br/>
			</div>
			<h5>任职要求：</h5>
			<div class="line">
				1、大专以上学历，计算机相关专业毕业<br/>
				2、精通PHP或java语言，精通SQLSever\mysql数据库，精通相关数据库编程（储存过程、试图、索引、触发器）；<br/>
				3、至少一年以上的网络程序实际开发经验，能独立承担商业动态网站程序的架构设计与开发工资；<br/>
				4、精通javascript、xml、jQuery、ajax等相关技术；<br/>
				5、熟悉.net框架，对底层框架有深入的认知；<br/>
				6、有手机网站开发工作者优先；<br/>
				7、逻辑思路清晰，工作认真负责；具有良好编码风格，有较强的独立工作能力，良好的沟通协调能力，并能够承受较强的工作压力；<br/>
				8、具备服务器安全管理经验者优先；<br/>
				9、需要有作品案例； <br/>
				10、良好的团队沟通与协作能力；<br/>
				11、具有SEO相关知识者优先考虑。<br/>
			</div>
			<h4>网站运营</h4>
			<h5>岗位要求：</h5>
			<div class="line">
				1.网站上线前期对整个网站规划；<br/>
				2.良好的策划能力、文案撰写能力、沟通能力团队合作能力与学习能力。 <br/>
				3.对数据比较敏感，熟悉各类互联网营销方式与技巧。<br/>
				4.有中大型电商、社交、旅游方面互联网网站运营经验者优先。<br/>
				5.了解电子商务特点，把握用户需求。<br/>
			</div>
			<h5>工作职责: </h5>
			<div class="line">
				1. 负责公司产品运营相关工作。 <br/>
				2. 根据数据提出运营需求，提升网站的用户数、流量与转化率。<br/>
				3. 配合各类线上活动策划及落地，协调相关资源实现运营工作目标。 <br/>
				4. 根据业务需要与用户需求，调整与优化公司网站的内容结构。<br/>
				5. 优化相关的运营工具与内容管理系统。<br/>
			</div>
			<h4>运营总监</h4>
			<h5>职位描述：</h5>
			<div class="line">
				1、负责项目网站的日常运营，组建并管理网站运营团队，包括网站策划，网站编辑、网站维护以及客户服务等综合团队；<br/>
				2、策划推进及组织协调公司重大运营计划、进行市场发展跟踪和策略调整；<br/>
				3、制定运营中心各部门的战略发展和业务计划，协调各部门的工作、建设和发展优秀的运营团队；<br/>
				4、制定公司运营指标、年度发展计划，推动并确保营业指标的顺利完成；<br/>
				5、根据公司经营战略和业务需求，合理设置部门组织结构和岗位，优化业务流程，合理配置人力资源，开发和培养部门员工能力，对员工绩效
				    进行管理，提升部门工作效率，提高部门员工的工作热情和积极性；<br/>
				6、修订及执行公司战略规划及与日常运营作相关的制度体系、业务流程；<br/>
				7、全面负责网站运营合作项目的洽谈，拟定商业计划运营方案；<br/>
			</div>
			<h5>任职要求：</h5>
			<div class="line">
				1、1年以上相关工作经验；<br/>
				2、出众的领导管理才能和良好的商业理念；<br/>
				3、具有很强的团队协作精神、组织及策划能力和良好的沟通技巧；较强的逻辑思维能力，熟练的计算机应用及操作能力；<br/>
				4、办事认真严谨、追求成功、精力充沛、可以承受较大工作压力；<br/>
				5、负责网站运营合作项目的洽谈，拟定商业计划运营方案。<br/>
			</div>
			<h4>Egret/Html5游戏开发工程师</h4>
			<div class="line">
				职位标签: Egret JavaScript TypeScript AS3 程序员 工程师 软件 手游 周末双休 奖金丰厚 <br/>
				职位职能: 多媒体/游戏开发工程师  <br/>
				游戏性质：5000-12000<br/>
			</div>
			<h5>任职要求：</h5>
			<div class="line">
				1、计算机相关专业；<br/>
				2、精通AS3、JavaScript或TypeScript语言，对Html5手机页面游戏开发具有浓厚兴趣；<br/>
				3、具备良好的编程习惯和代码规范，独立解决问题能力强；<br/>
				4、有过egret开发经验，1个或多个demo；<br/>
			</div>
			<h5>岗位职责：</h5>
			<div class="line">
				1、使用JavaScript进行游戏项目开发；<br/>
				2、负责项目的客户端框架设计、核心模块开发；<br/>
				3、游戏开发发布一体；<br/>
			</div>
			<h4>游戏执行策划</h4>
			<div class="line">
				3k-5k 上海 经验、学历不限 全职<br/>
				职位诱惑 : 弹性工作时间，和谐团队，上升空间大<br/>
				职位描述<br/>
			</div>
			<h5>岗位职责:</h5>
			<div class="line">
				1.玩游戏,玩大量的游戏.<br/>
				2.完成主策划分配的任务.<br/>
				3. 品的竞品调研.<br/>
				4.产品的需求分析.<br/>
				5.产品的设计文档.<br/>
				6.跟进系统模块的完成进度，与美术，程序协调配合完成工作.<br/>
			</div>
			<h5>任职要求:</h5>
			<div class="line">
				1、对游戏,动画,漫画,电影有爱,爱得深沉.( (→_→)战斗力5以上为佳)<br/>
				2、在三次元与二次元模式之间切换自如.( ⊙ω⊙切不回来也没问题)<br/>
				3、脑洞超大,填不上.(主策帮你填 (/= _ =)/~┴┴)<br/>
				4、宅到飞起(￣ 3￣大误).<br/>
			</div>
			<h5>然后是一些通用的要求:</h5>
			<div class="line">
				1. 细致,认真,负责.<br/>
				2. 积极,正面,向上的工作态度.<br/>
				3.做事有条理,能区分任务的轻重缓急.<br/>
				4.对新知识接受快,好学好问.<br/>
				5.能恰如其分地与团队其他成员交流.<br/>
				6.有丰富的游戏经验加分.<br/>
			</div>
			<h4>网站运营</h4>
			<h5>岗位职责：</h5>
			<div class="line">
				1、负责网站及APP的策划设计，包括研发阶段的功能设计与后期推广活动设计；<br/>
				2、负责与美术及程序部门沟通协调，完成网站和APP的开发。<br/>
				3、负责与市场部门沟通协调，完成活动方案的执行与推广。<br/>
			</div>
			<h5>任职资格：</h5>
			<div class="line">
				1、学历不限，一年以上相关工作经验；<br/>
				2、熟悉网站及APP开发流程，有较强的独立操作和理解能力、逻辑思维能力强，结构严谨并富有创意；<br/>
				3、能够熟练运用word，Excel,Visio等办公软件，有良好的文字表达能力，可以撰写开发文档及活动方案。<br/>
				4、工作严谨，认真负责，有较强的团队合作意识，良好协调能力，能承受较强的工作压力。<br/>
				5、有房地产行业工作经验、网站及APP成功案例者优先、广告/中文/新闻/营销相关专业毕业优先。<br/>
			</div>
		</div>
	</div>
	<jsp:include page="../foot.jsp"></jsp:include>
 <script src="<%=request.getContextPath()%>/synopsis/js/synopsis.js" type="text/javascript"></script>
  </body>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/synopsis/css/synopsis.css">
</html>