var rotate = "rotate_Img_";
var num = 1;
var rotateLength = 4;

$(document).ready(function() {

	// 下一项
	$("#login_right").click(function() {

		// document.getElementsByName("rotate_Img").length;

		rotate = (rotate + num.toString());
		$("#" + rotate).hide();

		// 这里判断当前图片长度
		if (num == rotateLength) {
			num = 0;
		}

		rotate = "rotate_Img_"; // 恢复
		num++;

		rotate = (rotate + num.toString());
		$("#" + rotate).show();
		rotate = "rotate_Img_"; // 恢复

	});

	// 上一项
	$("#login_left").click(function() {

		rotate = (rotate + num.toString());
		$("#" + rotate).hide();
		rotate = "rotate_Img_"; // 恢复
		num--;

		if (num <= 0) {
			num = rotateLength;
		}

		rotate = (rotate + num.toString());
		$("#" + rotate).show();
		rotate = "rotate_Img_"; // 恢复
	});

});

// 自动
function time_rotateLeft() {

	rotate = (rotate + num.toString());
	$("#" + rotate).hide();

	// 这里判断当前图片长度
	if (num == rotateLength) {
		num = 0;
	}

	rotate = "rotate_Img_"; // 恢复
	num++;

	rotate = (rotate + num.toString());

	$("#" + rotate).show();
	rotate = "rotate_Img_"; // 恢复

}

// 定时器
setInterval("time_rotateLeft()", 5000);
