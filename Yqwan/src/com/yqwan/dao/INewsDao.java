package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.News;

@Repository("news")
public interface INewsDao {
	/**
	 * 插入新闻
	 * @param news
	 */
	public void insert(News news);
	
	/**
	 * 获得新闻
	 * @return
	 */
	public List<News> getnews(int page,String type);
	
	/**
	 * 获得新闻详情
	 * @param newsid
	 * @return
	 */
	public News getnewsinfo(String newsid);
	
	/**
	 * 获得20个新闻
	 * @return
	 */
	public List<News> listNews();
	
	/**
	 * 分页条件查询
	 * @param title	标题
	 * @param currentpage	第几页
	 * @return
	 */
	public List<News> paging(String title,int currentpage,int pagesize);
	/**
	 * 条件数量查询
	 * @param title
	 * @return
	 */
	public int newscount(String title);
	/**
	 * 通过id查找新闻内容
	 * @param id
	 * @return
	 */
	public News findById(int id);
	/**
	 * 修改
	 * @param news
	 * @return
	 */
	public int update(News news);
	/**
	 * 获取newsid
	 * @return
	 */
	public int newsid();
	
	/**
	 * 加入新闻主图
	 * @param news
	 */
	public void updateindexpicture(News news);
	
	/**
	 * 删除新闻
	 * @return
	 */
	public int delete(int id);
	
	/**
	 * 接口用sql
	 * @param type
	 * @return
	 */
	public List<News> ilistNews(String type,String gamename);		//首页列出新闻5个
	public List<News> ilistAll(String gamename);					//游戏专题页首页列出最新的5个新闻
	
	public List<News> ilistMoreNews(News news);		//更多页新闻
	public List<News> ilistMoreAll(String gamename,int n);		//更多页最新新闻
	
	public List<News> ilistMoreNewsNum(String type,String gamename);		//一共多少条新闻
	public List<News> ilistMoreAllNum(String gamename);		//一共多少条最新新闻
	
}
