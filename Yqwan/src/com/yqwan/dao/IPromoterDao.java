package com.yqwan.dao;

import com.yqwan.domain.Promoter;

public interface IPromoterDao {
	/**
	 * 通过推广码查询
	 * @param spreadcode 推广码
	 * @return
	 */
	public Promoter findBynumber(String spreadcode);
	
	/**
	 * 增加推广用户
	 * @param promoter
	 */
	public void addNewPromoter(Promoter promoter);

	/**
	 * 通过用户名查询
	 * @param userid
	 * @return
	 */
	public Promoter findByUserid(String userid);		
}
