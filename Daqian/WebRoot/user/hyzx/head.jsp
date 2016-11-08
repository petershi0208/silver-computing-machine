<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link href="css/head.css" rel="stylesheet" type="text/css">
<div id="top">

				<div class="head_pojoDiv_01">
					<div class="head_pojoDiv_02">


						<div class="head_leftService_DIV">
							<a href="">
								<div id="head_phone">
										<div id="imgs"><img src="images/huiseipone.png" style="margin-left:30px; margin-top:-2px;" onmousemove="this.src='images/whiteipone.png'" onmouseout="this.src='images/huiseipone.png'" height="23px" width="190px"></div>
								</div>
						  </a>
					  </div>
                        <div class="head_concern">
                        <a target="_blank" href="">
                        <div id="head_con">
                        <span class="concern_we">关注我们</span>
                        <div id="imgs">
						<nobr><img src="images/wb.png"></nobr><nobr>
						</nobr><nobr><img src="images/wx.png"></nobr><nobr>
						</nobr><nobr><img src="images/p.png"></nobr><nobr>
						</nobr></div><nobr>
                        </nobr></div><nobr>
                        
                        </nobr></a><nobr>
                        
                        </nobr></div><nobr>
					   <div class="head_weixin_div">
                        <a href="#">
                        <div id="head_weixin">
                        <div id="imgs"></div>
                        </div>
                        </a>
                        <a href="#">
                        <div id="head_mobile" onmouseover="disBlock('imgs_ios');" onmouseout="disNone('imgs_ios');">
                        <div id="imgs_ios" style="display: none;">
                         <div style="float:left;">
                        	<p>
                        		<img src="images/ios.png" alt="">                        	</p>
                        	<p style="text-align:center">苹果系统</p>
                         </div>
                         <div style="float:left;margin-left:5%;">
	                        <p>
	                            <img src="images/android.png" alt="">	                        </p>
                        	<p style="text-align:center">安卓系统</p>
                          </div>
                           <em id="up"></em>                        </div>
                      
                       <!--  <div id="imgs_android" style="margin-left:10px;"></div> -->
                        </div>
                        </a>
                      </div>
                         

					  <div class="head_right_Div">				
							<input id="username" name="username">
							
                          <span style="display: none;" id="welcome_username" class="head_right_Font">
                           	  <span class="head_right_Font03">您好，</span>
                            	
                           	  <a title="个人信息" href="" style="color: #FFF;">
                           		  <span class="head_right_Font02"></span>&nbsp;&nbsp;                           	  </a>
                              <a title="退出" href="http://www.lingyongdai.com/webApplicationSign/logout">
                            	  <span id="head_03" class="head_right_Font02">[退出]</span>                              </a> &nbsp;&nbsp;
              
                              <a title="系统消息" href=""> 
								  <span id="head_03" class="head_right_Font02">消息</span>							  </a>                          </span>
					         
                          <span style="" id="Not_loggedin">
							  <a href="registered.htm"> 
								  <span id="head_01" class="head_right_Font">快速注册</span>							  </a> 
								
							  <a href="login.htm"> 
								  <span id="head_02" class="head_right_Font">立即登录</span>							  </a>						  </span> 
							
						  <a href="help.htm"> 
							  <span id="head_03" class="head_right_Font02">帮助</span>						  </a>						</div>
					</nobr></div><nobr>
				</nobr></div><nobr>
				

			
				<div class="head_tow_div">

					<div class="head_tow_div_02">
						<div class="head_tow_div_03">
							<a href="index.htm" title="LOGO">
								<div class="head_pojoDiv_04"></div>
								<div class="head_logoImg">
								<img src="images/logo.png" height="48" width="159">								</div>
							</a>

							<div class="head_title02Img">
							<img src="images/l.png" style="margin-left:15px; margin-top:-10px">
							</div>

							<div class="head_title03Img"><img src="images/ll.png" height="25" width="270"></div>

						
							<div class="head_menuRight_Div">
								<div class="menu">
									<ul>
										<li><a class="hide" href="index.htm">首页</a>

									  </li>
									  <li id="invest_col" style="position:relative;"><a class="hide" href="product.htm">我要理财</a>
												<!--[if lte IE 6]>
											<a href="###">MENUS
											<table><tr><td>
											<![endif]-->
												<ul style="height:70%;" id="li-ul">
													<li><a href="introduction.htm" title="产品介绍">产品介绍</a></li>
														<li>
													<a  href="products.htm" title="双季盈" id="xinshoubiao">双季盈</a></li>
														<li>
													<a href="products.htm" title="当月盈" id="zhouzhoule">当月盈</a></li>
														<li>
													<a href="products.htm" title="月月盈" id="yueyueying">月月盈</a></li>
														<li>
													<a href="products.htm" title="当季盈" id="yijibao">当季盈</a></li>
														<li>
													<a href="products.htm" title="双季盈B" id="shuangjiying">双季盈B</a></li>
														<li>
													<a href="products.htm" title="年度盈" id="sanjifu">年度盈</a></li>
													<li>
													<a href="products.htm" title="双年盈" id="sijifeng">双年盈</a></li>
													<li>
													<a href="products.htm" title="快速理财">快速理财</a></li>
														
													
												</ul> <!--[if lte IE 6]>
											</td></tr></table>
											</a>
											<![endif]-->
											</li>
											<li><a class="hide" href="borrow.htm" onclick="borproduct();">我要借款</a> <!--[if lte IE 6]>
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
												<a class="hide" href="<%=request.getContextPath()%>/user/login.jsp">会员中心</a>
											</li>
											
											<li style="position:relative;">
												<a class="hide" href="<%=request.getContextPath()%>/user/guide.htm">新人指南</a> 
												<!--[if lte IE 6]>
												<a href="###">MOZILLA
												<table><tr><td>
												<![endif]-->
												<ul>
													<li><a href="/webApplicationAbout/newGuidanceHelp?secondBackImg=secondBackImg_6&secondfont=secondfont_6&menu=propertyManage&rank=02&Fontcolor=propertyManageFontcolor&menuid=propertyId
									&secondbackimg=secondBackImg_6&secondfont=secondfont_6" title="如何注册">如何注册</a></li>
													<li><a href="/webApplicationAbout/howApplyHelp?secondBackImg=secondBackImg_16&secondfont=secondfont_16&menu=borrowMoney&rank=04&Fontcolor=borrowMoneyFontcolor&menuid=borrowMoneyId
									&secondbackimg=secondBackImg_16&secondfont=secondfont_16" title="如何申请">如何申请</a></li>
													<li><a href="/webApplicationAbout/borrowerTermHelp?secondBackImg=secondBackImg_13&secondfont=secondfont_13&menu=borrowMoney&rank=04&Fontcolor=borrowMoneyFontcolor&menuid=borrowMoneyId
									&secondbackimg=secondBackImg_13&secondfont=secondfont_13" title="借贷专区">借贷专区</a></li>
													<li><a href="/webApplicationAbout/investInstHelp?secondBackImg=secondBackImg_10&secondfont=secondfont_10&menu=manageMoney&rank=03&Fontcolor=manageMoneyFontcolor&menuid=manageMoneyId
									&secondbackimg=secondBackImg_10&secondfont=secondfont_10" title="理财专区">理财专区</a></li>
													<li><a href="/webApplicationAbout/rechargeHelp?secondBackImg=secondBackImg_22&secondfont=secondfont_22&menu=messageManage&rank=05&Fontcolor=messageFontcolor&menuid=messageManageId
									&secondbackimg=secondBackImg_22&secondfont=secondfont_22" title="成为会员">成为会员</a></li>
													<li><a href="/webApplicationAbout/borrowerProductHelp?secondBackImg=secondBackImg_14&secondfont=secondfont_14&menu=borrowMoney&rank=04&Fontcolor=borrowMoneyFontcolor&menuid=borrowMoneyId
									&secondbackimg=secondBackImg_14&secondfont=secondfont_14" title="产品分类">产品分类</a></li>

												</ul> <!-- [if lte IE 6]>
											</td></tr></table>
											</a>
											<![endif]-->
										 </li>
										
											
										<li style="position:relative;"><a class="hide" href="aboutourself.htm">关于我们</a> <!--[if lte IE 6]>
										<a href="###">EXPLORER
										<table><tr><td>
										<![endif]-->
												<ul>
													<li><a href="<%=request.getContextPath()%>/user/aboutourself.jsp" title="公司介绍">公司介绍</a></li>
													<li><a href="<%=request.getContextPath()%>/user/dynamic.jsp" title="公司动态">公司动态</a></li>
													<li><a href="<%=request.getContextPath()%>/user/Recruitment.jsp" title="诚聘英才">诚聘英才</a></li>
													<li><a href="<%=request.getContextPath()%>/user/callme.jsp" title="联系我们">联系我们</a></li>
													<!-- <li><a href="/toHuodong" title="公司活动">公司活动</a></li> -->
									  </ul> <!--[if lte IE 6]>
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