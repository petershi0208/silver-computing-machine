package com.yqwan.dao;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.CplUser;

@Repository("cpluser")
public interface ICplUserDao {

	/**
	 * 注册cpl用户
	 * @param CplUser
	 */
	public void insertcpluser(CplUser CplUser);
	
	/**
	 * 易瑞特推广用户查询
	 * @param userid 用户
	 * @return
	 */
	public CplUser findYrtByUserid(String userid);
	
}
