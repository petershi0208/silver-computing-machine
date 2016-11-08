package com.daqian.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.daqian.entity.Creditor;
@Repository("creditordao")
public interface CreditorDao {
	public void add(Creditor creditor);
	public Creditor findByname(String name);
	public Creditor findById(int id);
	public List<Creditor> all();
	public int delete(int id);
	public int update(Creditor creditor);
	
}
