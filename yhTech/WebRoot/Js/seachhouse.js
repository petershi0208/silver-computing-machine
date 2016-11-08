$(function(){
	getrenter();
	$(".bj a").click(function(){
		$(this).parents(".bj").siblings(".word_grey").children("input").removeAttr("readonly");
		$(this).parents(".bj").siblings(".word_grey").children("input").focus();
	})
	$(".update").click(function(){
		var a = encodeURI(encodeURI($(".house_id").val()));
		var b = encodeURI(encodeURI($(".renter_telephone").val()));
		var c = encodeURI(encodeURI($(".renter_name").val()));
		var d = encodeURI(encodeURI($(".money").val()));
		var e = encodeURI(encodeURI($(".date").val()));
		
		update(a,b,c,d,e);
	})
})
function getrenter(){
	var href = location.href;
	var a = href.indexOf("=", 1);
	var id = href.substr(a+1, href.length);
	$.ajax({
		   type: "GET",
		   url: "seachhouse.do",
		   data: "id="+id,
		   success: function(result){
				
				if(result == "fail"){
					$("#loadmore").addClass("defa");
					$("#loadmore").html("您还尚未登录,<a href=\"login.html\" target=\"_blank\">点击登录</a>");
				}else{
					var obj=JSON.parse(result);
					$(".house_id").val(obj.house_id);
					$(".renter_telephone").val(obj.renter_telephone);
					$(".renter_name").val(obj.renter_name);
					$(".money").val(obj.money);
					$(".date").val(obj.date);
				}
				
		   }
	});
}

function update(a,b,c,d,e){
	$.ajax({
		   type: "GET",
		   url: "updatehouse.do",
		   data: "house_id="+a+"&renter_telephone="+b+"&renter_name="+c+"&money="+d+"&date="+e,
		   success: function(result){
				if(result=="error"){
					alert("修改失败");
				}else if(result=="fail"){
					alert("尚未登陆");
				}else{
					alert("修改成功");
				}
		   }
	});
}