/**

 * Description scrollbar 纵向滚动条 可设置放置位置（left 左,right 右）
 * Powered By Mr.K
 * QQ 908526866
 * E-mail lnend@sina.cn
 * Data 2013-10-24
 * Dependence jQuery v1.7.2
 * 
 * Depends:
 *   jquery.mousewheel.js  鼠标滚轮支持插件
 *
 */

(function($){
	
	/**
     * getScrollbar函数
	 *
	 * @param 
     */
	 
	$.fn.getScrollbar = function(options){
		
		// 默认参数
		var defaults = {
			direction:"right"
		};
		
		var options = $.extend(defaults, options);	
		
		var me = $(this);
		
		/**
		 * 添加Scroll自定义布局
		 */
		
		//自动布局更改
		var content = me.html(),
			wrap = $("<div class='getScrollbarWrap' />"),
			conn = $("<div class='getScrollbarConn' />"),
			bar = $("<div class='getScrollbarBar' />");
			
		wrap.append(conn.html(content)).append(bar);
		
		me.css({"overflow":"hidden"});
		me.html(wrap);
		
		//设置滚动条方向
		var direction = options.direction
		if(direction == "right"){		
			bar.css({"right":"5px"});
		}else{		
			bar.css({"left":"5px"});
		}
		
		//设置滚动条透明效果
		wrap.hover(function(){
			bar.addClass("barOpt");
		},function(){
			bar.removeClass("barOpt");
		});
		
		//设置阻止选中样式
		bar.hover(function(){
			wrap.addClass("isNoSelect");
		},function(){
			wrap.removeClass("isNoSelect");	
		});

		//构建自定义滚动条
		var barWrap = $("<div class='getScrollbarBarWrap' />"),
			barTop = $("<div class='getScrollbarBarTop' />"),
			barEnd = $("<div class='getScrollbarBarEnd' />"),
			barMain = $("<div class='getScrollbarBarMain' />");
			
		barWrap.append(barTop).append(barMain).append(barEnd);	
		bar.append(barWrap);
		
		//构建滑块
		var barBlock = $("<div class='getScrollbarBarBlock' />");
		
		barMain.append(barBlock);
		
		//创建滑块内部样式
		barBlock.append("<div><div><div><div></div></div></div></div>");
		
		//计算滚动滑块高度
		var wrapHeight = wrap.height(),
			conHeight = conn.height(),
			barWrapHeight = barMain.height(),
			blockHeight = parseInt((wrapHeight / conHeight) * barWrapHeight); 
		
		if(blockHeight < 40){blockHeight = 40}
		barBlock.css({"height":blockHeight});
		
		
		/**
		 * 构建Scroll滚动处理事件
		 */
		 
		//拖动滑块事件
		var mousey = 0, blockTop = 0, newTop = 0;
		
		barBlock.mousedown(function(e){
			
			var position = $(this).position();
			
			blockTop = parseInt(position.top);
			
			mousey = e.pageY;
			
			$(document).bind("mousemove", blockMove);
			
			function blockMove(event){
				
				newTop = parseInt(blockTop + (event.pageY - mousey));

				getScroll(newTop);

				event.stopPropagation();
				event.preventDefault();
				
			}
			
			$(document).mouseup(function(){
				
				$(document).unbind("mousemove");	
			
			});
			
		});
		
		//点击滚动条背景事件
		barMain.bind("click", barMainClick);

		function barMainClick(event){
		
			newTop = parseInt(event.pageY - barMain.offset().top);
			
			newTop = newTop - (blockHeight / 2);

			getScroll(newTop);

		}
		
		//阻止冒泡事件
		barBlock.hover(function(){
		
			barMain.unbind("click");
		
		},function(){
		
			barMain.bind("click", barMainClick);
		
		});
		
		//绑定鼠标滚轮事件
		wrap.bind("mousewheel", function(event, delta) {
		
			newTop = barBlock.position().top;
	
			if (delta > 0){
				newTop = newTop - 15;
			}
				
			if (delta < 0){
				newTop = newTop + 15;
			}
				

			getScroll(newTop);
			
			event.stopPropagation();
            event.preventDefault();
			
		});
		
		var goScrollTop = function(){}, goScrollEnd = function(){};
		
		//向上滚动
		barTop.bind("mousedown", function(){
			
			goScrollTop = setInterval(function(){
				
				newTop = barBlock.position().top;
				
				newTop = newTop - 15;
				getScroll(newTop);
			
			},50);

		});
		
		//向下滚动
		barEnd.bind("mousedown", function(){
			
			goScrollEnd = setInterval(function(){
				
				newTop = barBlock.position().top;
			
				newTop = newTop + 15;
				getScroll(newTop);
				
			},50);

		});
		
		barTop.bind("mouseup",function(){
			
			window.clearInterval(goScrollTop);
			
		});
		
		barEnd.bind("mouseup",function(){
			
			window.clearInterval(goScrollEnd);
			
		});
		
		//绑定键盘按键事件
		wrap.hover(function(){
		
			$(document).bind("keydown", keyClick);
		
		},function(){
		
			$(document).unbind("keydown");
		
		});
		
		
		//定义按键事件函数
		function keyClick(event){
		
			newTop = barBlock.position().top;
			var Ckey = event.which;
			
			//向上滚动
			if(Ckey == 38){
			
				newTop = newTop - 15;
				getScroll(newTop);
				
				event.stopPropagation();
            	event.preventDefault();
			
			}
			
			
			//向下滚动
			if(Ckey == 40){
			
				newTop = newTop + 15;
				getScroll(newTop);
				
				event.stopPropagation();
           		event.preventDefault();

			}

		}
		
		
		/**
		 * 构建Scroll滚动执行函数
		 */
		
		//实现滚动特效
		function getScroll(newTop){
			
			//minTop
			if(newTop < 0){
				newTop = 0;
			}
			
			//maxTOP
			var maxTop = barWrapHeight - blockHeight;
			if(newTop > maxTop){
				newTop = maxTop;
			}
			
			//滚动条高度
			barBlock.css({"top":newTop});
			
			//主内容高度
			var connTop = parseInt((newTop / barWrapHeight) * conHeight);
			if(connTop >　0){connTop = connTop - 1}
			conn.css({"top": 0 - connTop});		
			
			return false;
		}
		
	}
	
})(jQuery);