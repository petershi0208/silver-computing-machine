package com.yhtech.rent.dao;

import java.util.List;

import com.yhtech.rent.domain.Rentorder;

public interface IRentorderDao {
	public List<Rentorder> findByName(String name);
	
}
