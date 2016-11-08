package com.yqwan.dao;

import java.util.List;

import com.yqwan.domain.Cdkeyinfo;

public interface ICdkeyInfoDao {
	 public List<Cdkeyinfo> listAll();
	 public int add(Cdkeyinfo c);
	 public int update(Cdkeyinfo c);
	 public int updatebyCdkey(Cdkeyinfo c);
	 public int delete(int id);
	 public Cdkeyinfo findbyid(int id);
	 public Cdkeyinfo randomcdkey(int id);
	 public Cdkeyinfo findbyrepeitor(String receiptor,int giftid);
	 public int count();
	 public int countpag(String giftname);
	 public int isreceive(String receiptor,int giftid);
	 public int countByGiftid(int giftid);
	 public int restCount(int giftid);
	 public List<Cdkeyinfo> paging(String giftname, int pagesize,int currentpage);
	 
	 /**
	  * 获得所有礼包码
	  * @param receiptor
	  * @return
	  */
	 public List<Cdkeyinfo> findAllbyrepeitor(String receiptor);
	 /**
	  * 分页查询
	  * @param receiptor
	  * @return
	  */
	 public List<Cdkeyinfo> findPagebyrepeitor(Cdkeyinfo c);
	
}
