<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'table.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

		<!-- basic styles -->

		<link href="<%=request.getContextPath()%>/administratorht/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<!-- fonts -->

	

		<!-- ace styles -->

		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/ace.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/ace-skins.min.css" />

		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/ace-ie.min.css" />
		<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="<%=request.getContextPath()%>/administratorht/assets/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/html5shiv.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>
	<c:if test="${admin.username != null}">
<!--头部开始 -->
		<jsp:include page="../include/head.jsp"></jsp:include>		
		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>
<!--  侧边导航   -->
				<jsp:include page="../include/leftnav.jsp"></jsp:include>				
				<div class="main-content">
					<div class="breadcrumbs" id="breadcrumbs">
						<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

						<ul class="breadcrumb">
							<li>
								<i class="icon-home home-icon"></i>
								<a href="<%=request.getContextPath()%>/administratorht/template/index.jsp">控制台</a>
							</li>
					
							<li class="active">游戏管理</li>
							<li>
								游戏数据列表
							</li>
						</ul><!-- .breadcrumb -->

						<div class="nav-search" id="nav-search">
							<form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input" id="nav-search-input" autocomplete="off" />
									<i class="icon-search nav-search-icon"></i>
								</span>
							</form>
						</div><!-- #nav-search -->
					</div>

					<div class="page-content">
						

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<!-- /row -->

								<div class="hr hr-18 dotted hr-double"></div>

								<div class="row" id="pagi">
									<div class="col-xs-12">
										<h3 class="header smaller lighter blue">游戏数据列表</h3>
										<form action="" method="post">
											游戏名:<input type="text" class="gamename" name="gamename" value="${gamename }" />
											时间:<select class="year" name="year">
													<c:if test="${date!=null and date!=''}">
													<option value="${fn:substring(date, 0, 4)}">${fn:substring(date, 0, 4)}年</option>
													</c:if>
													<option value=""></option>
													<option value="2016">2016年</option>
													<option value="2017">2017年</option>
													<option value="2018">2018年</option>
													<option value="2019">2019年</option>
													<option value="2020">2020年</option>
													<option value="2021">2021年</option>
													<option value="2022">2022年</option>
													<option value="2023">2023年</option>
													<option value="2024">2024年</option>
													<option value="2025">2025年</option>
													<option value="2026">2026年</option>
													<option value="2027">2027年</option>
													<option value="2028">2028年</option>
													<option value="2029">2029年</option>
												</select>
												<select class="month" name="month">
													<c:if test="${date!=null and date!=''}">
													<option value="${fn:substring(date, 5, 7)}">${fn:substring(date, 5, 7)}月</option>
													</c:if>
													<option value=""></option>
													<option value="01">01月</option>
													<option value="02">02月</option>
													<option value="03">03月</option>
													<option value="04">04月</option>
													<option value="05">05月</option>
													<option value="06">06月</option>
													<option value="07">07月</option>
													<option value="08">08月</option>
													<option value="09">09月</option>
													<option value="10">10月</option>
													<option value="11">11月</option>
													<option value="12">12月</option>
												</select>
											<input type="text" class="date" name="date" value="${date }" style="display:none;" />
											<input type="button" class="btnn" value="查询" />
										</form>
										<div style="height:15px;"></div>
										<div class="table-header">
											游戏数据信息展示
										</div>

										<div class="table-responsive">
											<table id="sample-table-2" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>游戏名</th>
														<th>区名</th>
														<th>注册人数</th>
														<th>消费金额</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${listregion}" var="lr">
													<tr>
														<td>${lr.gamename }</td>
														<td>${lr.region }</td>
														<td>${lr.count }</td>
														<c:forEach items="${listtrade}" var="ltt">
														<c:if test="${lr.gamename == ltt.gamename and lr.region == ltt.gameregion}">
															<td>${ltt.count }</td>
														</c:if>
														</c:forEach>
													</tr>
													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="17">
															<form action="gameinfo.do" method="post" class="gin">
																<div style="float:left; margin-top:10px;">总条数：<span class="count">${count }</span></div>
																<div class="paga" style="margin:10px auto; width:350px; height:30px;">
																	<span class="prepage">上一页</span>
																	<span class="currentpage1 a">1</span>
																	<span class="nextpage">下一页</span>
																</div>
															</form>
														</td>
													</tr>
												</tfoot>
											</table>
										</div>
									</div>
								</div>
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->
				<!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<!--[if !IE]> -->


		<!-- <![endif]-->

		<!--[if IE]>

<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='<%=request.getContextPath()%>/administratorht/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='<%=request.getContextPath()%>/administratorht/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=request.getContextPath()%>/administratorht/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/bootstrap.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<script src="<%=request.getContextPath()%>/administratorht/assets/js/jquery.dataTables.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/jquery.dataTables.bootstrap.js"></script>

		<!-- ace scripts -->

		<script src="<%=request.getContextPath()%>/administratorht/assets/js/ace-elements.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/ace.min.js"></script>
	<script src="<%=request.getContextPath()%>/administratorht/js/page2.js"></script>
		<!-- inline scripts related to this page -->
		<style type="text/css">
			.paga .a{cursor:pointer;width:26px; cursor:pointer; height:26px;display:block; float:left; border:1px #aaa solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px; text-align:center; line-height:26px; margin-left:12px;}
			.prepage{font-size:12px;cursor:pointer;width:50px; cursor:pointer; height:26px;display:block; float:left; border:1px #aaa solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px; text-align:center; line-height:26px; margin-left:12px;}
			.nextpage{font-size:12px;cursor:pointer;width:50px; cursor:pointer; height:26px;display:block; float:left; border:1px #aaa solid; border-radius:3px; -moz-border-radius: 3px; -webkit-border-radius: 3px; text-align:center; line-height:26px; margin-left:12px;}
			.table-responsive table tr td{height:40px;}
		</style>
		<script type="text/javascript">
			$(".year,.month").change(function(){
				var year = $(".year").val();
				var month = $(".month").val();
				if(year!=null && month!=null && year!='' && month!=''){
					$(".date").val(year+"-"+month);
				}else{
					$(".date").val("");
				}
			})
		</script>
		<script type="text/javascript">
			$("#pagi").paging({
				pagename:"playerdata",
				conditionclass:".gamename",
				condition:"gamename",
				conditionclass1:".date",
				condition1:"date"
				});
		</script>
	</c:if>
	<c:if test="${admin.username == null}">
		<script>
			window.location.href="administratorht/login.jsp"; 
		</script>
	</c:if>
</body>
</html>