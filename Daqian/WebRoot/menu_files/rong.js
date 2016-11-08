// JavaScript Document
$(function () {
 	imgZoomInit()//模块初始化
})
/*
* 图片放大展示
* 2015-01-04
* nizilam
*/
function imgZoomInit(){
	$('.piclist li.pic').append(function(){
		ht = $(this).find('.in').html();
		return "<div class='original'>"+ht+"</div>";
	});
	
	$(".piclist li.pic .in img").each(function(i){
		var img = $(this);
		var realWidth ;//原始宽度
		var realHeight ;//原始高度
		var vs ;//图片宽高比
		
		realWidth = this.width;
		realHeight = this.height;
		vs = realWidth/realHeight;
			
		//缩略图比例230:142(约等于1.62)
		if(vs>=1.62){//横图则固定高度
			$(img).css("width","auto").css("height","102px");
		}
		else{//竖图则固定宽度
			var srcImg = $(img).attr("src");
			
			if(srcImg.indexOf("01x3.png")!=-1){
				$(img).css("width","130px").css("height","90px") ;
			}else{
				$(img).css("width","130px").css("height","auto") ;
			}
			
		}
		
		//图片放大水平垂直居中显示
		if(vs>=1){//横图或正方形
			$(img).parent().parent().parent().find('.original img').height(260);
			$(img).parent().parent().parent().find('.original img').width('auto');
			$(img).parent().parent().parent().find('.original').css({
				//此处需结合实际情况计算 左偏移：.original实际宽度的二分之一
				marginLeft: function(){
					return -(130*realWidth/realHeight)-6;
				},
				left:'50%'
			})
		}else{//竖图
			$(img).parent().parent().parent().find('.original img').width(260);
			$(img).parent().parent().parent().find('.original img').height('auto');
			$(img).parent().parent().parent().find('.original').css({
				//此处需结合实际情况计算 上偏移：.original实际高度的二分之一
				marginTop: function(){
					return -(130*realHeight/realWidth)-36;
				},
				top:'50%'
			});
			$(img).parent().parent().parent().find('.original b').css('display','block')
		}		
	});

	
	$('.piclist li.pic').hover(function(){
			$(this).addClass('on');
		},function(){
			$(this).removeClass('on');	
	})
	
	$(".piclist ul li:nth-child(4n)").addClass('r');
}
