package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Giftinfo;
@Repository("giftinfo")
public interface IGiftInfoDao {
	public int update(Giftinfo gift);
	public int add(Giftinfo gift);
	public List<Giftinfo> paging(String giftname,int currentpage,int pagesize);
	public List<Giftinfo> qiang();
	public List<Giftinfo> all();
	public List<Giftinfo> topnine();
	public Giftinfo findbyid(int id);
	public int count(String giftname);
	public int delete(int id);
}
