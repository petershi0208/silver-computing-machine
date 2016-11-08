package com.yhtech.rent.dao;

import java.util.List;

import com.yhtech.rent.domain.Applyyearpay;

public interface IApplyyearpayDao {
	public List<Applyyearpay> findByName(String name);
}
