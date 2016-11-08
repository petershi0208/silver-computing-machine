package com.daqian.dao;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.daqian.entity.User;

public class TestDI {

	/**
	 * @param args
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws SQLException {
		String conf="applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		DataSource ds = ac.getBean("dbcp",DataSource.class);
		UserDao u = ac.getBean("userdao",UserDao.class);
		System.out.println(ds.getConnection());
		
		User user = new User();
		user.setUsername("peter");
		user.setPassword("1234");
		user.setTelephone("15026451850");
		user.setRole("理财");
		u.regist(user);
	}
}
