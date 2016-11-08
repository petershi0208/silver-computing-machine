package com.payrent.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.payrent.domain.House;


@Repository("ihousedao")
public interface IHouseDao {
	public List<House> findByTelephone(String telephone);
}
