package com.yihuo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;


import com.yihuo.domain.House;

@Repository("housedao")
public interface IHouseDao {
	public List<House> listAll();
	public List<House> findByName(String renter_name);
	public House findByHouseid(String house_id);
	public int add(House house);
	public int update(House house);
}
