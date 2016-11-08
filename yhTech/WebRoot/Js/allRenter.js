var page = 1;
var flag=true;
//分页获取租客信息
$(function(){
	getallrent();
	$('#loadmore').click(function(){
		if(flag==true){
			$("#loadmore").html("加载中");
			getallrent();
		}		
	})
})
$(function(){
	$('.btn-primary').click(function(){
		$('.loading').show();
		var name = $('#menuname').val();
		getrenter(name);
	})
	$('#menuname').blur(function(event){
         if(event.keyCode == 13){
        	 $('.loading').show();
        	var name = $('#menuname').val();       	
 	    	getrenter(name);   
         }
     });
	$('.point').hover(function(){
		var html ="<div class='data'><span style=\"color:#000;\">发送短信内容：</span>您好，尊敬的壹管家用户，您的租金于xxx后到期，本期租金为：xxx元，请及时交款。1.壹管家公司账户：310066852018800007612，单位：上海壹火网络科技有限公司，开户行：交通银行三门路支行；\r\n2.支付宝longsen110@163.com，支付宝名字：石磊（王石磊）。您还可以关注我们微信公众号“壹管家社区”打好房款后直接截图发布在公众号，里面还有精彩活动哦！</div>"
		$('.point').after(html)
	},function(){
		$('.data').hide();
	})
})

function getrenter(name){
	$.ajax({
		   type: "GET",
		   url: "getrenter.do",
		   data: "name="+encodeURI(encodeURI(name)),
		   success: function(result){
		$('.loading').hide();
				if(result=="error"){
					$("#loadmore").html("加载失败");
				}else if(result=="fail"){
					$("#loadmore").html("您还尚未登录,<a href=\"login.html\" target=\"_blank\">点击登录</a>");
				}else{
					var arr=JSON.parse(result);
					if(arr.length<30){
						$("#loadmore").html("亲,已无更多数据");
						flag=false;
					}else{
						$("#loadmore").html("查看更多");
						page++;
					}
					var obj;
					var html;
					for(var i=0;i<arr.length;i++){
						obj=arr[i];
						html += "<tr><td>"+obj.id+"</td><td><a href=\"renterDetail.html?id="+obj.house_id+"\">"+obj.renter_name+"</a></td><td>"+obj.renter_telephone+"</td><td>"+obj.money+"</td><td>"+obj.date+"</td>"+
						      "<td> <a href=\"renterDetail.html?id="+obj.house_id+"\" style='margin-right:1em;'>编辑</a><button id=\""+obj.house_id+"\" type=\"button\" onclick=sendmsg('"+obj.renter_telephone+"','"+obj.money+"','"+obj.renter_name+"','"+obj.house_id+"','"+obj.date+"')>发送短信</button></a>" +
						      		
						      		"</td></tr>"
					}
					$("table").html("<thead><tr><th>序号</th><th>租客</th><th>手机号</th><th>租金</th><th>交租金日期</th><th>操作</th></tr></thead>");
					$("table").append(html);
				}
		   }
	});
}

function getallrent(){
	$.ajax({
		   type: "GET",
		   url: "getAllrenter.do",
		   data: "page="+page+"&num=30",
		   success: function(result){
		$('.loading').hide();
				if(result=="error"){
					$("#loadmore").html("加载失败");
				}else if(result=="fail"){
					$("#loadmore").html("您还尚未登录,<a href=\"login.html\" target=\"_blank\">点击登录</a>");
				}else{
					var arr=JSON.parse(result);
					if(arr.length<30){
						$("#loadmore").html("亲,已无更多数据");
						flag=false;
					}else{
						$("#loadmore").html("查看更多");
						page++;
					}
					var obj;
					var html;
					for(var i=0;i<arr.length;i++){
						obj=arr[i];
						html += "<tr><td>"+obj.id+"</td><td><a href=\"renterDetail.html?id="+obj.house_id+"\">"+obj.renter_name+"</a></td><td>"+obj.renter_telephone+"</td><td>"+obj.money+"</td><td>"+obj.date+"</td>"+
						      "<td> <a href=\"renterDetail.html?id="+obj.house_id+"\" style='margin-right:1em;'>编辑</a><button id=\""+obj.house_id+"\" type=\"button\" onclick=sendmsg('"+obj.renter_telephone+"','"+obj.money+"','"+obj.renter_name+"','"+obj.house_id+"','"+obj.date+"')>发送短信</button></a>" +
						      		"</td></tr>"
					}
					$("table").append(html);
				}	
		   }
	});
}




function sendmsg(telephone,money,name,id,date){
	var text = $("#"+id).html();
	if(text=="发送成功") return;
	if(confirm("确认发送")){
		 $("#"+id).html("发送中...");
			$.ajax({
				   type: "GET",
				   url: "sendmsg.do",
				   data: "telephone="+telephone+"&money="+money+"&name="+encodeURI(encodeURI(name))+"&date="+date,
				   success: function(result){
						if(result=="success"){
							$("#"+id).html("发送成功");
							$("#"+id).css("cursor","default").css("color","green");
						}else{
							$("#"+id).html(result);
						}
				   }
			});
	 }	
}