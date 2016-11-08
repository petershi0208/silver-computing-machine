package com.daqian.dao;

import java.util.List;

import com.daqian.entity.Productinfos;


public interface ProductinfosDAO {
	public int add(Productinfos p);
	public List<Productinfos> all();
	public List<Productinfos> pall();
	public Productinfos findById(int id);
	public List<Productinfos> findByminsun();
	public List<Productinfos> findBymaxsun();
	public Productinfos findminByid(int id);
	public Productinfos findmaxByid(int id);
	public Productinfos findmoneyByid(int pid,int monthoryear,int amount);
	public void updateLastmoneyById(int lastmoney,int id);
	public List<Productinfos> findBydate(String date1,String date2);
	public void updateById(Productinfos p);
	public Productinfos findByPname(String productname);
	
	public List<Productinfos> paging(int currentpage,int pagesize);
	public Productinfos findCount();
	public List<Productinfos> findBySperson(String sperson);
	public Productinfos findCountByDay(String date);
	public Productinfos findCountByMonth(String date);
	public void delete(String productname);
	
}
