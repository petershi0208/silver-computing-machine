package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Gamelist;


@Repository("gamelist")
public interface IGameListDao {	
	public List<Gamelist> listAll(String gametype);			//单机or网游前三
	public List<Gamelist> listAllMore(Gamelist list);		//单机or网游所有（分页）
	public List<Gamelist> listAllMoreGame(String gametype);	//单机or网游所有记录(记录个数)
	
	public List<Gamelist> listneigouhAll();					//内购和H5游戏8个
	public List<Gamelist> listyeyou();						//网页游戏（H5加页游）27条
	public List<Gamelist>  listyeyouMore(int n);			//更多,16条一页
	public List<Gamelist>  listAllyeyou();					//所有页游
	
	public List<Gamelist> listNewgame();					//新游戏前三
	public List<Gamelist> listNewgameMore(int n);			//新游戏所有（分页）
	public List<Gamelist> listAllNewgameMore();			//新游戏所有记录(记录个数)
	
	public List<Gamelist> listBoutiqueAll();			//首页6个精品游戏
	public List<Gamelist> listBoutiqueMoreAll(int n);			//所有精品游戏（分页）
	public List<Gamelist> listBoutiqueMoreAllGame();			//精品游戏所有记录
	
	public List<Gamelist> listresouAll();			//按评分排序
	
	public List<Gamelist> listrecommendAll();				//推荐应用
	public List<Gamelist> listhotAll();				//热销榜
	public List<Gamelist> listhotAllGame(int n);			//热门游戏所有 按点击排序
	public List<Gamelist> listnewAll();				//新游榜
	
	public String click(String gamename);					//查看点击
	public void modifyClick(Gamelist list);				//修改点击量
	
	public List<Gamelist> listgamename();						//充值-所有内购，H5游戏名字
	public List<Gamelist> listneigougamename();						//充值-所有内购游戏名字
	
//	public Gamelist findBygameid(String gamename);		//通过游戏名查找
	
	public List<Gamelist> listgameinfo();				//游戏详情页的游戏循环
	
	public List<Gamelist> listselectgame(String gamename);				//模糊查询下拉框
	public List<Gamelist> listselectmoregame(Gamelist gamelist);				//模糊查询跳更多
	public List<Gamelist> listallselectmoregame(String gamename);				//模糊查询总共多少记录（分页）
	
	public List<Gamelist> listclassifygame(Gamelist gamelist);			//分类游戏条件筛选总条数
	public List<Gamelist> listclassifygameMore(Gamelist gamelist);		//分页
	
	public String getgamenamebygameid(int id);			//通过游戏id得到游戏名字
	public int getgameidbygamename(String id);			//通过游戏名字得到游戏id
	
	public void insert(Gamelist gamelist);					//插数据
	
	
	
//游戏分类
	public List<Gamelist> listClassifyRole(String placetype);				//角色扮演
	public List<Gamelist> listClassifyPlan(String placetype);				//角色策略
	public List<Gamelist> listClassifyManage(String placetype);				//角色扮演
	public List<Gamelist> listClassifySpecial(String placetype);				//角色策略
	
//游戏专辑
	public List<Gamelist> listRecord();
	
//后台
	public int add(Gamelist g);
	 public int update(Gamelist g);
	 public List<Gamelist> paging(String giftname,int pagesize,int currentpage);
	 public int count(String gamename);
	 public Gamelist findbyid(int id);
	 public Gamelist findbyname(String gamename);
	 public int delete(int id);
	 
	 public int updatescore(Gamelist g);
	 
//游戏专题用
	public List<Gamelist> listfiverecommend();
	
	//openserver
	public List<Gamelist> listOpenService();
	
	
}
