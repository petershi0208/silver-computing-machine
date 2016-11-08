package com.yqwan.service;

import com.yqwan.sign.MD5;

public class GameApi {
	private static final String path = "http://game.199ymxwk.90tank.com/lypage/game.aspx?";
	private static int isAdult = 1;
	private static String login_key = "e356003c7fa55959ba7e623258338c00";
	
	/**
	 * 拼接游戏接口路径
	 * @param userid
	 * @param serverid
	 * @param timestamp
	 */
	public static String buildRequest(String userid, String serverid,
			String timestamp) {
		// TODO Auto-generated method stub
		String sign = makesign(userid,serverid,timestamp);
		String allpath= path+"uid="+userid+"&serverid="+serverid+"&ptime="+Integer.parseInt(timestamp)+"&isadult="+isAdult+"&sign="+sign;
		return allpath;
	}
	
	/**
	 * 签名
	 * @param userid	用户名
	 * @param serverid	服务器号
	 * @param timestamp	时间戳
	 * @return
	 */
	private static String makesign(String userid, String serverid,
			String timestamp) {
		String text = "uid="+userid+"&serverid="+serverid+"&ptime="+Integer.parseInt(timestamp)+"&isadult="+isAdult+"&"+login_key;
		String sign = MD5.sign(text, "utf-8");
		return sign;
	}
	
}
