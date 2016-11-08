<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'from.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link href="<%=request.getContextPath()%>/administratorht/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/font-awesome.min.css" />

		<!--[if IE 7]>
		  <link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

		<!-- page specific plugin styles -->

		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/jquery-ui-1.10.3.custom.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/chosen.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/datepicker.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/bootstrap-timepicker.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/daterangepicker.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/administratorht/assets/css/colorpicker.css" />

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
<style type="text/css">
.ssul li{margin: 0; padding: 0;}		
.ssul li:hover{background-color: blue;color: #FFF;cursor: pointer;}
.game1{border: 1px solid #eee; padding: 3px; margin-left: 2px; cursor: pointer;}
</style>
	</head>

	<body>
	<c:if test="${admin.username != null}">
		<jsp:include page="../include/head.jsp"></jsp:include>

		<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

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
					
							<li class="active">专辑管理</li>
							<li>
								<a href="<%=request.getContextPath()%>/administrator/giftinfo.do">专辑信息列表</a>
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
						<div class="page-header">
							<h1>
								<small>
								<a href="<%=request.getContextPath()%>/administrator/giftinfo.do">专辑信息列表</a>
								</small>
								<i class="icon-double-angle-right"></i>
								添加专辑
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<input type="text" style="display: none;" value="${res }" class="res" />								
								<form action="/Yqwan/administrator/addrecord1.do" class="form-horizontal aaaa" role="form" method="post" enctype="multipart/form-data">
									
									
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 专辑名 </label>

										<div class="col-sm-9">
											<input type="text" name="name" id="form-field-1 name" placeholder="输入专辑名" class="col-xs-10 col-sm-5 name" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 描述 </label>
										
										<div class="col-sm-9">
											<input type="text" name="describe" id="form-field-1 describe" placeholder="输入描述" class="col-xs-10 col-sm-5 describe" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 点击 </label>
										
										<div class="col-sm-9">
											<input type="text" name="click" id="form-field-1 click" placeholder="输入初始点击量" class="col-xs-10 col-sm-5 click" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 评分 </label>
										
										<div class="col-sm-9">
											<input type="text" name="score" id="form-field-1 score" placeholder="输入评分" class="col-xs-10 col-sm-5 score" />
										</div>
									</div>
									<div class="space-4"></div>
									<div class="form-group" style="overflow:hidden;" style="">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 专辑banner </label>

										<div class="col-sm-9">
											<input type="file" name="banner" id="id-input-file-1" style="top:10px; display:block;" />
										</div>
									</div>
									<div class="space-4"></div>
									<div class="form-group" style="overflow:hidden;" style="">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 专辑图片 </label>

										<div class="col-sm-9">
											<input type="file" name="picture1" id="id-input-file-2" style="top:10px; display:block;" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 专辑名 </label>

										<div class="col-sm-9" style="position: relative;">
											<div class="xzyx" style="height: 28px; width: 41.6666%; border: 1px solid #ccc;cursor: pointer; line-height: 28px;">点击选择游戏</div>
											<div class="sswk" style="height: 230px; width: 40.9%; border: 1px solid #ccc;  background-color: #FFF;display: none;">
												<!-- <div>1-100</div><div>101-200</div><div>201-300</div><div>301-400</div><div>401-300</div><div>301-400</div> -->
												<input type="text" class="sscx" style="width:100%" placeholder="输入游戏名" />

												<div class="muy" style="height: 28px; width: 40.9%; cursor: pointer;display: none;">找不到关键词</div>
												<ul class="ssul" style="list-style: none; overflow-y: scroll; height: 200px; margin:0; ">
													<c:forEach items="${gamelist}" var="g">
														<li lang="${g.gameid }">${g.gamename }</li>
													</c:forEach>
												</ul>
											</div>
											<input type="text" class="gameid" style="width:300px;display:none;" name="gameid"  />
											<div class="cksj"></div>
										</div>
									</div>
									<div class="space-4"></div>
									<div class="clearfix form-actions">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn btn-info" type="button">
												<i class="icon-ok bigger-110"></i>
												提交
											</button>
											&nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset">
												<i class="icon-undo bigger-110"></i>
												重置
											</button>
										</div>
									</div>
								</form>
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

		<!--[if lte IE 8]>
		  <script src="<%=request.getContextPath()%>/administratorht/assets/js/excanvas.min.js"></script>
		<![endif]-->
		
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/chosen.jquery.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/fuelux/fuelux.spinner.min.js"></script>
	<!--	<script src="<%=request.getContextPath()%>/administratorht/assets/js/date-time/bootstrap-datepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/date-time/bootstrap-timepicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/date-time/moment.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/date-time/daterangepicker.min.js"></script>-->
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/jquery.knob.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/jquery.autosize.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/jquery.maskedinput.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/bootstrap-tag.min.js"></script>
		
		<!-- ace scripts -->
		<script type="text/javascript">
			$(".xzyx").click(function(){
				var xzyx = $(this).text();
				if(xzyx == "点击选择游戏"){
					$(this).text("选择完毕");
					$(".sswk").css("display","block");
				}else{
					$(this).text("点击选择游戏");
					$(".sswk").css("display","none");
				}
			});
			$(".sscx").bind('input propertychange', function() {
				var sscx = $(this).val();
				var ssul = $(".ssul li").length;
				$(".ssul li").css("display","none");
				$(".muy").css("display","none");
				$(".ssul").css("display","block");
				var a = 0;
				var b = 0;
				$(".ssul li").each(function(){
					var sss = $(this).text();
					if(sss.indexOf(sscx)>=0){
						$(this).css("display","block");
						a=true;
						b = b+1;
					}
				});
				if(b==0 || b>=10){
					$(".ssul").css("height","200px");
					$(".sswk").css("height","228px");
					$(".ssul").css("overflow-y","scroll");
				}else{
					$(".ssul").css("overflow","inherit");
					$(".ssul").css("height",b*20+"px");
					$(".sswk").css("height",b*20+28+"px");
				}
				if(!a){
					$(".muy").css("display","block");
					$(".ssul").css("display","none");
					$(".sswk").css("height","48px");
				}
			}); 
			$(".ssul li").click(function(){
				$(this).css("color","red");
				var sscx = $(this).text()
				var sscxlang = $(this).attr("lang");
				var gameid = $(".gameid").val();
				var islf = $(".gameid").val();
				if(islf.indexOf(sscxlang)==-1){
					if(gameid!=""){
						$(".gameid").val(gameid+","+sscxlang);
						$(".cksj").append("<span class='game1' lang='"+sscxlang+"'>"+sscx+"</span>");
						$(".game1").on("click" ,function(){
							var game1 = $(this).text();
							$(".ssul li").each(function(){
								var ssulli = $(this).text();
								if(ssulli==game1){
									$(this).removeAttr("style");
									var ssullilang = $(this).attr("lang");
									var gameid = $(".gameid").val();
									if(gameid == ssullilang){
										$(".gameid").val("");
									}else{
										gameid = gameid.replace(","+ssullilang,"");
										gameid = gameid.replace(ssullilang+",","");
										$(".gameid").val(gameid);
									}
								}
							});
							$(this).remove();
						});
					}else{
						$(".gameid").val(sscxlang);
						$(".cksj").append("<span class='game1' lang='"+sscxlang+"'>"+sscx+"</span>");
						$(".game1").on("click" ,function(){
							var game1 = $(this).text();
							$(".ssul li").each(function(){
								var ssulli = $(this).text();
								if(ssulli==game1){
									$(this).removeAttr("style");
									var ssullilang = $(this).attr("lang");
									var gameid = $(".gameid").val();
									if(gameid == ssullilang){
										$(".gameid").val("");
									}else{
										gameid = gameid.replace(","+ssullilang,"");
										gameid = gameid.replace(ssullilang+",","");
										$(".gameid").val(gameid);
									}
								}
							});
							$(this).remove();
						});
					}
				}else{
					alert("该游戏已选择");
				}
			});
			$(function(){
				var res = $(".res").val();
				if(res > 0 && res!="" ){
					alert("添加成功");
				}
			});
		</script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/ace-elements.min.js"></script>
		<script src="<%=request.getContextPath()%>/administratorht/assets/js/ace.min.js"></script>
		
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			$(function(){
				$(".chosen-resules .active-result").click(function(){
					alert($(this).text());
					$(".gamename").children("option");
				});
			});
		</script>
		<script type="text/javascript">
			$(function(){
				$(".btn-info").click(function(){
					$(".aaaa").submit();
					alert("提交成功");
				})
			})
		</script>
		<script type="text/javascript">
			jQuery(function($) {
				
				$('#id-disable-check').on('click', function() {
					var inp = $('#form-input-readonly').get(0);
					if(inp.hasAttribute('disabled')) {
						inp.setAttribute('readonly' , 'true');
						inp.removeAttribute('disabled');
						inp.value="This text field is readonly!";
					}
					else {
						inp.setAttribute('disabled' , 'disabled');
						inp.removeAttribute('readonly');
						inp.value="This text field is disabled!";
					}
				});
			
			
				$(".chosen-select").chosen(); 
				$('#chosen-multiple-style').on('click', function(e){
					var target = $(e.target).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			
			
				$('[data-rel=tooltip]').tooltip({container:'body'});
				$('[data-rel=popover]').popover({container:'body'});
				
				$('textarea[class*=autosize]').autosize({append: "\n"});
				$('textarea.limited').inputlimiter({
					remText: '%n character%s remaining...',
					limitText: 'max allowed : %n.'
				});
			
				$.mask.definitions['~']='[+-]';
				$('.input-mask-date').mask('99/99/9999');
				$('.input-mask-phone').mask('(999) 999-9999');
				$('.input-mask-eyescript').mask('~9.99 ~9.99 999');
				$(".input-mask-product").mask("a*-999-a999",{placeholder:" ",completed:function(){alert("You typed the following: "+this.val());}});
			
			
			
				$( "#input-size-slider" ).css('width','200px').slider({
					value:1,
					range: "min",
					min: 1,
					max: 8,
					step: 1,
					slide: function( event, ui ) {
						var sizing = ['', 'input-sm', 'input-lg', 'input-mini', 'input-small', 'input-medium', 'input-large', 'input-xlarge', 'input-xxlarge'];
						var val = parseInt(ui.value);
						$('#form-field-4').attr('class', sizing[val]).val('.'+sizing[val]);
					}
				});
			
				$( "#input-span-slider" ).slider({
					value:1,
					range: "min",
					min: 1,
					max: 12,
					step: 1,
					slide: function( event, ui ) {
						var val = parseInt(ui.value);
						$('#form-field-5').attr('class', 'col-xs-'+val).val('.col-xs-'+val);
					}
				});
				
				
				$( "#slider-range" ).css('height','200px').slider({
					orientation: "vertical",
					range: true,
					min: 0,
					max: 100,
					values: [ 17, 67 ],
					slide: function( event, ui ) {
						var val = ui.values[$(ui.handle).index()-1]+"";
			
						if(! ui.handle.firstChild ) {
							$(ui.handle).append("<div class='tooltip right in' style='display:none;left:16px;top:-6px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>");
						}
						$(ui.handle.firstChild).show().children().eq(1).text(val);
					}
				}).find('a').on('blur', function(){
					$(this.firstChild).hide();
				});
				
				$( "#slider-range-max" ).slider({
					range: "max",
					min: 1,
					max: 10,
					value: 2
				});
				
				$( "#eq > span" ).css({width:'90%', 'float':'left', margin:'15px'}).each(function() {
					// read initial values from markup and remove that
					var value = parseInt( $( this ).text(), 10 );
					$( this ).empty().slider({
						value: value,
						range: "min",
						animate: true
						
					});
				});
			
				
				
				$('#id-input-file-1').ace_file_input({
					no_file:'传入图片尺寸1200 x 320',
					btn_choose:'选择',
					btn_change:'Change',
					droppable:false,
					onchange:null,
					thumbnail:false //| true | large
					//whitelist:'gif|png|jpg|jpeg'
					//blacklist:'exe|php'
					//onchange:''
					//
				});
				$('#id-input-file-2').ace_file_input({
					no_file:'传入图片尺寸300 x 210',
					btn_choose:'选择',
					btn_change:'Change',
					droppable:false,
					onchange:null,
					thumbnail:false //| true | large
					//whitelist:'gif|png|jpg|jpeg'
					//blacklist:'exe|php'
					//onchange:''
					//
				});
				$('#id-input-file-5').ace_file_input({
					no_file:'传入图片尺寸325 x 246',
					btn_choose:'选择',
					btn_change:'Change',
					droppable:false,
					onchange:null,
					thumbnail:false //| true | large
					//whitelist:'gif|png|jpg|jpeg'
					//blacklist:'exe|php'
					//onchange:''
					//
				});
				
				$('#id-input-file-3').ace_file_input({
					style:'well',
					btn_choose:'Drop files here or click to choose',
					btn_change:null,
					no_icon:'icon-cloud-upload',
					droppable:true,
					thumbnail:'small'//large | fit
					//,icon_remove:null//set null, to hide remove/reset button
					/**,before_change:function(files, dropped) {
						//Check an example below
						//or examples/file-upload.html
						return true;
					}*/
					/**,before_remove : function() {
						return true;
					}*/
					,
					preview_error : function(filename, error_code) {
						//name of the file that failed
						//error_code values
						//1 = 'FILE_LOAD_FAILED',
						//2 = 'IMAGE_LOAD_FAILED',
						//3 = 'THUMBNAIL_FAILED'
						//alert(error_code);
					}
			
				}).on('change', function(){
					//console.log($(this).data('ace_input_files'));
					//console.log($(this).data('ace_input_method'));
				});
			
				//dynamically change allowed formats by changing before_change callback function
				$('#id-file-format').removeAttr('checked').on('change', function() {
					var before_change
					var btn_choose
					var no_icon
					if(this.checked) {
						btn_choose = "Drop images here or click to choose";
						no_icon = "icon-picture";
						before_change = function(files, dropped) {
							var allowed_files = [];
							for(var i = 0 ; i < files.length; i++) {
								var file = files[i];
								if(typeof file === "string") {
									//IE8 and browsers that don't support File Object
									if(! (/\.(jpe?g|png|gif|bmp)$/i).test(file) ) return false;
								}
								else {
									var type = $.trim(file.type);
									if( ( type.length > 0 && ! (/^image\/(jpe?g|png|gif|bmp)$/i).test(type) )
											|| ( type.length == 0 && ! (/\.(jpe?g|png|gif|bmp)$/i).test(file.name) )//for android's default browser which gives an empty string for file.type
										) continue;//not an image so don't keep this file
								}
								
								allowed_files.push(file);
							}
							if(allowed_files.length == 0) return false;
			
							return allowed_files;
						}
					}
					else {
						btn_choose = "Drop files here or click to choose";
						no_icon = "icon-cloud-upload";
						before_change = function(files, dropped) {
							return files;
						}
					}
					var file_input = $('#id-input-file-3');
					file_input.ace_file_input('update_settings', {'before_change':before_change, 'btn_choose': btn_choose, 'no_icon':no_icon})
					file_input.ace_file_input('reset_input');
				});
			
			
			
			
				$('#spinner1').ace_spinner({value:0,min:0,max:200,step:10, btn_up_class:'btn-info' , btn_down_class:'btn-info'})
				.on('change', function(){
					//alert(this.value)
				});
				$('#spinner2').ace_spinner({value:0,min:0,max:10000,step:100, touch_spinner: true, icon_up:'icon-caret-up', icon_down:'icon-caret-down'});
				$('#spinner3').ace_spinner({value:0,min:-100,max:100,step:10, on_sides: true, icon_up:'icon-plus smaller-75', icon_down:'icon-minus smaller-75', btn_up_class:'btn-success' , btn_down_class:'btn-danger'});
			
			
				
				$('.date-picker').datepicker({autoclose:true}).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				$('input[name=date-range-picker]').daterangepicker().prev().on(ace.click_event, function(){
					$(this).next().focus();
				});
				
				$('#timepicker1').timepicker({
					minuteStep: 1,
					showSeconds: true,
					showMeridian: false
				}).next().on(ace.click_event, function(){
					$(this).prev().focus();
				});
				
				$('#colorpicker1').colorpicker();
				$('#simple-colorpicker-1').ace_colorpicker();
			
				
				$(".knob").knob();
				
				
				//we could just set the data-provide="tag" of the element inside HTML, but IE8 fails!
				var tag_input = $('#form-field-tags');
				if(! ( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase())) ) 
				{
					tag_input.tag(
					  {
						placeholder:tag_input.attr('placeholder'),
						//enable typeahead by specifying the source array
						source: ace.variable_US_STATES,//defined in ace.js >> ace.enable_search_ahead
					  }
					);
				}
				else {
					//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
					tag_input.after('<textarea id="'+tag_input.attr('id')+'" name="'+tag_input.attr('name')+'" rows="3">'+tag_input.val()+'</textarea>').remove();
					//$('#form-field-tags').autosize({append: "\n"});
				}
				
				
				
			
				/////////
				$('#modal-form input[type=file]').ace_file_input({
					style:'well',
					btn_choose:'Drop files here or click to choose',
					btn_change:null,
					no_icon:'icon-cloud-upload',
					droppable:true,
					thumbnail:'large'
				})
				
				//chosen plugin inside a modal will have a zero width because the select element is originally hidden
				//and its width cannot be determined.
				//so we set the width after modal is show
				$('#modal-form').on('shown.bs.modal', function () {
					$(this).find('.chosen-container').each(function(){
						$(this).find('a:first-child').css('width' , '210px');
						$(this).find('.chosen-drop').css('width' , '210px');
						$(this).find('.chosen-search input').css('width' , '200px');
					});
				})
				/**
				//or you can activate the chosen plugin after modal is shown
				//this way select element becomes visible with dimensions and chosen works as expected
				$('#modal-form').on('shown', function () {
					$(this).find('.modal-chosen').chosen();
				})
				*/
			
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
