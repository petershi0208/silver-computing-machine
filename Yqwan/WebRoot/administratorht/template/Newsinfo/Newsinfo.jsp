<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/css/giftinfo.css" />
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
					
							<li class="active">新闻管理</li>
							<li>
								新闻信息列表
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
						

						<div class="row" id="pagi">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->

								<!-- /row -->

								<div class="hr hr-18 dotted hr-double"></div>

								<h4 class="pink">
									<i class="icon-hand-right icon-animated-hand-pointer blue"></i>
									<a href="<%=request.getContextPath()%>/administrator/adgiftinfo.do" role="button" class="green" data-toggle="modal"> 添加礼包 </a>
								</h4>

								<div class="hr hr-18 dotted hr-double"></div>

								<div class="row">
									<div class="col-xs-12">
										<h3 class="header smaller lighter blue">新闻信息列表</h3>
										<form action="giftinfo.do" method="post">
											新闻名:<input type="text" name="title" class="title" value="${title }" />
											<input type="button" class="btnn" value="查询" >
										</form>
										<div style="height:15px;"></div>
										<div class="table-header">
											游戏数据信息展示
										</div>
										<div class="table-responsive">
											<table id="sample-table-2" class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th>编号</th>
														<th>新闻编号</th>
														<th>首页图片</th>
														<th>标题</th>														
														<th>作者</th>
														<th>时间</th>
														<th>来源</th>
														<th>描述</th>
														<th>
															<i class="icon-time bigger-110 hidden-480"></i>
															操作
														</th>
													</tr>
												</thead>

												<tbody>
													<c:forEach items="${news}" var="n">
													<tr>
														<td>${n.id }</td>
														<td>${n.newsid }</td>
														<td><div style="width:250px;height:120px;"><img src="${n.indexpicture}"/></div></td>
														<td class="title">${n.title }</td>
														
														<td>${n.author }</td>
														<td>${n.date }</td>
														<td>${n.origin }</td>
														<td>${n.description }</td>
														<td>
															<div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
																<a class="green" href="<%=request.getContextPath()%>/singlenews.do?id=${n.id }">
																	<i class="icon-pencil bigger-130"></i>
																</a>
																<a class="red delete"  onclick="javascript:if(confirm('确定要删除此信息吗？')){alert('删除成功！');location.href='deletenews.do?id=${n.id}&title=${title }';return true;}return false;">
																	<i class="icon-trash bigger-130 delete"></i>
																</a>
															</div>
														</td>
													</tr>
													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<td colspan="12">															
															<div style="float:left; margin-top:10px;">总条数：<span class="count">${count }</span></div>
															<div class="paga" style="margin:10px auto; width:350px; height:30px;">
																<span class="prepage">上一页</span>
																<span class="currentpage1 a">1</span>
																<span class="nextpage">下一页</span>
															</div>
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
		<script src="<%=request.getContextPath()%>/administratorht/js/page.js"></script>
		<script type="text/javascript">
		 $("td.contte").each(function () {
			    var content=$(this).html();
			    var content1 = content.replace(/@/g,"&");
				$(this).html(content1);
			});
		 $("td.title").each(function () {
			var title=$(this).html();
			var title1 = title.replace(/@/g,"&");
			$(this).html(title1);
			});
		$("#pagi").paging({
			pagename:"newslist",
			conditionclass:".title",
			condition1:"title",
			pagesize:20
		});
		$(function(){
			$("img").css({"width":"30%","height":"30%"});
		});
		</script>
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
	
		<!-- inline scripts related to this page -->
</body>
</html>