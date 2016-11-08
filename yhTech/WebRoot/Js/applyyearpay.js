var page = 1;
var flag=true;
$(function(){
	getApplyyearpay("");
	$('#loadmore').click(function(){
		if(flag==true){
			var name = encodeURI(encodeURI($('#menuname').val()));
			getApplyyearpay(name);
		}		
	})
	
	$('.btn-primary').click(function(){
		var name = encodeURI(encodeURI($('#menuname').val()));
		getApplyyearpay(name);
	})
	
	$('#menuname').blur(function(event){
        if(event.keyCode == "13")    
        {
       	var name = $('#menuname').val();
       	getApplyyearpay(name);   
        }
    });
	
})

function getApplyyearpay(name){
	$.ajax({
		   type: "GET",
		   url: "applyyearpay.do",
		   data: "page="+page+"&num=30&name="+name,
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
						html += "<tr>" +
									"<td>"+obj.id+"</td>" +
									"<td>"+obj.house_id+"</td>" +
									"<td>"+obj.name+"</td>" +
									"<td>"+obj.telephone+"</td>" +
									"<td>"+obj.date+"</td>"+
									"<td>"+obj.state+"</td>" +
								"</tr>"
					}
					$("tbody").html("");
					$("tbody").append(html);
				}	
		   }
	});
}

