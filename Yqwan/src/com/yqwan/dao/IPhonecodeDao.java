package com.yqwan.dao;

import com.yqwan.domain.Phonecode;

public interface IPhonecodeDao {
	public void add(Phonecode phonecode);
	public void delete(String phone);
	public Phonecode findByphone(String phone);
}
