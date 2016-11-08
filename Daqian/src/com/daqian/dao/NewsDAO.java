package com.daqian.dao;

import java.util.List;

import com.daqian.entity.News;

public interface NewsDAO {
	public List<News> findByState1(String state,int page);
	
	public void add(News n);
	public void updateById(News n);
	public void updateState(String state,int id);
	public List<News> all();
	public List<News> findByState(String state);
	public List<News> findByDate(String date1,String date2);
	public News findById(int id);
	
	public News findCount();
	public News findCountByDay(String date);
	public News findCountByMonth(String date);
}
