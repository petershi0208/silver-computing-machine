package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.LatestRegion;

/**
 * 各游戏 玩家的最新登录区 以及游戏信息
 * @author Administrator
 *
 */
@Repository("region")
public interface IRegionDao {
	public LatestRegion findregion(String userid,String gamename,String serverid);			
	public void  updateregion(LatestRegion latestregion);
	public void insertregion(LatestRegion latestregion);
	public LatestRegion findLatestRegion(String userid,String gamename);
	
	
	public List<LatestRegion> gameregister(LatestRegion latestRegion);
	public List<LatestRegion> paging(String userid,int currentpage,int pagesize);
	public int count(String userid);
}
