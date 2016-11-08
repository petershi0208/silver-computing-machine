package com.daqian.dao;

import java.util.List;

import com.daqian.entity.Loginfoss;

public interface LoginfosDAO {
	public void add(Loginfoss log);
	public List<Loginfoss> all();
	public List<Loginfoss> findBydate(String date1,String date2);
}
