package com.payrent.dao;

import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.Map;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.peter.util.Log;
import com.peter.util.MapToParam;

public class TestDI {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
//		String conf="applicationContext.xml";
//		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
//		IThreeBannerDao three = ac.getBean("threebanner",IThreeBannerDao.class);
//		Threebanner t = new Threebanner();
//		t.setBannerdate("2015-12-16 9:16:30");
//		t.setGamename("壹火互动");
//		t.setGamepicture("abc.jpg");
//		three.insert(t);
//		System.out.println(t);
		Map<String,String> sParam = new LinkedHashMap<String,String>();
		sParam.put("gameid", "13123");
		sParam.put("serverid", "");
		sParam.put("userid", "aaa123123");
		sParam.put("money", "");
		String a = MapToParam.createKeyValue(sParam);
		System.out.println(a);
	}

}
