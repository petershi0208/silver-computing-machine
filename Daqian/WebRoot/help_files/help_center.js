//切换菜单
function switchMenu(obj) {

	if (obj != null) {
		if ($("#" + obj).is(":hidden")) {// 是否隐藏
			// $("#"+obj).slideDown();
			$("#" + obj).toggle(500);
		} else {
			// $("#"+obj).slideToggle();
			$("#" + obj).toggle(500);
		}

	}
}

// 导航栏单机选择
function btnMenu(imgId, fontObj, divId, obj) {
	var back = "back";
	var white = "white";

	$("#" + obj).css("background-color", "#e74c3c");// 修改背景颜色

	// 获取当前pojoIcon 和 字体颜色
	var backImg = $("#" + imgId).css("background-image");
	var rgb = $("#" + fontObj).css("color");

	// rgb颜色格式的正则
	rgb = rgb.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
	// 得到转换后的颜色
	var colors = "#" + hex(rgb[1]) + hex(rgb[2]) + hex(rgb[3]);

	// 判断当前状态
	if (colors == "#555555" && backImg.indexOf(back) > 0
			&& $("#" + divId).is(":hidden")) {

		$("#" + fontObj).css("color", "#ffffff");
	} else if (colors == "#ffffff" && backImg.indexOf(white) > 0
			&& $("#" + divId).is(":visible")) {
		$("#" + obj).css("background-color", "#ffffff");
		$("#" + fontObj).css("color", "#555555");
	}

	// 颜色转换函数
	function hex(x) {
		return ("0" + parseInt(x).toString(16)).slice(-2);
	}
}

function selectdMenu(imgId, fontObj, divId, obj) {
	if ($("#" + divId).is(":hidden")) {
		$("#" + obj).css("background-color", "#e74c3c");// 修改背景颜色
		$("#" + fontObj).css("color", "#ffffff");
	}
}

function selectdOutMenu(imgId, fontObj, divId, obj) {
	// visible
	if ($("#" + divId).is(":hidden")) {
		$("#" + obj).css("background-color", "#ffffff");// 修改背景颜色
		$("#" + fontObj).css("color", "#555555");

	}
}

function btnSecondMenu(imgId, fontObj) {
	if ((imgId != null && imgId != "") || (fontObj != null && fontObj != "")) {
		// 截取字符串中的数字并强转
		var num = parseInt(imgId.replace(/[^0-9]/ig, ""));
		for ( var i = 0; i <= $("div[name=second_menu]").length; i++) {
			if (i == num) {
				$("#" + fontObj).css("color", "#ffffff");
				$("#" + imgId).css("background-color", "#fc817c");
			} else {
				$("#secondfont_" + i).css("color", "");// 这里是将颜色制为空
				$("#secondBackImg_" + i).css("background-color", "");// 这里是将颜色制为空

			}
		}

	} else {

		alert("请检查网络！");
		return;
	}

}

function loadMenu() {

	var menus = $("#menus").val();

	var rank = $("#rank").val();

	var fontcolor = $("#fontcolor").val();

	var menuId = $("#menu_id").val();

	var secondbackimg = $("#secondbackimg").val();
	var second_font = $("#second_font").val();

	$("#" + menuId).css("background-color", "#e74c3c");// 修改背景颜色
	$("#" + fontcolor).css("color", "#ffffff");
	$("#" + second_font).css("color", "#ffffff");
	$("#" + secondbackimg).css("background-color", "#fc817c");
	$("#" + menus).show();

}





















