var page=2;
$(function(){
	$('#lefttype div').click(function(){
		page=1;
		$(".public-loading").show();
		getdata(this);
	})
	$('#ckmore').click(function(){
		var catid = $("#ckmore").attr("data-catid");
		var type=encodeURI(encodeURI("新闻"));
		if(catid=='2'){
			type=encodeURI(encodeURI("攻略"));
		}else if(catid=='3'){
			type = encodeURI(encodeURI("活动"));
		}
		getmoredata(type)
	})
})

function getdata(param){
	$(param).css('border-bottom','2px solid #09f').css('color','#09f');
	$(param).siblings().css('border-bottom','1px solid #eee').css('color','#797979');
	
	var type = $(param).html();
	if(type=="游戏公告"){
		$('#ckmore').attr('data-catid','1');
		type = encodeURI(encodeURI("新闻"));
	}else if(type=="游戏攻略"){
		$('#ckmore').attr('data-catid','2');
		type = encodeURI(encodeURI("攻略"));
	}else{
		$('#ckmore').attr('data-catid','3');
		type = encodeURI(encodeURI("活动"));
	}
	var url = 'getmorenews.do?page='+page+"&pagesize=10&type="+type;
    $.getJSON(url + "&jsoncallback=?", function (json) {
    	if(json){
    		page++;
    		$(".public-loading").hide();
    		var arr = json.jsonarray;
    	    arr=JSON.parse(arr);
    	    if(arr.length<10){
    	    	$('#ckmore').hide();
    	    	$(".errtext").html("亲,已无更多数据").show();
    	    }else{
    	    	$('#ckmore').show();
    	    	$(".errtext").hide();
    	    }
    	    var obj;
    	    var news="";
    	    for (var i = 0; i < arr.length; i++) {
    	    	obj = arr[i];
    	    	news += "<dl class=\"public-mb20\">"+
                         	"<dt class=\"public-tabs-pic\"><a href=\"newsinfo.do?newsid="+obj.newsid+"\" target=\"_blank\"><img src=\""+obj.indexpicture+"\" alt=\""+obj.title+"\" title=\""+obj.title+"\"></a></dt>"+
                            	"<dd class=\"public-tabs-title\"><a href=\"newsinfo.do?newsid="+obj.newsid+"\" target=\"_blank\">"+obj.title+"</a></dd>"+
                                "<dd class=\"public-tabs-word\">"+obj.description+"</dd>"+
                                "<dd class=\"public-tabs-crumbs\">"+
                                "<span class=\"public-tabs-author\">作者："+obj.author+"</span>"+
                                "<span class=\"public-tabs-date\">时间："+obj.date+"</span></dd>"+
                        "</dl>";
    	    }
    	    $('#public-tabs-all dl').remove();
    	    $('#public-tabs-all').append(news);
    	}else{
    		$(".errtext").html("对不起,网络出现错误...").show()
    	}
    });
}

function getmoredata(type){
	var url = 'getmorenews.do?page='+page+"&pagesize=10&type="+type;
    $.getJSON(url + "&jsoncallback=?", function (json) {
    	if(json){
    		page++;
    		$(".public-loading").hide();
    		var arr = json.jsonarray;
    	    arr=JSON.parse(arr);
    	    if(arr.length<10){
    	    	$('#ckmore').hide();
    	    	$(".errtext").html("亲,已无更多数据").show();
    	    }else{
    	    	$('#ckmore').show();
    	    	$(".errtext").hide();
    	    }
    	    var obj;
    	    var news="";
    	    for (var i = 0; i < arr.length; i++) {
    	    	obj = arr[i];
    	    	news += "<dl class=\"public-mb20\">"+
                         	"<dt class=\"public-tabs-pic\"><a href=\"newsinfo.do?newsid="+obj.newsid+"\" target=\"_blank\"><img src=\""+obj.indexpicture+"\" alt=\""+obj.title+"\" title=\""+obj.title+"\"></a></dt>"+
                            	"<dd class=\"public-tabs-title\"><a href=\"newsinfo.do?newsid="+obj.newsid+"\" target=\"_blank\">"+obj.title+"</a></dd>"+
                                "<dd class=\"public-tabs-word\">"+obj.description+"</dd>"+
                                "<dd class=\"public-tabs-crumbs\">"+
                                "<span class=\"public-tabs-author\">作者："+obj.author+"</span>"+
                                "<span class=\"public-tabs-date\">时间："+obj.date+"</span></dd>"+
                        "</dl>";
    	    }
    	    $('#public-tabs-all').append(news);
    	}else{
    		$(".errtext").html("对不起,网络出现错误...").show()
    	}
    });
}