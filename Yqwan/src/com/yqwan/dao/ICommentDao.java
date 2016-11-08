package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.Comment;

@Repository("comment")
public interface ICommentDao {
	public List<Comment> listAll();		//首页6条评论
	public List<Comment> listAllComment(Comment comment);		//获得评论所有记录（分页)
	public List<Comment> listComment(String gamename);			//获得某游戏的所有评论
	public void insert(Comment comment);	//插入游戏评论
	
	public int update(int id);
	public List<Comment> paging(String gamename,int currentpage,int pagesize);
	public int count(String gamename);
	
	public Comment findById(int id);
}
