/* */
$(function(){
	var ok1 = false;
	var ok2 = false;
	var ok3 = false;
	var ok4 = false;
	var ok5 = false;
	var ok6 = false;
	var ok7 = false;
	var ok8 = false;
	
	$(".gamename").blur(function(){
		var gamename = $(this).val();
		if(gamename!=null && gamename!=""){
			$(".f_gamename").html("<font color='green'>输入正确</font>");
			ok1=true;
		}else{
			$(".f_gamename").html("<font color='red'>游戏名不能为空</font>");
		}
	});
	$(".gameregion").blur(function(){
		var gameregion = $(this).val();
		if(gameregion!=null && gameregion!=""){
			$(".f_gameregion").html("<font color='green'>输入正确</font>");
			ok2 = true;
		}else{
			$(".f_gameregion").html("<font color='red'>分区不能为空</font>");
		}
	});
	$(".detaildescripe").blur(function(){
		var detaildescripe = $(this).val();
		if(detaildescripe.length>0 && detaildescripe.length<=1000){
			$(".f_detaildescripe").html("<font color='green'>输入正确</font>");
			ok3 = true;
		}else{
			$(".f_detaildescripe").html("<font color='red'>输入详细描述，1-1000字</font>");
		}
	});
	$(".descrip").blur(function(){
		var descrip = $(this).val();
		if(descrip.length>0 && descrip.length<=15){
			$(".f_descrip").html("<font color='green'>输入正确</font>");
			ok4 = true;
		}else{
			$(".f_descrip").html("<font color='red'>输入游戏描述，1-15字</font>");
		}
	});
	$(".gamesize").blur(function(){
		var gamesize = $(this).val();
		if(gamesize.length>0 && gamesize.length<=15){
			$(".f_gamesize").html("<font color='green'>输入正确</font>");
			ok5 = true;
		}else{
			$(".f_gamesize").html("<font color='red'>输入游戏大小，1-15字</font>");
		}
	});
	$(".howstart").blur(function(){
		var howstart = $(this).val();
		if(howstart.length>0 && howstart.length<=50){
			$(".f_howstart").html("<font color='green'>输入正确</font>");
			ok6 = true;
		}else{
			$(".f_howstart").html("<font color='red'>输入如何开始，1-50字</font>");
		}
	});
	$(".gamegoal").blur(function(){
		var gamegoal = $(this).val();
		if(gamegoal.length>0 && gamegoal.length<=50){
			$(".f_gamegoal").html("<font color='green'>输入正确</font>");
			ok7 = true;
		}else{
			$(".f_gamegoal").html("<font color='red'>输入游戏目标，1-50字</font>");
		}
	});
	$(".gameurl").blur(function(){
		var gameurl = $(this).val();
		var strRegex = "^((https|http)?://)";
	 
	    var reg=new RegExp(strRegex);
		if(reg.test(gameurl)){
			$(".f_gameurl").html("<font color='green'>输入正确</font>");
			ok8 = true;
		}else{
			$(".f_gameurl").html("<font color='red'>输入游戏地址，格式错误</font>");
		}
	});
	$(".btn-info").click(function(){
		if(ok1 & ok2 & ok3 & ok4 & ok5 & ok6 & ok7 & ok8){
			$(".aaaa").submit();
			alert("提交成功");
		}else{
			alert("提交失败");
		}
	})
});


