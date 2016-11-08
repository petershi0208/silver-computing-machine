package com.wxpay.config;

public class wxpayConfig {		
	//微信支付商户开通后 微信会提供appid和appsecret和商户号partner
	public static String appid = "wx0adf11b9ef23deb0";//"wx84b7a98d26a08ec7";
	public static String appsecret = "95d583d50494c00820bbc39f818b375c";//"9ac6648ccce9682e4ebaf86cb0e2d683 ";
	public static String partner = "1355436902";//"1288111201";
	//这个参数partnerkey是在商户后台配置的一个32位的key,微信商户平台-账户设置-安全设置-api安全
	public static String partnerkey = "64vzmcoiuowqihl76419413kdfamkgip";//"fyqfja371jcat24mkhi6dh9q24xcglcf";
	//openId 是微信用户针对公众号的标识，授权的部分这里不解释
//	private static String openId = "";
	//微信支付成功后通知地址 必须要求80端口并且地址不能带参数
	public static String notifyurl = "http://www.199y.com/wx_notify.do";	
}
