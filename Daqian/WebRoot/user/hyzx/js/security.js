//获得ajax对象
function getXhr(){
	var xhr = null;
	if(window.XMLHttpRequest){
		xhr = new XMLHttpRequest();
	}else{
		 xhr = new ActiveXObject('microsoft.XMLHttp');
	}
	return xhr;
}

//修改支付密码
$(function(){
	$('#changepay').toggle(function(){		
						$('#changepwd').show('fast')
					},			
			function(){
						$('#changepwd').hide()
					});
		})

//提交
function btnform() {
	var oldpwd = $("#oldpwd").val();
	var newpwd1 = $("#newpwd1").val();
	var newpwd2 = $("#newpwd2").val();
	var code = $("#code").val();
	var newpwdSms = /^[a-zA-Z]\w{5,21}$/;

	if (oldpwd == '' || newpwd1 == '' || newpwd2 == '' || code == '') {
		alert("有未填写项，请完善输入！");
	} else {
		if (newpwd1 != newpwd2) {
			alert("两次输入密码不一致！");
			return;
		} else if (newpwd1.length < 6) {
			alert("您的密码设置不正确。设置要求：密码必须以字母开头，长度在6~22之间，只能包含字符、数字和下划线。如：information15。");
			return;
		} else if (newpwd1.length > 22) {
			alert("您的密码设置不正确。设置要求：密码必须以字母开头，长度在6~22之间，只能包含字符、数字和下划线。如：information15。");
			return;
		} else if (!newpwdSms.test(newpwd1)) {
			alert("您的密码设置不正确。设置要求：密码必须以字母开头，长度在6~22之间，只能包含字符、数字和下划线。如：information15。");
			return;
		} else {
				var xhr = getXhr();
				//发送请求
				var uri = '/Daqian/changepaypwd.do?oldpwd='+oldpwd+'&newpwd='+newpwd1+'&code='+code;
				xhr.open('get',uri,true);
				xhr.onreadystatechange=function(){
					//4,处理服务器返回的数据
					if(xhr.readyState==4&&xhr.status==200){
						var txt = xhr.responseText;
						alert(txt);
					}
				};
				xhr.send(null);
		}
	}
}

//实名认证
$(function(){
	var name = $('#dbname').val();
	if(name!=''){
		$('#check').toggle(function(){		
						$('#read').show('fast')
		},			
			function(){
						$('#read').hide()
		});
	}else{
		$('#check').toggle(function(){		
						$('#checkname').show('fast')
					},			
			function(){
						$('#checkname').hide()
					});
	}
		})
		
$(function(){
	$('#comfirm').click(function(){
		var name = $('#realname').val();
		var card = $('#card').val();
		var cardmsg = /^(\d{6})(18|19|20)?(\d{2})([01]\d)([0123]\d)(\d{3})(\d|X)?$/;
		if (name == '' || card == '') {
			alert("有未填写项，请完善输入！");
		}else if(!cardmsg.test(card)){
			alert("身份证错误!");
		}else{
			var xhr = getXhr();
			//发送请求
			var uri = '/Daqian/changecard.do?name='+name+'&card='+card;
			xhr.open('get',uri,true);
			xhr.onreadystatechange=function(){
				//4,处理服务器返回的数据
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					$('#check1').text("已认证");
					$('#check').text("查看");
					$('#checkname').hide();
					alert(txt);
					document.forms[0].submit();
				}
			};
			xhr.send(null);
		}
	})
})

$(function(){
	var dbname = $('#dbname').val();
	var dbcard = $('#dbcard').val();
	if(dbname!=''&&dbcard!=''){
		$('#check1').text("已认证");
		$('#check').text("查看");
	}
})