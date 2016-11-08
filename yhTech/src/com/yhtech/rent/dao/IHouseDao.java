package com.yhtech.rent.dao;

import java.util.List;

import com.yhtech.rent.domain.House;


public interface IHouseDao {
	public List<House> listAll();
	public List<House> findByName(String renter_name);
	public House findByHouseid(String house_id);
	public int add(House house);
	public int update(House house);
}
