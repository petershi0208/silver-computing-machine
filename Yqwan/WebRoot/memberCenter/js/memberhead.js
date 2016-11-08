//会员中心首页按钮跳转
$(function(){
	$('#memberhead li').click(function(){
		var index = $(this).index();
		if(index==0){
			window.location.href="/Yqwan/tomember.do";
		}else if(index==1){
			window.location.href="/Yqwan/memberCenter/account.jsp";
		}else if(index==2){
			window.location.href="/Yqwan/memberCenter/secure.jsp";
		}else if(index==3){
			alert("暂不开放!");
//			window.location.href="/Yqwan/recharge.do";
		}
	})
})