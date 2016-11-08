package com.yqwan.ht.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.ICommentDao;
import com.yqwan.dao.IGameInfoDao;
import com.yqwan.domain.Comment;
import com.yqwan.domain.Gameinfo;

@Controller
public class CommentController {
	@Resource
	private ICommentDao commentdao;
	@Resource
	private IGameInfoDao gameinfodao;
	/**
	 * 分页查询分区
	 * 根据游戏名和全部查询
	 */
	@RequestMapping("/administrator/comment.do")
	public String comment(HttpServletRequest request) throws UnsupportedEncodingException{
		String curpage = request.getParameter("page");		//获取当前页
		String gamename1 = request.getParameter("gamename");//获取游戏名
		String gamename="";
		if(gamename1!=null && gamename1!=""){
			gamename = URLDecoder.decode(gamename1,"UTF-8");
		}
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			List<Comment> comment = commentdao.paging(gamename,(currentpage-1)*10,10);//分页查询
			request.setAttribute("comment", comment);
		}else{
			List<Comment> comment = commentdao.paging(null,0,10);
			request.setAttribute("comment", comment);
		}
		int count = commentdao.count(gamename);		//总页数
		request.setAttribute("gamename", gamename);
		request.setAttribute("count", count);
		return "administratorht/template/comment/comment";
	}
	/**
	 * 修改状态为否
	 * 
	 */
	@RequestMapping("/administrator/updatecomment.do")
	public String updatecomment(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		Comment comment = commentdao.findById(id);	//根据ID获得游戏名字
		if("是".equals(comment.getState())){
			commentdao.update(id);
			
			//评论条数减1
			
			Gameinfo gameinfo = gameinfodao.findBygameid(comment.getGamename());	//根据游戏名获得游戏评论数
			int num1 = gameinfo.getCommentnum();
			int new_num = com.yqwan.service.Gameinfo.minusnum(num1, 1);
			
			//修改评论数
			Gameinfo gameinfo1 = new Gameinfo();
			gameinfo1.setGamename(comment.getGamename());
			gameinfo1.setCommentnum(new_num);
			gameinfodao.updatecomment(gameinfo1);
		}
		return "redirect:comment.do";
	}
}
