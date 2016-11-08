package com.payrent.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.payrent.domain.RentOrder;

@Repository("iorderdao")
public interface IRentOrderDao {
	public void add(RentOrder order);
	public void updateByOrderid(String orderid,String state);
	public List<RentOrder> findByTelephone(String telephone,String houseid);
	
	public RentOrder findByOrderid(String orderid);
}
