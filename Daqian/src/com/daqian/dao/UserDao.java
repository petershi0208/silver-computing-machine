package com.daqian.dao;

import java.sql.Date;
import java.util.List;

import com.daqian.entity.User;

public interface UserDao {
	public void changecard(String username,String realname,String card);
	public void changeloginip(String name,String ip);
	public void changelogintime(String name,Date date);
	public void changepwd(String name,String password);
	public User findByPhone(String phone);
	public User findByName(String name);
	public User login(String name);
	public void regist(User u);
	
	public List<User> findbyLRdate(String date1, String date2, String date3, String date4);
	public List<User> findbyLogindate(String date1, String date2);
	public List<User> findbydate(String date1, String date2);
	
	public List<User> all();
	public User findCount();
	public User findCountByDay(String date);
	public User findCountByMonth(String date);
}
