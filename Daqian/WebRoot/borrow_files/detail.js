
//查看详细按钮
$(function(){
	$('#jiyongdai').toggle(function(){
						$('#borrowdetail').show('fast')
					},			
			function(){
						$('#borrowdetail').hide()
					});
})

$(function(){
	$('#linghuaqian').toggle(function(){
						$('#borrowdetail2').show('fast')
					},			
			function(){
						$('#borrowdetail2').hide()
					});
})

$(function(){
	$('#jiayongdai').toggle(function(){
						$('#borrowdetail3').show('fast')
					},			
			function(){
						$('#borrowdetail3').hide()
					});
})

$(function(){
	$('#shangyongdai').toggle(function(){
						$('#borrowdetail4').show('fast')
					},			
			function(){
						$('#borrowdetail4').hide()
					});
})

//点击查看详情判断有无登录或者实名认证(4个)
$(function(){
	$('#ling').click(function(){
		var realname = $('#realname').val();
		var username = $('#username').val();
		var role = $('#role').val();
		if(username==''||role=='manageMoney'){
			alert("请先登录或者当前账户不是借款账号");
			window.location.href="/Daqian/user/login.jsp";
		}else if(realname==''){
			alert("请先去会员中心实名认证");
			window.location.href="/Daqian/tomember.do";
		}else{
			window.location.href="/Daqian/borrowapply1.do";
		}
	})
})
$(function(){
	$('#ji').click(function(){
		var realname = $('#realname').val();
		var username = $('#username').val();
		var role = $('#role').val();
		if(username==''||role=='manageMoney'){
			alert("请先登录或者当前账户不是借款账号");
			window.location.href="/Daqian/user/login.jsp";
		}else if(realname==''){
			alert("请先去会员中心实名认证");
			window.location.href="/Daqian/tomember.do";
		}else{
			window.location.href="/Daqian/borrowapply2.do";
		}
	})
})
$(function(){
	$('#jia').click(function(){
		var realname = $('#realname').val();
		var username = $('#username').val();
		var role = $('#role').val();
		if(username==''||role=='manageMoney'){
			alert("请先登录或者当前账户不是借款账号");
			window.location.href="/Daqian/user/login.jsp";
		}else if(realname==''){
			alert("请先去会员中心实名认证");
			window.location.href="/Daqian/tomember.do";
		}else{
			window.location.href="/Daqian/borrowapply3.do";
		}
	})
})
$(function(){
	$('#shang').click(function(){
		var realname = $('#realname').val();
		var username = $('#username').val();
		var role = $('#role').val();
		if(username==''||role=='manageMoney'){
			alert("请先登录或者当前账户不是借款账号");
			window.location.href="/Daqian/user/login.jsp";
		}else if(realname==''){
			alert("请先去会员中心实名认证");
			window.location.href="/Daqian/tomember.do";
		}else{
			window.location.href="/Daqian/borrowapply4.do";
		}
	})
})