var currentindex = 1;
//$("#flashBg").css("background-color", $("#flash1").attr("name"));
function changeflash(i) {
	currentindex = i;
	for ( var j = 1; j <= 7; j++) {
		if (j == i) {
			//$("#flash" + j).hide();
			//$("#flash" + j).show();
			//$("#flash" + j).fadeOut();
			$("#flash" + j).fadeIn(1000);
			$("#f" + j).removeClass();
			$("#f" + j).addClass("dq");
			//$("#flashBg").css("background-color", $("#flash" + j).attr("name"));
			//$("#index_background").css("background-color",
				//	$("#flash" + j).attr("name"));
		} else {
			$("#flash" + j).fadeOut(1000);
			$("#f" + j).removeClass();
			$("#f" + j).addClass("no");
		}
	}
}
function startAm() {
	timerID = setInterval("timer_tick()",5000);
}
function stopAm() {
	clearInterval(timerID);
}
function timer_tick() {
	currentindex = currentindex >= 7 ? 1 : currentindex + 1;
	changeflash(currentindex);
}
$(document).ready(function() {
	$("#flash_bar div").mouseover(function() {
		stopAm();
	}).mouseout(function() {
		startAm();
	});
	startAm();
});

/* 小图轮播 start */
var currentindex_min = 1;
$("#flashBg").css("background-color", $("#flash1").attr("name"));
function changeflash_min(i) {
	currentindex_min = i;
	for ( var j = 1; j <= 4; j++) {
		if (j == i) {
			$("#flash_min" + j).fadeIn("normal");
			$("#flash_min" + j).css("display", "block");
			$("#f_min_" + j).removeClass();
			$("#f_min_" + j).addClass("dq_min");
			$("#flashBg_min").css("background-color",
					$("#flash_min" + j).attr("name"));
			$("#index_background_min").css("background-color",
					$("#flash_min" + j).attr("name"));
		} else {
			$("#flash_min" + j).css("display", "none");
			$("#f_min_" + j).removeClass();
			$("#f_min_" + j).addClass("no_min");
		}
	}
}
function startAm_min() {
	timerID_min = setInterval("timer_tick_min()", 4000);
}
function stopAm_min() {
	clearInterval(timerID_min);
}
function timer_tick_min() {
	currentindex_min = currentindex_min >= 4 ? 1 : currentindex_min + 1;
	changeflash_min(currentindex_min);
}
$(document).ready(function() {
	$(".flash_bar_min div").mouseover(function() {
		stopAm_min();
	}).mouseout(function() {
		startAm_min();
	});
	startAm_min();
});
/* 小图轮播 end */



$(document).ready(function() {
	// 滚动新闻条
	$('.news-container').vTicker({
		speed : 600,
		pause : 3000,
		showItems : 6,
		animation : 'fade',
		mousePause : true,
		height : 0,
		direction : 'up'
	});
});

$(document).ready(function() {
	// 滚动常见问题
	$('.issue').vTicker({
		speed : 600,
		pause : 4000,
		showItems : 5,
		animation : 'fade',
		mousePause : true,
		height : 0,
		direction : 'up'
	});
});