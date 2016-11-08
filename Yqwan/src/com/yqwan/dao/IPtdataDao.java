package com.yqwan.dao;

import org.springframework.stereotype.Repository;


@Repository("ptdata")
public interface IPtdataDao {
	public void add(String userid,String name,String maxfloor);
}
