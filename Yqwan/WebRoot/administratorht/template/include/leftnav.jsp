<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/Yqwan/js/jquery-1.7.1.js"></script>
<div class="sidebar" id="sidebar">
		<style type="text/css">
			#youxiguanli,#zhuanjiguanli,#fahaoguanli,#yonghuguanli,#tuiguangyuanguanli,#bannertuguanli,#pinglunguanli,#xinwenguanli,#youxixinxi{display:none;}
		</style>
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<script type="text/javascript">
						var type= '${admin.type}';
						if('newsadmin'==type){
							$(function(){
								$('#xinwenguanli').css('display','block');
							})							
						}else if('gameadmin'==type){
							$(function(){
								$('#youxiguanli,#zhuanjiguanli,#fahaoguanli,#bannertuguanli').css('display','block');
							})
						}else if('admin'==type){
							$(function(){
								$('#youxiguanli,#zhuanjiguanli,#fahaoguanli,#yonghuguanli,#tuiguangyuanguanli,#bannertuguanli,#pinglunguanli,#xinwenguanli,#youxixinxi').css('display','block');
							})
						}
					</script>

					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div><!-- #sidebar-shortcuts -->

					<ul class="nav nav-list">
						<li class="active">
							<a href="<%=request.getContextPath()%>/administratorht/template/index.jsp">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> 控制台 </span>
							</a>
						</li>

						<li id="youxiguanli">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-text-width"></i>
								<span class="menu-text"> 游戏管理 </span>
								
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrator/gamelist.do">
										<i class="icon-double-angle-right"></i>
										游戏列表
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/gameinfo.do">
										<i class="icon-double-angle-right"></i>
										游戏详细信息
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administratorht/template/gameinfo/addgame.jsp">
										<i class="icon-double-angle-right"></i>
										添加游戏
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/gamedistrict.do">
										<i class="icon-double-angle-right"></i>
										游戏分区列表
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/adddistrict.do">
										<i class="icon-double-angle-right"></i>
										添加游戏分区
									</a>
								</li>
							</ul>
						</li>
						<li id="zhuanjiguanli">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-text-width"></i>
								<span class="menu-text"> 专辑管理 </span>
								
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrator/recordinfo.do">
										<i class="icon-double-angle-right"></i>
										专辑信息
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/addrecord.do">
										<i class="icon-double-angle-right"></i>
										添加专辑
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/gamelist.do">
										<i class="icon-double-angle-right"></i>
										添加游戏到专辑
									</a>
								</li>
							</ul>
						</li>
						<li id="fahaoguanli">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-text-width"></i>
								<span class="menu-text"> 发号管理 </span>
								
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrator/giftinfo.do">
										<i class="icon-double-angle-right"></i>
										礼包信息
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/cdkeyinfo.do">
										<i class="icon-double-angle-right"></i>
										发号信息
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/adgiftinfo.do">
										<i class="icon-double-angle-right"></i>
										添加礼包
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/temp/addcdkey.do">
										<i class="icon-double-angle-right"></i>
										添加礼包号
									</a>
								</li>
							</ul>
						</li>
						<li id="yonghuguanli">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-text-width"></i>
								<span class="menu-text"> 用户管理 </span>
								
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrator/userinfo.do">
										<i class="icon-double-angle-right"></i>
										用户信息查看
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/tradeinfo.do">
										<i class="icon-double-angle-right"></i>
										充值记录查看
									</a>
								</li>
							</ul>
						</li>
						<li id="tuiguangyuanguanli">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-text-width"></i>
								<span class="menu-text"> 推广员管理 </span>								
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrator/promoter.do">
										<i class="icon-double-angle-right"></i>
										推广记录
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/promotertotal.do">
										<i class="icon-double-angle-right"></i>
										推广员信息
									</a>
								</li>
							</ul>
						</li>
						<li id="bannertuguanli">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-picture"></i>
								<span class="menu-text"> Banner图管理 </span>
	
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrator/banner3.do">
										<i class="icon-double-angle-right"></i>
										首页banner查看
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/adbanner3.do">
										<i class="icon-double-angle-right"></i>
										首页banner添加
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/cdkeybanner.do">
										<i class="icon-double-angle-right"></i>
										发号banner查看
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/adcdkeybanner.do">
										<i class="icon-double-angle-right"></i>
										发号banner添加
									</a>
								</li>
							</ul>
						</li>
						<li id="pinglunguanli">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-picture"></i>
								<span class="menu-text"> 评论管理 </span>
	
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrator/comment.do">
										<i class="icon-double-angle-right"></i>
										评论查看
									</a>
								</li>
							</ul>
						</li>
						
						<li id="xinwenguanli">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-picture"></i>
								<span class="menu-text"> 新闻管理 </span>
	
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrat/addnews.do">
										<i class="icon-double-angle-right"></i>
										发布新闻
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/newslist.do">
										<i class="icon-double-angle-right"></i>
										查看新闻
									</a>
								</li>
							</ul>
						</li>
						
						<li id="youxixinxi">
							<a href="javascript:;"  class="dropdown-toggle">
								<i class="icon-text-width"></i>
								<span class="menu-text"> 游戏信息 </span>
								
								<b class="arrow icon-angle-down"></b>
							</a>
							
							<ul class="submenu">
								<li>
									<a href="<%=request.getContextPath() %>/administrator/player.do">
										<i class="icon-double-angle-right"></i>
										玩家信息
									</a>
								</li>
								<li>
									<a href="<%=request.getContextPath() %>/administrator/playerdata.do">
										<i class="icon-double-angle-right"></i>
										游戏统计
									</a>
								</li>
							</ul>
						</li>

					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
					
				</div>