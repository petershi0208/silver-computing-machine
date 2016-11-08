//登录登出头部 判定
$(document).ready(function(){
					if($("#username").val()=="" || $("#username").val() == null){
						$("#welcome_username").css("display","none");
						$("#Not_loggedin").css("display","block");
					}else if($("#username").val()!="" || $("#username").val() != null){
						$("#welcome_username").css("display","block");
						$("#Not_loggedin").css("display","none");
					}				
				});