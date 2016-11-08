package com.daqian.dao;

import java.util.List;

import com.daqian.entity.Productinfos;
import com.daqian.entity.UserAssets;
import com.daqian.entity.purchase;

public interface DAO {	
	public List<purchase> findByState(String state);
	public Productinfos findByPname(String pname);
	public List<purchase> findBya();
	public UserAssets findByUsername(String username);
	public void updatePurchase(String date,String pname);
	public void updateByusername(UserAssets u);
	public void updateByCycle(UserAssets u);
	public void updateLastbackdateById(String lastbackdate,int id);
}
