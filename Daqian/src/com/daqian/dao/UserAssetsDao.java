package com.daqian.dao;


import java.util.List;

import com.daqian.entity.UserAssets;

public interface UserAssetsDao {
	public void recharge(String username,double residualmoney,double availablemoney);
	public void changepaypwd(String name,String password);
	public void insertpwd(String name,String password);
	public UserAssets findByName(String name);
	public void insert(UserAssets u);
	
	public UserAssets findById(int id);
	public void update(double availablemoney,String username);
	public UserAssets findByUsername(String Username);
	public void updateMoneyByStateAndPname(double rolemoney,double residualmoney,String username);
	public void updateEarned(double rolemoney,double residualmoney,String username);
	public void updateRAmoney(double rolemoney,double residualmoney,String username);
	public int updatemoney(double residualmoney,double availablemoney,int id);
	public List<UserAssets> all();
}
