//获得ajax对象
function getXhr(){
		  var xhr = null;
		  if(window.XMLHttpRequest){
		    xhr=new XMLHttpRequest();  
		  }else{
		    xhr = new ActiveXObject('microsoft.XMLHttp');
		  }		
		   return xhr;
		}




//获得理财中的产品
$(function(){
	var name = $('#username').val();
	var page = $('#page').val();
	var xhr = getXhr();
	xhr.open('get','/Daqian/showproduct.do?username='+name+'&page='+page,true);
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4&&xhr.status==200){
			var txt = xhr.responseText;
			var arr = txt.evalJSON();
			var trs = '';
			for(i=0;i<arr.length;i++){
				var s = arr[i];
				trs += '<tr><td>'+s.productname+
						'</td><td>'+s.money+
						'</td><td>'+s.earned+
						'</td><td>'+s.expectedannual+
						'</td><td>'+s.date+
						//'</td><td>'+s.sperson+
						'</td></tr>';
			}
			if(trs==''){
				$('#managerecord').show();
				$('#pagesize').hide();
			}
			$('#managebody').empty();
			$('#managebody').append(trs);
		}
	};
	xhr.send();	
})

//点击上一页获得产品
$(function(){
	var page = $('#page').val();

	if(page<=1){
		$('#last').prop('disabled',true);			//禁用上一页
	}
		
		$('#last').click(function(){
			var name = $('#username').val();
			page = $('#page').val();
			page=Number(page)-1;
			$('#next').removeAttr('disabled');		//恢复下一页的按钮
			$('#page').val(page);
			if(page==1){
				$('#last').prop('disabled',true);
			}
			
			var xhr = getXhr();
			xhr.open('get','/Daqian/showproduct.do?username='+name+'&page='+page,true);
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					var arr = txt.evalJSON();
					var trs = '';
					for(i=0;i<arr.length;i++){
						var s = arr[i];
						trs += '<tr><td>'+s.productname+
								'</td><td>'+s.money+
								'</td><td>'+s.earned+
								'</td><td>'+s.expectedannual+
								'</td><td>'+s.date+
								//'</td><td>'+s.sperson+
								'</td></tr>';
					}
					if(trs==''){
						$('#managerecord').show();
					}
					$('#managebody').empty();
					$('#managebody').append(trs);
				}
			};
			xhr.send();	
		})
	
})

//点击下一页获得产品
$(function(){
	var page = $('#page').val();
	var maxpage = $('#maxpage').val();
	if(page>=maxpage){
		$('#next').prop('disabled',true);		//禁用下一页
	}
		
		$('#next').click(function(){
			var name = $('#username').val();
			page = $('#page').val();
			page=Number(page)+1;
			$('#page').val(page);
			if(page>=maxpage){
				$('#next').prop('disabled',true);
			}
			$('#last').removeAttr('disabled');   //上一页的按钮恢复
			
			var xhr = getXhr();
			xhr.open('get','/Daqian/showproduct.do?username='+name+'&page='+page,true);
			xhr.onreadystatechange=function(){
				if(xhr.readyState==4&&xhr.status==200){
					var txt = xhr.responseText;
					var arr = txt.evalJSON();
					var trs = '';
					for(i=0;i<arr.length;i++){
						var s = arr[i];
						trs += '<tr><td>'+s.productname+
								'</td><td>'+s.money+
								'</td><td>'+s.earned+
								'</td><td>'+s.expectedannual+
								'</td><td>'+s.date+
								//'</td><td>'+s.sperson+
								'</td></tr>';
					}
					if(trs==''){
						$('#managerecord').show();
					}
					$('#managebody').empty();
					$('#managebody').append(trs);
				}
			};
			xhr.send();	
		})
})

