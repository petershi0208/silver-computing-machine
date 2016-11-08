package com.payrent.dao;

import org.springframework.stereotype.Repository;

import com.payrent.domain.Renter;

@Repository("irenterdao")
public interface IRenterDao {
	public int add(Renter renter);
	public int updateByVxin(Renter renter);
	public Renter findByVxin(String vxin);
}
