package com.yqwan.dao;

import java.util.List;

import com.yqwan.domain.Promoterrecord;

public interface IPromoterrecordDao {
	/**
	 * 通过用户名查询
	 * @param promoterrecord
	 * @return
	 */
	public Promoterrecord findByUserid(Promoterrecord promoterrecord);
	
	/**
	 * 更新当月推广人数
	 * @param promoterrecord
	 */
	public void updateperson(Promoterrecord promoterrecord);
	
	/**
	 * 新增当月记录
	 * @param promoterrecord
	 */
	public void addrecord(Promoterrecord promoterrecord);
	
	/**
	 * 更新当月推广金额
	 * @param promoterrecord
	 */
	public void updatemoney(Promoterrecord promoterrecord);

	/**
	 * 获得该用户历史记录总和
	 * @param userid
	 * @return
	 */
	public Promoterrecord getAllRecord(String userid);
	
	/**
	 * 列出用户每月推广的记录
	 * @param userid
	 * @return
	 */
	public List<Promoterrecord> listallrecommend(String userid);
	
	
	/**
	 * 分页条件查询
	 * @param userid 推荐人用户名
	 * @param date	时间
	 * @param currentpage	页
	 * @param pagesize		页
	 * @return
	 */
	public List<Promoterrecord> paging(String userid,String date,int currentpage,int pagesize);
	/**
	 * 条数
	 * @param userid
	 * @param date
	 * @return
	 */
	public int count(String userid,String date);
	/**
	 * 分页总和平均数查询
	 * @param userid
	 * @param currentpage
	 * @param pagesize
	 * @return
	 */
	public List<Promoterrecord> total(String userid,int currentpage,int pagesize);
	
	/**
	 * 条数
	 * @param userid
	 * @param date
	 * @return
	 */
	public int totalcount(String userid);
	
	/**
	 * 修改
	 * @param promoterrecord
	 * @return
	 */
	public int update(Promoterrecord promoterrecord);
	
	/**
	 * 通过时间查询集合
	 * @param date
	 * @return
	 */
	public List<Promoterrecord> findByDate(String date);
	
}
