
//登录登出头部判定
$(document).ready(function(){
					if($("#username").val()=="" || $("#username").val() == null){
						$("#welcome_username").css("display","none");
						$("#Not_loggedin").css("display","block");
					}else if($("#username").val()!="" || $("#username").val() != null){
						$("#welcome_username").css("display","block");
						$("#Not_loggedin").css("display","none");
					}				
				});



//切换菜单
function switchMenu(obj) {

	if (obj != null) {
		if ($("#" + obj).is(":hidden")) {// 是否隐藏
			// $("#"+obj).slideDown();
			$("#" + obj).toggle(500);
		} else {
			// $("#"+obj).slideToggle();
			$("#" + obj).toggle(300);
		}

	}
}

// 导航栏单机选择
function btnMenu(imgId, fontObj, divId, obj) {
	var back = "back";
	var white = "white";

	$("#" + obj).css("background-color", "#e74c3c");// 修改背景颜色
	
	// 获取当前pojoIcon 和 字体颜色
	var backImg = $("#" + imgId).css("background-image");
	var rgb = $("#" + fontObj).css("color");

	// rgb颜色格式的正则
	rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
	// 得到转换后的颜色
	var colors = "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);

	// 判断当前状态
	if (colors == "#555555" && backImg.indexOf(back) > 0
			&& $("#" + divId).is(":hidden")) {

		$("#" + fontObj).css("color", "#ffffff");
	} else if (colors == "#ffffff" && backImg.indexOf(white) > 0
			&& $("#" + divId).is(":visible")) {
		$("#" + obj).css("background-color", "#ffffff");
		$("#" + fontObj).css("color", "#555555");
	}

	// 颜色转换函数
	function hex(x) {
		return ("0" + parseInt(x).toString(16)).slice(-2);
	}
}

function selectdMenu(imgId, fontObj, divId, obj) {
	if ($("#" + divId).is(":hidden")) {
		$("#" + obj).css("background-color", "#e74c3c");// 修改背景颜色
		$("#" + fontObj).css("color", "#ffffff");
	}
}

function selectdOutMenu(imgId, fontObj, divId, obj) {
	// visible
	if ($("#" + divId).is(":hidden")) {
		$("#" + obj).css("background-color", "#ffffff");// 修改背景颜色
		$("#" + fontObj).css("color", "#555555");
		

	}
}

function btnSecondMenu(imgId, fontObj) {
	if ((imgId != null && imgId != "") || (fontObj != null && fontObj != "")) {
		// 截取字符串中的数字并强转
		var num = parseInt(imgId.replace(/[^0-9]/ig, ""));
		for ( var i = 0; i <= $("div[name=second_menu]").length; i++) {
			if (i == num) {
				$("#" + fontObj).css("color", "#ffffff");
				$("#" + imgId).css("background-color", "#fc817c");
			} else {
				$("#secondfont_" + i).css("color", "");// 这里是将颜色制为空
				$("#secondBackImg_" + i).css("background-color", "");// 这里是将颜色制为空

			}
		}

	} else {

		alert("请检查网络！");
		return;
	}

}

function loadMenu() {

	var menus = $("#menus").val();

	var rank = $("#rank").val();

	var fontcolor = $("#fontcolor").val();

	var menuId = $("#menu_id").val();

	var secondbackimg = $("#secondbackimg").val();
	var second_font = $("#second_font").val();

	$("#" + menuId).css("background-color", "#e74c3c");// 修改背景颜色
	$("#" + fontcolor).css("color", "#ffffff");
	$("#" + second_font).css("color", "#ffffff");
	$("#" + secondbackimg).css("background-color", "#fc817c");
	$("#" + menus).show();

}
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

$(document).ready(function(){
	if($("#username").val()=="" || $("#username").val() == null){
		$("#welcome_username").css("display","none");
		$("#Not_loggedin").css("display","show");
	}else if($("#username").val()!="" || $("#username").val() != null){
		$("#welcome_username").css("display","show");
		$("#Not_loggedin").css("display","none");
	}

});
//function showTime(){
//                 var show_day=new Array('星期一','星期二','星期三','星期四','星期五','星期六','星期日');
//                 var week_day = new Array(7);
//                 week_day[0] = '日';
//                 week_day[1] = '一';
//                 week_day[2] = '二';
//                 week_day[3] = '三';
//                 week_day[4] = '四';
//                 week_day[5] = '五';
//                 week_day[6] = '六';
//                 var time=new Date();
//                 var day=time.getDay();
//                 var now_time = time.toLocaleString() +' '  + '星期' + week_day[day];
//                 document.getElementById('showtime').innerHTML=now_time;
//                 setTimeout("showTime();",1000);
//             }
            

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

 
//设为首页
function SetHome(url){
	if (document.all) {
		document.body.style.behavior='url(#default#homepage)';
		document.body.setHomePage(url);
	}else{
		alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!");
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

$(document).ready(function(e) {
	$("#rightButton").css("right", "0px");
	
    var button_toggle = true;
	$(".right_ico").live("mouseover", function(){
		var tip_top;
		var show= $(this).attr('show');
		var hide= $(this).attr('hide');
		tip_top = show == 'tel' ?  65 :  -10;
		button_toggle = false;
		$("#right_tip").css("top" , tip_top).show().find(".flag_"+show).show();
		$(".flag_"+hide).hide();
		
	}).live("mouseout", function(){
		button_toggle = true;
		hideRightTip();
	});
	
	
	$("#right_tip").live("mouseover", function(){
		button_toggle = false;
		$(this).show();
	}).live("mouseout", function(){
		button_toggle = true;
		hideRightTip();
	});
	
	function hideRightTip(){
		setTimeout(function(){		
			if( button_toggle ) $("#right_tip").hide();
		}, 500);
	}
	
	$("#backToTop").live("click", function(){
		var _this = $(this);
		$('html,body').animate({ scrollTop: 0 }, 500 ,function(){
			_this.hide();
		});
	});

	$(window).scroll(function(){
		var htmlTop = $(document).scrollTop();
		if( htmlTop > 0){
			$("#backToTop").fadeIn();	
		}else{
			$("#backToTop").fadeOut();
		}
	});
});




















