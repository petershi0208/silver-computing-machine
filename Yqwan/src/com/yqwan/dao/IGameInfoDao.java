package com.yqwan.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Gameinfo;


@Repository("gameinfodao")
public interface IGameInfoDao {
	public void insert(Gameinfo game);					//插入数据
	public Gameinfo findBygameid(String gamename);		//通过游戏名查找
	public String listpicAll(String gamename);			//遍历详情页图片
	
	 public int add(Gameinfo g);
	 public int update(Gameinfo g);
	 public List<Gameinfo> all();
	 public List<Gameinfo> paging(String gamename,int currentpage,int pagesize);
	 public Gameinfo findbyid(int id);
	 public Gameinfo findbyname(String gamename);
	 public Gameinfo findbygamenamea(String gamename);
	 
	 public Gameinfo findBynameid(String gameid);
	 
	 public int count(String gamename);
	 public int delete(int id);
	 
	 public void updatecomment(Gameinfo gameinfo);		//更新评论数
	 public List<Gameinfo> listByComment();						//获取评论数最多的游戏（首页更新列表）
	 
	 public int getlastgameid();				//获得最近发布的游戏的游戏ID
	 
	
	
}
