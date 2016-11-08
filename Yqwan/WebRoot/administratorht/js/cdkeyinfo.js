$(function(){
	var giftname1 = $(".giftname").val();
	var giftname=encodeURI(encodeURI(giftname1));
			var b=$(".count").text()/10;
			var bb = Math.ceil(b);
			var a =window.location.href;
			$(".btnn").click(function(){
				if(giftname=="" || giftname==null){
					var giftname1 = $(".giftname").val();
					var giftname=encodeURI(encodeURI(giftname1));
					window.location.href="/Yqwan/administrator/cdkeyinfo.do?giftname="+giftname+"&page=1";
				}
			});
			$(".currentpage1").css({"background-color":"#337ab7","color":"#FFF"});			
			if(a.lastIndexOf('=')<0){
				$(".currentpage1").html(1);
				window.location.href="/Yqwan/administrator/cdkeyinfo.do?giftname="+giftname+"&page=1";
			}else{
				$(".currentpage1").html(a.substring(a.lastIndexOf('=') + 1));
			}
			$(".btnn").click(function(){
				
			});
			
			var index = a.substring(a.lastIndexOf('=') + 1)-1+2;
			var index1 = a.substring(a.lastIndexOf('=') + 1)-1;
			if(a.substring(a.lastIndexOf('=') + 1)==1){
				$(".prepage").css("color","#aaa");
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
				$('.prepage').after(insertHtml);
				$(".prepage").click(function(){
					
					window.location.href="/Yqwan/administrator/cdkeyinfo.do?giftname="+giftname+"&page="+index1;
				});
			}
			if(a.substring(a.lastIndexOf('=') + 1)==bb){
				$(".nextpage").css("color","#aaa");
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
					$('.currentpage1').after(insertHtml);
					$(".nextpage").click(function(){	
						window.location.href="/Yqwan/administrator/cdkeyinfo.do?giftname="+giftname+"&page="+index;
					});
			}
			if(bb==1){
				$(".paga .a:gt(0)").hide();
			}else if(bb==2){
				$(".paga .a:gt(1)").hide();
				
			}else if(bb==3){
				$(".paga .a:gt(2)").hide();
			}else if(bb==4){
				$(".paga .a:gt(3)").hide();
			}
			$(".paga .a").click(function(){
				var bc = $(this).text();
				window.location.href="/Yqwan/administrator/cdkeyinfo.do?giftname="+giftname+"&page="+bc;
			});				
		});