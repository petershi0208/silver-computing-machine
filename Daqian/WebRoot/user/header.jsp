<%@page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<script type="text/javascript" src="<%=request.getContextPath()%>/user/hyzx/js/jquery-1.7.1.min.js"></script>
<span style="display:none;"><script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1257485270'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/z_stat.php%3Fid%3D1257485270%26show%3Dpic' type='text/javascript'%3E%3C/script%3E"));</script></span>
<div id="top">
	<div class="head_pojoDiv_01">
		<div class="head_pojoDiv_02">
			<div class="head_leftService_DIV">
				<a href="">
				<div id="head_phone">
					<div id="imgs">
						<img src="<%=request.getContextPath()%>/index_files/huiseipone.png" style="margin-left:30px; margin-top:-2px;" onmousemove="this.src='<%=request.getContextPath()%>/index_files/whiteipone.png'" onmouseout="this.src='<%=request.getContextPath()%>/index_files/huiseipone.png'" height="23px" width="190px">
					</div>
				</div>
				</a>
			</div>
                        <div class="head_concern">
                        <a target="_blank" href="">
                        <div id="head_con">
                        <span class="concern_we" >关注我们</span>
                         <div id="imgs" class="imgsss">
						<nobr><img src="<%=request.getContextPath()%>/index_files/wb.png"></nobr><nobr>
						</nobr><nobr><img src="<%=request.getContextPath()%>/index_files/wx.png" ></nobr><nobr>
						</nobr><nobr></nobr><nobr>
						</div>
                        </nobr></div><nobr>
                        
                        </nobr></a><nobr>
                        
                        </nobr></div><nobr>
                        
			<div class="head_weixin_div">
                        <a href="###">
                        <div id="head_weixin" onmouseover="disBlock('imgs_ios');" onmouseout="disNone('imgs_ios');">
                        <div id="imgs"></div>
                        </div>
                        </a>
                <a href="###">
                <div id="head_mobile">
                      <div id="imgs_ios" style="display:none;">
                         <div style="float:left;">
                        	<p>
                        		<img src="<%=request.getContextPath()%>/index_files/erweima.png" alt="">
                        	</p>
                        	<p style="text-align:center">苹果系统</p>
                         </div>
                         <div style="float:left;margin-left:5%;">
	                        <p>
	                            <img src="<%=request.getContextPath()%>/index_files/erweima.png" alt="">
	                        </p>
                        	<p style="text-align:center">安卓系统</p>
                          </div>
                           <em id="up"></em>
                      </div>
                      
                       <!--  <div id="imgs_android" style="margin-left:10px;"></div> -->
                </div>
                </a>
            </div>
                         

					  <div class="head_right_Div">				
							<input id="username" name="username" value=${username}>
							
                          <span style="display:none" id="welcome_username" class="head_right_Font">
                           	  <span class="head_right_Font03">您好，</span>
                            	
                           	  <a title="个人信息" href="<%=request.getContextPath()%>/tomember.do" style="color:#FFF;">
                           		  <span class="head_right_Font02">${username}</span>&nbsp;&nbsp;                           	  </a>
                              <a title="退出" href="/Daqian/destroy.do">
                            	  <span id="head_03" class="head_right_Font02">[退出]</span>                              </a> &nbsp;&nbsp;
              
                              <a title="系统消息" href="<%=request.getContextPath()%>/tomember.do"> 
								  <span id="head_03" class="head_right_Font02">消息</span></a>
								  <a href="<%=request.getContextPath()%>/user/help.jsp" > 
							  <span id="head_03" class="head_right_Font02" style="margin-left:20px;">帮助</span></a>
						  </span>
					         
                          <span style="" id="Not_loggedin">
							  <a href="<%=request.getContextPath()%>/user/registered.jsp"> 
								  <span id="head_01" class="head_right_Font">快速注册</span>							  </a> 
								
							  <a href="<%=request.getContextPath()%>/user/login.jsp"> 
								  <span id="head_02" class="head_right_Font">立即登录</span>	</a>
								  <a href="<%=request.getContextPath()%>/user/help.jsp" > 
							  <span id="head_03" class="head_right_Font02">帮助</span></a>
						   </span> 
							
						 
					</div>
					</nobr></div><nobr>
				</nobr></div><nobr>
				

			
				<div class="head_tow_div">

					<div class="head_tow_div_02">
						<div class="head_tow_div_03">
							<a href="<%=request.getContextPath()%>/index.do" title="LOGO">
								<div class="head_pojoDiv_04"></div>
								<div class="head_logoImg">
								<img src="<%=request.getContextPath()%>/index_files/logo.png" height="48" width="159">								</div>
							</a>

							<div class="head_title02Img">
							<img src="<%=request.getContextPath()%>/index_files/l.png" style="margin-left:15px; margin-top:-10px">
							</div>

							<div class="head_title03Img"><img src="<%=request.getContextPath()%>/index_files/ll.png" height="25" width="270"></div>

						
							<div class="head_menuRight_Div">
								<div class="menu">
									<ul>
										<li><a class="hide" href="<%=request.getContextPath()%>/index.do">首页</a>

									  </li>
									  <li id="invest_col" style="position:relative;"><a class="hide" href="<%=request.getContextPath()%>/moreproduct.do">我要理财</a>
												<!--[if lte IE 6]>
											<a href="###">MENUS
											<table><tr><td>
											<![endif]
												<ul style="height:70%;" id="li-ul">
													<li><a href="<%=request.getContextPath()%>/user/introduction.jsp" title="产品介绍">产品介绍</a></li>
					
													<li><a href="<%=request.getContextPath()%>/product.do" title="快速理财">快速理财</a></li>
												</ul> -->
											</td></tr></table>
											</a>
											<![endif]-->
											</li>
											<li><a class="hide" href="<%=request.getContextPath()%>/user/borrow.jsp" onclick="borproduct();">我要借款</a> <!--[if lte IE 6]>
											<a href="###">LAYOUTS
											<table><tr><td>
											<![endif]-->
	<!-- 											<ul>
													<li><a href="/webApplicationLoan/borProducts" title="零用贷">零用贷</a></li>
													<li><a href="###" title="数码专区">数码专区</a></li>
													<li><a href="###" title="优惠信息">优惠信息</a></li>
													<li><a href="/webApplicationLoan/borProducts" title ="产品专区">产品专区</a></li>

												</ul> [if lte IE 6]>
											</td></tr></table>
											</a>
											<![endif]--></li>
											
											<li>
												<a class="hide" href="/Daqian/tomember.do">会员中心</a>
											</li>
											
											<li>
												<a class="hide" href="<%=request.getContextPath()%>/user/guide.jsp">新人指南</a> 
												<!--[if lte IE 6]>
												<a href="###">MOZILLA
												<table><tr><td>
												<![endif]-->
												
										 </li>
										
											
										<li style="position:relative;"><a class="hide" href="<%=request.getContextPath()%>/user/aboutourself.jsp">关于我们</a> <!--[if lte IE 6]>
										<a href="###">EXPLORER
										<table><tr><td>
										<![endif]-->
												<ul>
													<li><a href="<%=request.getContextPath()%>/user/aboutourself.jsp" title="公司介绍">公司介绍</a></li>
													<li><a href="<%=request.getContextPath()%>/dynamic.do" title="公司动态">公司动态</a></li>
													<li><a href="<%=request.getContextPath()%>/user/media.jsp" title="公司动态">媒体动态</a></li>
													<li><a href="<%=request.getContextPath()%>/user/Recruitment.jsp" title="诚聘英才">诚聘英才</a></li>
													<li><a href="<%=request.getContextPath()%>/user/callme.jsp" title="联系我们">联系我们</a></li>
													
									 	 </ul> 
									  <!--[if lte IE 6]>
											</td></tr></table>
											</a>
											<![endif]--></li>
									</ul>
									<!-- clear the floats if required -->
									<div class="clear" style="background-color: #f3f4f8;"></div>
								</div>
							</div>						
						</div>
					</div>
				</div>
			</nobr></div>