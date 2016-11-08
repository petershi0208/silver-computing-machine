//判断角色类型
$(function(){
	var role = $('#role').val();
		if(role=='manageMoney'){
			$('#borrow,#borrow1,#borrow2').css('display','none');
			$('#manage,#manage1,#manage2').css('display','block');
		}else{
			$('#borrow,#borrow1,#borrow2').css('display','block');
			$('#manage,#manage1,#manage2').css('display','none');
		}
})