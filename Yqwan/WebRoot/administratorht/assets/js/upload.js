function doUpload() {
	var number = $(".abc li").index();
		$.upload({
			// 上传地址
			url: '/Yqwan/administrat/fileload.do', 
			// 文件域名字
			fileName: 'indexpicture', 
			// 其他表单数据
			// fileName: 'filedata', 
			// 上传完成后, 返回json, text
			dataType: 'text',
			// 上传之前回调,return true表示可继续上传
			onSend: function() {
					return true;
			},
			// 上传之后回调
		onComplate: function(data) {
			$(".indexpicture").val(data);
			$(".indeximg").html("<img src='"+data+"' height='70' width='121' />");
		}
	});
}