package com.payrent.dao;

import org.springframework.stereotype.Repository;

import com.payrent.domain.Phonecode;

@Repository("iphonecodedao")
public interface IPhonecodeDao {
	public void add(String phone,String code);
	public void delete(String phone);
	public Phonecode findByphone(String phone);
	public int updatecode(String phone,String code);
}
