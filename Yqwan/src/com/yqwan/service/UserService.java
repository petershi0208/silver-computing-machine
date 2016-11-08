package com.yqwan.service;

public class UserService {
	
	/**
	 * 减去Gb
	 * @param nowGb 当前Gb数
	 * @param gb	需要减去的Gb数
	 * @return
	 */
	public static String minusGb(String nowGb,String gb){
		Integer nowGb1 = Integer.parseInt(nowGb);
		Integer gb1 = Integer.parseInt(gb);
		Integer g = nowGb1-gb1;
		String minusGb = Integer.toString(g);
		return minusGb;
	}
	
	/**
	 * 加上Gb
	 * @param nowGb	当前Gb数
	 * @param gb	需要加上的Gb数
	 * @return
	 */
	public static String plusGb(String nowGb,String gb){
		Integer nowGb1 = Integer.parseInt(nowGb);
		Integer gb1 = Integer.parseInt(gb);
		Integer g = nowGb1+gb1;
		String plusGb = Integer.toString(g);
		return plusGb;
	}
	/**
	 * 加百分之10
	 * @param money
	 * @return
	 */
	public static int tenpercent(int money) {
		float fmoney = Float.parseFloat(money+"")/10;			//提成百分之10
		money = (int)fmoney+money;
		return money;
	}
}
