
//借款申请下一步格式判断
$(function(){
	$('#btn').click(function(){
		var realname = $('#realname').val();
		var card = $('#card').val();
		var product = $('#product').val();
		var city = $('#city').val();
		var graduate = $('#graduate').val();
		var money = $('#money').val();
		var day=$('#day').val();
		var file1 = $('#file1').val();
		var file2 = $('#file2').val();
		var file3 = $('#file3').val();
		
		var reg =/^[0-9]*$/;
		if(city==''){
			$('#citytext').text("请输入正确的城市");
			return;
		}else{
			$('#citytext').text("");
		}
		if(graduate=='none'){
			$('#graduatetext').text("请选择学历");
			return;
		}else{
			$('#graduatetext').text("");
		}
		if(money==''||!reg.test(money)){
			$('#moneytext').text("金额不能为空且必须是整数");
			return;
		}else{
			$('#moneytext').text("");
		}
		if(day==''){
			$('#daytext').text("借款期限不能为空");
			return;
		}else{
			$('#daytext').text("");
		}
		if(file1==''&&file2==''&&file3==''){
			$('#filetext').text("请上传资料");
			return;
		}else{
			$('#filetext').text("");
		}
		
		if(product=="零花钱"){
			if(money<500||money>30000){
				$('#moneytext').text("零花钱贷款金额为500-30000");
				return;
			}
		}
		if(product=="急用贷"){
			if(money<5000||money>30000){
				$('#moneytext').text("急用贷贷款金额为5000-30000");
				return;
			}
		}
		if(product=="家用贷"){
			if(money<30000||money>50000){
				$('#moneytext').text("家用贷贷款金额为10000-50000");
				return;
			}
		}
		if(product=="商用贷"){
			if(money<50000||money>100000){
				$('#moneytext').text("商用贷贷款金额为50000-100000");
				return;
			}
		}
		document.forms[0].submit();		
	})
})