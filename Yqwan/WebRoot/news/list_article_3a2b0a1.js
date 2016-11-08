define("content/list_article",["jquery","handlebars"],
		function(require){
			function e(){
				function e(e,t){
					var a=r(e).html(),n=a.length;
					if(n>t){
						var i=a.substring(0,t);
						r(e).html(i+"…")
					}
				}
				for(var t=r(".public-tabs-word"),a=t.length,n=r(".public-art-word"),i=n.length,o=0;a>o;o++)
					e(r(".public-tabs-word").eq(o),105);
				for(var l=0;i>l;l++)
					e(r(".public-art-word").eq(l),31)
			}
			function t(){
				
				function e(){
					function e(e){
						r.ajax({
							type:"get",
							url:o,
							data:e,
							dataType:l,
							beforeSend:function(){
								return c?!1:(c=!0,r(".public-loading").show(),
										r(".public-more").hide(),
										void 0)
										},
								success:function(a){
											if(a){
												if(r(".errtext").hide(),
														r(".public-loading").hide(),
														t(a),
														0==a.length&&r(".errtext").html("亲,已无更多数据").show(),
														a.length<e.pageSize)
													return r(".public-more").hide(),!1;n++}
											},
								error:function(){
											r(".public-more").hide(),
											r(".public-loading").hide(),
											r(".errtext").html("对不起,网络出现错误...").show()
											},
								complete:function(){
									c=!1,r(".public-loading").hide(),
									r(".public-more").show()
								}
						})
					}
					function t(e){
						var t=a.compile(r("#listTemplate").html());
						r(".public-tabs-all").append(t(e))
					}
					var n=r(".public-more").attr("data-curpage"),
					i=r(".public-more").attr("data-pagenum"),
					u=r(".public-more").attr("data-catid");
					
					r("body").on("click",".public-more",function(){
						e({catid:u,pagesize:i,page:n})
					}
				)}
					var t=0,
						n=0,
						i=1,
						o="",
						l="jsonp",
						c=!1;
						t&&(o=""),
//						n&&(o="http://zc.test.mofang.com/index.php?m=content&a=load_more"),
						i&&(o="getmorenews.do?m=content&a=load_more"),
						a.registerHelper("showVideo",function(e,t){
							return 11==e||17==e?t.fn(this):t.inverse(this)
						}),a.registerHelper("timeformat",function(e){
							function t(e){
								return 10>e?"0"+e:e
							}
							var r=new Date(1e3*e),
						a=r.getFullYear(),
						n=r.getMonth()+1,
						i=r.getDate(),
						o=r.getHours(),
						l=r.getMinutes(),
						c=(r.getSeconds(),
						new Date),
						u=c.getFullYear(),
						p=c.getMonth()+1,
						d=c.getDate(),
						s=c.getHours(),
						h=c.getMinutes();
							if(u==a&&p==n&&d==i&&s==o){
								var g=h-l;
								if(5>g)var f="刚刚";
								else var f=g+"分钟前"
							}else 
							var f=t(a)+"-"+t(n)+"-"+t(i)+" "+t(o)+":"+t(l);
							return f
						}),a.registerHelper("labelformat",function(e){
							var t=e.keywords.split(","),
							r="";
							if(0==t.length)r+="";
							else 
								for(var a=0;a<t.length;a++)r+="<a href='http://www.199y.com/tag/"+t[a]+".html'>"+t[a]+"</a>";
								return r
							}),e()
					}
			
			var r=require("jquery"),
			a=require("handlebars");
			e(),
			t()
			}),seajs.use(["content/list_article"]);