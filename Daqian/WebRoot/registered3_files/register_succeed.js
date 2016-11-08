var timer;
// 启动跳转定时器
function startTimes() {
	timer = window.setInterval(showSecondes, 1000);
}

var i = 8;

function showSecondes() {
	if (i > 0) {
		i--;
		document.getElementById("secondes").innerHTML = i;
	} else {
		window.clearInterval(timer);
		location.href = "/Daqian/user/login.jsp";
	}
}




/*短信验证*/
function SmsValidate() {

	if (!$("#verification").val().match(/^\S+$/)) {

		$("#verificationText").html("× 验证码不允许为空");
	} else {
		$("#verificationText").html("");
	}

}


/*点击验证时触发短信验证*/
function btnSmsValidate() {

	if (!$("#verification").val().match(/^\S+$/)
			|| $("#verification").val() == ""
			|| $("#verification").val() == "输入验证码") {

		$("#verificationText").html("× 验证码不允许为空");
	} else {
		$("#verificationText").html("");

	}

}



function clickVerification(val, inputId) {
	if (val.match(/^\S+$/) == "输入验证码") {
		val = "";
		document.getElementById(inputId).value = "";// 显示的文本为空
	}

}