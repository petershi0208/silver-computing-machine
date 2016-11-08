package com.yqwan.cplfactory;

public abstract class CPL {
	/**
	 * 向CPL建立请求，通知对方该用户为推荐过来的
	 * @param uid 用户ID
	 * @param tid CPL携带过来的参数唯一标识
	 * @param tokenID CPL携带过来的参数广告位码
	 * @param nickname 昵称
	 * @return
	 */
	public abstract String buildRequest(String uid,String tid,String tokenID, String nickname);
}
