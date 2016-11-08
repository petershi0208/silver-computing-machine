package com.yihuo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.yihuo.domain.Rentorder;

@Repository("rentdao")
public interface IRentorderDao {
	public List<Rentorder> findByName(String name);
	
}
