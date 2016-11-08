package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.CdkeyBanner;

@Repository("cdkeybanner")
public interface ICdkeyBannerDao {
	 public List<CdkeyBanner> listAll();
	 public int add(CdkeyBanner c);
	 public int update(CdkeyBanner c);
	 public int delete(int id);
	 public CdkeyBanner findbyid(int id);
}
