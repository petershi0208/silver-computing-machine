//foot页面图标切换效果
$(function(){
	$('#footulpic li:eq(0) img,#footultext li:eq(0)').hover(function(){
		$('#footulpic li:eq(0) img').attr('src','/Yqwan/index/about-hover.png');
		$('#footultext li:eq(0)').css('color','#f28737');
	},
	function(){
		$('#footulpic li:eq(0) img').attr('src','/Yqwan/index/about.png');
		$('#footultext li:eq(0)').css('color','#8d8f8f');
	});
	$('#footulpic li:eq(1) img,#footultext li:eq(1)').hover(function(){
		$('#footulpic li:eq(1) img').attr('src','/Yqwan/index/yigncai.png');
		$('#footultext li:eq(1)').css('color','#f28737');
	},
	function(){
		$('#footulpic li:eq(1) img').attr('src','/Yqwan/index/yigncai_53.png');
		$('#footultext li:eq(1)').css('color','#8d8f8f');
	});
	$('#footulpic li:eq(2) img,#footultext li:eq(2)').hover(function(){
		$('#footulpic li:eq(2) img').attr('src','/Yqwan/index/link-hover.png');
		$('#footultext li:eq(2)').css('color','#f28737');
	},
	function(){
		$('#footulpic li:eq(2) img').attr('src','/Yqwan/index/link.png');
		$('#footultext li:eq(2)').css('color','#8d8f8f');
	});
	$('#footulpic li:eq(3) img,#footultext li:eq(3)').hover(function(){
		$('#footulpic li:eq(3) img').attr('src','/Yqwan/index/response-hover.png');
		$('#footultext li:eq(3)').css('color','#f28737');
	},
	function(){
		$('#footulpic li:eq(3) img').attr('src','/Yqwan/index/response.png');
		$('#footultext li:eq(3)').css('color','#8d8f8f');
	});
	$('#footulpic li:eq(4) img,#footultext li:eq(4)').hover(function(){
		$('#footulpic li:eq(4) img').attr('src','/Yqwan/index/hongse-shoucang.png');
		$('#footultext li:eq(4)').css('color','#f28737');
	},
	function(){
		$('#footulpic li:eq(4) img').attr('src','/Yqwan/index/hongse-shoucanghui.png');
		$('#footultext li:eq(4)').css('color','#8d8f8f');
	});
})

//底部页面跳转
$(function(){
	$('#footulpic li:nth-child(1),#footultext li:nth-child(1)').click(function(){
		window.open('/Yqwan/synopsis/synopsis.jsp','_blank');
	})
	$('#footulpic li:nth-child(2),#footultext li:nth-child(2)').click(function(){
		window.open('/Yqwan/synopsis/join.jsp','_blank');
	})
	$('#footulpic li:nth-child(3),#footultext li:nth-child(3)').click(function(){
		window.open('/Yqwan/synopsis/friendlink.jsp','_blank');
	})
	$('#footulpic li:nth-child(4),#footultext li:nth-child(4)').click(function(){
		window.open('/Yqwan/synopsis/statement.jsp','_blank');
	})
	$('#footulpic li:nth-child(5),#footultext li:nth-child(5)').click(function(){
		alert("你的浏览器不支持该功能，请使用Ctrl+D收藏本页!");
	})
})




//hover效果
//foot页面图标切换效果
/*
$(function(){
	$('#footultext li:eq(0)').hover(function(){
		$('#footultext li:eq(0)').css('color','#f28737');
	},
	function(){
		$('#footultext li:eq(0)').css('color','#8d8f8f');
	});
	$('#footultext li:eq(2)').hover(function(){
		$('#footultext li:eq(2)').css('color','#f28737');
	},
	function(){
		$('#footultext li:eq(2)').css('color','#8d8f8f');
	});
	$('#footultext li:eq(4)').hover(function(){
		$('#footultext li:eq(4)').css('color','#f28737');
	},
	function(){
		$('#footultext li:eq(4)').css('color','#8d8f8f');
	});
	$('#footultext li:eq(6)').hover(function(){
		$('#footultext li:eq(6)').css('color','#f28737');
	},
	function(){
		$('#footultext li:eq(6)').css('color','#8d8f8f');
	});
	$('#footultext li:eq(8)').hover(function(){
		$('#footultext li:eq(8)').css('color','#f28737');
	},
	function(){
		$('#footultext li:eq(8)').css('color','#8d8f8f');
	});
})

$(function(){
	$('#footultext li:nth-child(1)').click(function(){
		window.open('/Yqwan/synopsis/synopsis.jsp','_blank');
	})
	$('#footultext li:nth-child(3)').click(function(){
		window.open('/Yqwan/synopsis/join.jsp','_blank');
	})
	$('#footultext li:nth-child(5)').click(function(){
		window.open('/Yqwan/synopsis/friendlink.jsp','_blank');
	})
	$('#footultext li:nth-child(7)').click(function(){
		window.open('/Yqwan/synopsis/statement.jsp','_blank');
	})
	$('#footultext li:nth-child(9)').click(function(){
		alert("你的浏览器不支持该功能，请使用Ctrl+D收藏本页!");
	})
})
*/