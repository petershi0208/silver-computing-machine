package com.daqian.dao;

import java.util.List;

import com.daqian.entity.Subproduct;



public interface SubproductDAO {
	public int add(Subproduct i);
	public List<Subproduct> all();
	public Subproduct findById(int id);
	public Subproduct findByPId(int Pid);
	

	public void updateById(Subproduct i);
	public List<Subproduct> findBydate(String date1,String date2);
}
