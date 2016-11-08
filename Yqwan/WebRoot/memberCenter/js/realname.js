//实名认证格式判断
$(function(){
	$('#confirm').click(function(){
		$('#nametext').css('color','red')
		var name = $('#realname').val();
		var idcard = $('#idcard').val();
		var cardreg = /^(\d{6})(18|19|20)?(\d{2})([01]\d)([0123]\d)(\d{3})(\d|X)?$/;
		var namereg=/^([\u4e00-\u9fa5]){2,7}$/; //只能是中文，长度为2-7位
		if (name == '' || idcard == '') {
			$('#nametext,#idcardtext').html("× 不能为空")
		}else if(!namereg.test(name)){
			$('#idcardtext').html("")
			$('#nametext').html("× 格式错误")
		}else if(!cardreg.test(idcard)){
			$('#nametext').css('color','green')
			$('#nametext').html("√ 正确")
			$('#idcardtext').html("× 格式错误")
		}else{
			$('#nametext').css('color','green')
			$('#nametext').html("√ 正确")
			$('#idcardtext').html("")
			alert("实名认证成功!");
			$('#form').submit(); 
		}
	})
})

//判断有无实名认证
$(function(){
	var realname = $('#realnamehidden').val();
	var idcard = $('#idcardhidden').val();
	idcard = idcard.substring(0,6)+'************';
	if(realname!=''){
		$('#idcardhidden').val(idcard);
		$('#notrealname,#center_confirm,#center_text').hide();
		$('#yesrealname').show();
	}
})