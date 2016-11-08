package com.yqwan.gamefactory;

public abstract class Operation {

	protected String userid;		//用户ID
	protected int serverid;		//分区

	public Operation(String userid, int serverid) {
		super();
		this.userid = userid;
		this.serverid = serverid;
	}
	public Operation() {}

	/**
	 * @return 角色信息json格式 eg:{'status':'0'，'battlevalue':'0'，'lv':'0'}
	 */
	public abstract String checkuser();
	
	/**
	 * 支付结果
	 * @param timestamp 时间戳
	 * @param trade_no	订单号
	 * @param money	金额
	 * @return 充值结果（成功为充值成功）
	 */
	public abstract String payresult(String timestamp,String trade_no,String money,String ext);
	
	/**
	 * 登录请求地址
	 * @param timestamp
	 * @return
	 */
	public abstract String buildRequest(String timestamp);
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getServerid() {
		return serverid;
	}
	public void setServerid(int serverid) {
		this.serverid = serverid;
	}
	
	
}
