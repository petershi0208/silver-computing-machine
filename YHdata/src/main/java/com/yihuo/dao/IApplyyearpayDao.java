package com.yihuo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.yihuo.domain.Applyyearpay;

@Repository("applydao")
public interface IApplyyearpayDao {
	public List<Applyyearpay> findByName(String name);
}
