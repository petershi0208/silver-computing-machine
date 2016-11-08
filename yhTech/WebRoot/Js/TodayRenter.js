
//分页获取租客信息
$(function(){
	gettodayrent();
})
$(function(){
	$('#quanxuan').click(function(){
		$('table input').attr('checked','true');
	})
	$('#send').click(function(){
		 if(confirm("确认发送")){
			 fun();
		 }
	})
	$('.point').hover(function(){
		var html ="<div class='data'><span style=\"color:#000;\">发送短信内容：</span>您好，尊敬的壹管家用户，您的租金于xxx后到期，本期租金为：xxx元，请及时交款。1.壹管家公司账户：310066852018800007612，单位：上海壹火网络科技有限公司，开户行：交通银行三门路支行；\r\n2.支付宝longsen110@163.com，支付宝名字：石磊（王石磊）。您还可以关注我们微信公众号“壹管家社区”打好房款后直接截图发布在公众号，里面还有精彩活动哦！</div>"
		$('.point').after(html);
	},function(){
		$('.data').hide();
	})
})

function fun(){
    obj = document.getElementsByName("checkbox[]");
    for(k in obj){
        if(obj[k].checked){
        	var id =  obj[k].value;
        	var telephone = $('#'+id+" td:nth-child(3)").html();
        	var money = $('#'+id+" td:nth-child(4)").html();
        	var name = $('#'+id+" td:nth-child(2) a").html();
        	var date = $('#'+id+" td:nth-child(5)").html();
        	sendmsg(telephone,money,name,id,date)
        }        	
    }
}

function gettodayrent(){
	$.ajax({
		   type: "GET",
		   url: "gettodayrent.do",
		   data: "&num=30",
		   success: function(result){
			$('.loading').hide();
				if(result=="error"){
					$("#loadmore").html("加载失败.");
				}else if(result=="fail"){
					$("#loadmore").html("您还尚未登录,<a href=\"login.html\" target=\"_blank\">点击登录</a>");
				}else{
					$("#loadmore").html("加载成功");
					var arr=JSON.parse(result);					
					var obj;
					var html;
					for(var i=0;i<arr.length;i++){
						obj=arr[i];
						html += "<tr id='"+obj.id+"'><td>"+obj.id+"</td><td><a href=\"renterDetail.html\">"+obj.renter_name+"</a></td><td>"+obj.renter_telephone+"</td><td>"+obj.money+"</td><td>"+obj.date+"</td>"+
						      "<td><input name='checkbox[]' type=\"checkbox\" value=\""+obj.id+"\"/><div class=\"result\"></div></td></tr>"
					}
					$("table").append(html);
				}	
		   }
	});
}

function sendmsg(telephone,money,name,id,date){
	var text = $("#"+id+" td div").html();
	if(text=="发送成功") return;
	$("#"+id+" td div").html("发送中...");
	$.ajax({
		   type: "GET",
		   url: "sendmsg.do",
		   data: "telephone="+telephone+"&money="+money+"&name="+encodeURI(encodeURI(name))+"&date="+date,
		   success: function(result){
				if(result=="success"){
					$("#"+id+" td div").html("发送成功");
					$("#"+id+" td div").css("cursor","default").css("color","green");
				}else{
					$("#"+id+" td div").html(result);
				}
		   }
	});
}