package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Gamedistrict;


@Repository("gamedistrict")
public interface IGameDistrictDao {
	public void insert(Gamedistrict gamedistrict);			//插数据
	
	public List<Gamedistrict> listgameregion(String gamename);		//查找游戏分区
	
	 public int add(Gamedistrict g);
	 public int update(Gamedistrict g);
	 public int delete(int id);
	 public List<Gamedistrict> paging(String gamename,int pagesize,int currentpage);
	 public List<Gamedistrict> listAll();
	 public Gamedistrict findbyid(int id);
	 public int count(String gamename);

	public List<Gamedistrict> findNewDistrict(String gamename);

	public List<Gamedistrict> listallregion(String gamename);

	/**
	 * 获得分区ID
	 * @param gamedistrict
	 * @return
	 */
	public int getserveridByregion(Gamedistrict gamedistrict);
	
	/**
	 * 获得分区名字
	 * @param gamedistrict
	 * @return
	 */
	public String getregionByserverid(Gamedistrict gamedistrict);
	
	/**
	 * 获得游戏名字和分区名字
	 * @param gameid
	 * @param serverid
	 * @return
	 */
	public Gamedistrict getnamebyid(String gameid,String serverid);
	
	/**
	 * 修改游戏ID
	 * @param gamedistrict
	 * @return
	 */
	public int updateByName(Gamedistrict gamedistrict);
	
}
