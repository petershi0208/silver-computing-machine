//会员中心判断登录与否
window.onload=function(){
	var userid=$('#userid').val();
	if(userid==''){
		window.location.href="/Yqwan/toindex.do"
	}
}