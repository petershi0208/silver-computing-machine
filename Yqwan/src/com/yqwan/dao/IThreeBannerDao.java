package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Threebanner;

@Repository("threebanner")
public interface IThreeBannerDao {
	 public List<Threebanner> listAll();
	 public int insert(Threebanner t);
	 public int update(Threebanner t);
	 public int delete(int id);
	 public Threebanner findbyid(int id);
	 
	 
	 public List<Threebanner> newserverbanner();
}
