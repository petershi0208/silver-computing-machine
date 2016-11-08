package com.peter.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/* *
 *类名：UtilDate
 *功能：自定义订单类
 *详细：工具类，可以用作获取系统日期、订单编号等
 *版本：1.0
 *日期：2016-01-22
 *author:TYShi
 */
public class UtilDate {
	
    /** 年月日时分秒(无下划线) yyyyMMddHHmmss */
    public static final String dtLong                  = "yyyyMMddHHmmss";
    
    /** 完整时间 yyyy-MM-dd HH:mm:ss */
    public static final String simple                  = "yyyy-MM-dd HH:mm:ss";
    
    /** 年月日(无下划线) yyyyMMdd */
    public static final String dtShort                 = "yyyyMMdd";
    
    /** 年月日(下划线) yyyy-MM-dd */
    public static final String Short                 = "yyyy-MM-dd";
    /** 年月(下划线) yyyyMM */
    public static final String Month                = "yyyyMM";
    
    /**
	 * 获取系统当期年月，格式：yyyyMM
	 * @return
	 */
	public static String getMonth(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat(Month);
		return df.format(date);
	}
    
    /**
     * 返回系统当前时间(精确到毫秒),作为一个唯一的订单编号
     * @return
     *      以yyyyMMddHHmmss为格式的当前系统时间
     */
	public  static String getOrderNum(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat(dtLong);
		return df.format(date);
	}
	
	/**
	 * 获取系统当前日期(精确到毫秒)，格式：yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public  static String getDateFormatter(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat(simple);
		return df.format(date);
	}
	
	/**
	 * 获取系统当期年月日(精确到天)，格式：yyyyMMdd
	 * @return
	 */
	public static String getDate(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat(dtShort);
		return df.format(date);
	}
	
	/**
	 * 获取系统当期年月日(精确到天)，格式：yyyy-MM-dd
	 * @return
	 */
	public static String getDate1(){
		Date date=new Date();
		DateFormat df=new SimpleDateFormat(Short);
		return df.format(date);
	}
	
	/**
	 * 获取时间戳
	 */
	public static String getTimeStamp(){
		Date date = new Date();
		long timestamp = date.getTime()/1000;
		String timestamp1 = Long.toString(timestamp);
		return timestamp1;
	}
	
	
	/**
	 * 产生随机的三位数
	 * @return
	 */
	public static String getThree(){
		Random rad=new Random();
		return rad.nextInt(1000)+"";
	}
	
}
