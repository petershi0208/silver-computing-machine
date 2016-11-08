package com.yqwan.dao;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Admin;

@Repository("admin")
public interface IAdminDao {
	public Admin login(String user);
}
