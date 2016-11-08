$.fn.paging = function(pag){
	pag = $.extend({
		pagename:null,
		condition:null,
		conditions:null,
		prepage:".prepage",
		nextpage:".nextpage",
		count:".count",
		btnn:".btnn",
		currentpage1:".currentpage1",
		curpage:".curpage",
		pagesize:10,
		zdpage:".zdpage",
		zdbtn:".zdbtn",
		homepage:".homepage",
		lastpage:".lastpage"
	}, pag || {});
	var curpage = parseInt($(pag.curpage).text());
	var count = parseInt($(pag.count).text());
	for(var i=curpage+2;i>curpage;i--){
		if(i<=count){
			$(pag.curpage).after("<div class='page' style='cursor:pointer;'>"+i+"</div>");
		}
	}
	for(var j=curpage-2;j<curpage;j++){
		if(j>0){
			$(pag.curpage).before("<div class='page' style='cursor:pointer;'>"+j+"</div>");
		}
	}
	var con = "";
	if(pag.conditions!=null && pag.conditions!=""){
		for (var key in pag.conditions){
			con=con+"&"+key+"="+pag.conditions[key];
		}
	}else if(pag.condition!=null && pag.condition!=""){
		var conn = "."+(pag.condition.val());
		con = "&"+pag.condition+"="+conn
	}
	$(pag.zdbtn).click(function(){
		var zdpage = $(pag.zdpage).val();
		if(zdpage<=count && zdpage>0){
			location.href=pag.pagename+"?page="+zdpage+con;
		}else{
			alert("没有该页");
		}
		
	});
	$('.page').click(function(){
		var page = $(this).text();
		location.href=pag.pagename+"?page="+page+con;
	});
	$(pag.prepage).click(function(){
		var prepage = parseInt($(".curpage").text())-1;
		if(prepage>0){
			location.href=pag.pagename+"?page="+prepage+con;
		}
	});
	$(pag.nextpage).click(function(){
		var nextpage = parseInt($(".curpage").text())+1;
		if(count>=nextpage){
			location.href=pag.pagename+"?page="+nextpage+con;
		}
	});
	$(pag.homepage).click(function(){
		var nextpage = parseInt($(".curpage").text())+1;
		location.href=pag.pagename+"?page="+1+con;
	});
	$(pag.lastpage).click(function(){
		var nextpage = parseInt($(".curpage").text())+1;
		location.href=pag.pagename+"?page="+count+con;
	});
	
	
}