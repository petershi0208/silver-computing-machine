$.fn.paging = function(pag){
	pag = $.extend({
		pagename:null,
		conditionclass:null,
		condition1:null,
		prepage:".prepage",
		nextpage:".nextpage",
		count:".count",
		btnn:".btnn",
		currentpage1:".currentpage1",
		paga:".paga",
		pagesize:10
	}, pag || {});
	var polling1 = $(pag.conditionclass).val();
	var polling11=encodeURI(encodeURI(polling1));
	var b=$(pag.count).text()/pag.pagesize;
	var bb = Math.ceil(b);
	var a =window.location.href;
	$(pag.btnn).click(function(){
		if(polling11=="" || polling11==null){
			var polling1 = $(pag.conditionclass).val();
			var polling11=encodeURI(encodeURI(polling1));
			window.location.href="/Yqwan/administrator/"+pag.pagename+".do?"+pag.condition1+"="+polling11+"&page=1";
		}
	});
	$(pag.currentpage1).css({"background-color":"#337ab7","color":"#FFF"});			
	if(a.lastIndexOf('=')<0){
		$(pag.currentpage1).html(1);
		window.location.href="/Yqwan/administrator/"+pag.pagename+".do?"+pag.condition1+"="+polling11+"&page=1";
	}else{
		$(pag.currentpage1).html(a.substring(a.lastIndexOf('=') + 1));
	}
	var index = a.substring(a.lastIndexOf('=') + 1)-1+2;
	var index1 = a.substring(a.lastIndexOf('=') + 1)-1;
	if(a.substring(a.lastIndexOf('=') + 1)==1){
		$(pag.prepage).css("color","#aaa");
	}else if(bb>0){
		var ind=index+1;
		var ind1 = index1-1;
		if(index1==1){
			var insertHtml='<span class="a">'+index1
			+'</span>';
		}else if(index1==bb-1 && bb>4){
			var insertHtml='<span class="a">'+(index1-3)
			+'</span><span class="a">'+(index1-2)
			+'</span><span class="a">'+(index1-1)
			+'</span><span class="a">'+index1
			+'</span>';
		}else if(index1==bb-1 && bb==4){
			var insertHtml='<span class="a">'+(index1-2)
			+'</span><span class="a">'+(index1-1)
			+'</span><span class="a">'+index1
			+'</span>';
		}else if(index1==bb-1 && bb==3){
			var insertHtml='<span class="a">'+(index1-1)
			+'</span><span class="a">'+index1
			+'</span>';
		}else if(index1==bb-2 && bb>4){
			var insertHtml='<span class="a">'+(index1-2)
			+'</span><span class="a">'+(index1-1)
			+'</span><span class="a">'+index1
			+'</span>';
		}else if(index1==bb-2 && bb==4){
			var insertHtml='<span class="a">'+(index1-1)
			+'</span><span class="a">'+index1
			+'</span>';
		}else{
			var insertHtml='<span class="a">'+ind1
			+'</span><span class="a">'+index1
			+'</span>';
		}
	$(pag.prepage).after(insertHtml);
	$(pag.prepage).click(function(){	
		window.location.href="/Yqwan/administrator/"+pag.pagename+".do?"+pag.condition1+"="+polling11+"&page="+index1;
	});
	}
	if(a.substring(a.lastIndexOf('=') + 1)==bb){
		$(pag.nextpage).css("color","#aaa");
	}else if(bb>0){
		var ind=index+1;
		var ind1 = index1-1;
		if(index1==0){
			var insertHtml='<span class="a">'+index
			+'</span><span class="a">'+ind
			+'</span><span class="a">'+(ind+1)
			+'</span><span class="a">'+(ind+2)
			+'</span>';
		}else if(index1==1){
			var insertHtml='<span class="a">'+index
			+'</span><span class="a">'+ind
			+'</span><span class="a">'+(ind+1)
			+'</span>';
		}else if(index1==bb-2){
			var insertHtml='<span class="a">'+index
			+'</span>';
		}else{
			var insertHtml='<span class="a">'+index
			+'</span><span class="a">'+ind
			+'</span>';
		}
		$(pag.currentpage1).after(insertHtml);
		$(pag.nextpage).click(function(){	
			window.location.href="/Yqwan/administrator/"+pag.pagename+".do?"+pag.condition1+"="+polling11+"&page="+index;
		});
	}
	if(bb==1){
		$(pag.paga).find(".a:gt(0)").hide();
	}else if(bb==2){
		$(pag.paga).find(".a:gt(1)").hide();	
	}else if(bb==3){
		$(pag.paga).find(".a:gt(2)").hide();
	}else if(bb==4){
		$(pag.paga).find(".a:gt(3)").hide();
	}
	$(pag.paga).find(".a").click(function(){
		var bc = $(this).text();
		window.location.href="/Yqwan/administrator/"+pag.pagename+".do?"+pag.condition1+"="+polling11+"&page="+bc;
	});
}