var html = '<div class="g_top">'+
    '<style>'+
    '.g_top{background: #fff;border-bottom: 1px solid #E4E7EA;height: 38px;box-shadow: inset 0 -4px 4px #FCFCFC;font: normal 12px/1.5 tahoma,arial,sans-serif;}'+
    '.g_top .aux{width: 1024px;margin: 0 auto;zoom: 1;}'+
    '.g_top .aux:after{content: "";display: table;line-height: 0;clear: both;visibility: hidden;}'+
    '.g_top .bp{float: left;background: url("http://static.86game.com/platform/images/top_blue.jpg") no-repeat left center;width: 243px;height: 39px;text-indent: -999em;z-index:10;position:relative;}'+
    '.g_top .game{float: left;display: inline;position: relative;height: 38px;z-index:8;text-align:left}'+
    '.g_top .game img{vertical-align: middle;}'+
    '.g_top .game .down{display: none;position: absolute;left: -243px;top: 0;z-index: 100}'+
    '.g_top .game:hover .down{display: block;}'+
    '.g_top .shortcut{float: right;margin-top: 8px;height: 20px;position:relative;z-index:10;padding: 3px 0;/*box-shadow: inset 0 -2px 2px #F3F3F3;*/}'+
    '.g_top .shortcut li{float: left;height: 23px;line-height: 23px;}'+
    '.g_top .shortcut li a{color: #5f6a84;text-decoration: none;}'+
    '.g_top .shortcut li a.bo{border-right: 1px solid #5F6A84;padding: 0 15px;}'+
    '.g_top .shortcut a:hover{text-decoration: underline;}'+
    '.g_top .shortcut li.last{position:relative;width:88px;height:33px;line-height:25px;padding:0 0 0 10px;' +
    'background:url("http://static.86game.com/platform/images/topbtnbg.jpg") no-repeat;border:none;margin-left:10px;text-align:left;}'+
    '.g_top .shortcut li.last a.la{height:26px;line-height:23px;padding:0;border:none;}'+
    '.g_top .shortcut li.last img.tar{position:absolute;top:9px;right:15px;}'+
    '.g_top .shortcut li.last:hover .gameTree{display: block;}'+
    '.g_top .shortcut a{color: #5f6a84;text-decoration: none;}'+
    '.g_top .shortcut a:hover{text-decoration: underline;}'+
    '.g_top .shortcut .down{position: absolute;right: -1px;top: 19px;border: 1px solid #BFC6D7;background: #fff;border-radius: 2px;border-top-color: #fff;padding: 4px 0;transition:all .4s ease-out;display: none;}'+
    '.g_top .shortcut .down li{border: 0;float: none;line-height: 1.5em;height: auto;}'+
    '.g_top .gameTree{position:absolute;right:-1px;top:28px;width: 780px;height:290px;' +
    'background: #FFFFFF url("http://static.86game.com/platform/images/top_hover_bg.jpg") repeat-x left bottom;padding:1px 5px;font-size: 12px;display:none;}'+
    '.g_top .gameTree ul{list-style-type: none;}'+
    '.g_top .fl{float: left;}'+
    '.g_top .fr{float: right;}'+
    '.g_top .clear{display: block;clear: both;height: 1px;visibility: hidden;}'+
    '.g_top .leD{width: 245px;padding:0;}.g_top .leD ul{padding:0;}'+
    '.g_top .leD ul li{position:relative;width:245px;height:137px;border:1px solid #ebecec;padding:0;}'+
    '.g_top .leD li a{display: block;width: 245px;height: 137px;margin-left;0;padding-left:0;}'+
    '.g_top li.topXc{background: url("http://static.86game.com/platform/images/top_xinc.jpg") no-repeat left top;}'+
	'.g_top li.topDhh5{background: url("http://static.86game.com/platform/images/top_dhh5.jpg") no-repeat left top;}'+
    '.g_top li.topQs{background: url("http://static.86game.com/platform/images/top_qishi.jpg") no-repeat left top;}'+
    '.g_top .leD ul li span{display:block;position:absolute;width:37px;height:37px;left: 2px;top:2px;}'+
    '.g_top .riD{width: 510px;}'+
    '.g_top .riD h3,.riD p{float: left;}'+
    '.g_top .riD h3{width: 100px;color:#696969;font-size: 12px;}'+
    '.g_top .riD li{height:50px;line-height:50px;border:none;}'+
    '.g_top .riD a{margin-right: 20px;}'+
    '.g_top .riD .hot{margin-right:6px;padding-right:25px;color:#FF0000;font-weight: bold;background: url("http://static.86game.com/platform/images/hot.png") no-repeat top right;}'+
    '.g_top .riD p{width:370px;padding-left: 18px;border-bottom: 1px dotted #00aeff;text-align:left;}'+
    '</style>'+
    '<div class="aux">'+
    '<h1 class="bp">布鲁潘达，只做精品游戏！</h1>'+
    '<div class="game">'+
    '<img src="http://static.86game.com/platform/images/top_s.jpg" alt=""/>'+
    '<div class="down">'+
    '<a href="http://active.86joy.com/Activity/index.php/RxjhLinkage" target="_blank"><img src="http://static.86game.com/platform/images/top_b.jpg" alt="" height="188px"/></a>'+
    '</div>'+
    '</div>'+
        '<div style="float: left;padding: 3px 0;margin-top: 10px;margin-left:26px;display:none">'+
         '<a href="http://86game.com/watch/parents-index.html" target="_blank">家长监护</a>'+
         '</div>'+
    '<ul class="shortcut">'+
    '<li><a class="bo" target="_blank" href="http://xm.86game.com">信喵之野望</a></li>'+
    '<li><a class="bo" target="_blank" href="http://g.86joy.com">鬼武者魂</a></li>'+
    '<li><a target="_blank" href="http://www.hanghai5.com"  style="border:none;padding: 0 15px;">大航海时代5 </a></li>'+
    '<li class="last">'+
    '<p class="tree"><a class="la" id="la" href="javascript:;">游戏全目录<img class="tar" src="http://static.86game.com/platform/images/trian.png"/></a></p>'+
    '<div class="gameTree">'+
    '<div class="fl leD" id="leD">'+
    '<ul>'+
    '<li class="topDhh5">'+
    '<span><img src="http://static.86game.com/platform/images/hot_im.png" /></span>'+
    '<a target="_blank" href="http://www.hanghai5.com/"></a>'+
    '<a style="visibility: hidden">大航海时代5</a>'+
    '</li>'+
    '<li class="topQs">'+
    '<span><img src="http://static.86game.com/platform/images/hot_im.png" /></span>'+
    '<a href="http://yz.86joy.com/"></a>'+
    '<a style="visibility: hidden;">像素骑士团</a>'+
    '</li>'+
    '</ul>'+
    '</div>'+
    '<div class="fr riD">'+
    '<ul>'+
    '<li>'+
    '<h3>光荣公司出品：</h3>'+
    '<p>'+
    '<a class="hot" href="http://www.hanghai5.com/" target="_blank">大航海时代5</a>'+
    '<a href="http://xm.86game.com/" target="_blank">信喵之野望</a>'+
    '<a href="http://xc.86game.com/index.html" target="_blank">百万信长</a>'+
    '</p>'+
    '<span class="clear"></span>'+
    '</li>'+
    '<li>'+
    '<h3>战国卡牌精品：</h3>'+
    '<p>'+
    '<a href="http://xm.86game.com/" target="_blank">信喵之野望</a>'+
    '<a href="http://g.86joy.com/" target="_blank">鬼武者魂</a>'+
    '<a href="http://xc.86game.com/index.html" target="_blank">百万信长</a>'+
    '<a href="http://zjws.86joy.com/index.html" target="_blank">战姬无双</a>'+
    '</p>'+
    '<span class="clear"></span>'+
    '</li>'+
    '<li>'+
    '<h3>日系奇幻策略：</h3>'+
    '<p>'+
	'<a href="http://yz.86joy.com/" target="_blank">像素骑士团</a>'+	
	'<a href="http://zqsd.86joy.com/" target="_blank">战棋时代</a>'+
	'<a href="http://sh.86joy.com/" target="_blank">圣痕幻想 Ⅱ</a>'+
	'<a href="http://ro.86joy.com/" target="_blank">仙境物语</a>'+
	'<a href="http://sqsd.86joy.com/" target="_blank">石器时代</a>'+
    '</p>'+
    '<span class="clear"></span>'+
    '</li>'+
    '<li>'+
    '<h3>历史策略：</h3>'+
    '<p>'+
    '<a href="http://xm.86game.com/" target="_blank">信喵之野望</a>'+
    '<a href="http://wz.86joy.com/" target="_blank">王者召唤</a>'+
	'<a href="http://mjwz.86joy.com/" target="_blank">英雄皇冠</a>'+
	'<a href="http://dtzj.86joy.com/" target="_blank">刀塔战纪</a>'+
	'<a class="hot" href="http://rxjh.86joy.com/" target="_blank">热血江湖</a>'+
    '</p>'+
    '<span class="clear"></span>'+
    '</li>'+
    '<li>'+
    '<h3>航海精品：</h3>'+
    '<p>'+
    '<a href="http://www.hanghai5.com/" target="_blank">大航海时代5</a>'+
    '<a href="http://dhhj.86joy.com/" target="_blank">大航海家</a>'+
    '<a href="http://dhhsj.86joy.com" target="_blank">大航海世界</a>'+
    '</p>'+
    '<span class="clear"></span>'+
    '</li>'+
    '</ul>'+
    '</div>'+
    '</div>'+
    '</li>'+
    '</ul>'+
    '</div>'+
    '</div>';
/*$(function(){
    $(".la").on("mouseover", function(){
        $(".gameTree").show();
    }).on("mouseout", function(){
        $(".gameTree").on("mouseout", function(){
            $(".gameTree").hide();
        });
	*/
document.write(html);
  