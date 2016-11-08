package com.yqwan.news.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.INewsDao;
import com.yqwan.domain.News;

/**
 * 对外提供查询新闻的接口
 * @author Administrator
 *
 */
@Controller("inewscontroller")
public class INewsController {
	@Resource
	private INewsDao newsdao;
	
	/**
	 * 专题页首页列出新闻
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping("/ilistnews.do")
	public void ilistnews(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		String type = new String(request.getParameter("type").getBytes("ISO-8859-1"),"UTF-8");
		String gamename = new String(request.getParameter("gamename").getBytes("ISO-8859-1"),"UTF-8");
		response.setContentType("application/x-javascript;charset=utf-8");
		PrintWriter out = response.getWriter();		
		List<News> news=null;
		if(type.equals("最新")){
			news = newsdao.ilistAll(gamename);		
		}else{
			news = newsdao.ilistNews(type,gamename);
		}	
		JSONArray obj = JSONArray.fromObject(news);
		JSONObject JO = new JSONObject();
		JO.put("list", obj);
		JO.put("code", 0);
		String list = JO.toString();
		out.write(list);
	}
	/**
	 * 跳转更多
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/imorenews.do")
	public void imorenews(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String type = new String(request.getParameter("type").getBytes("ISO-8859-1"),"UTF-8");
		String num11 = new String(request.getParameter("num").getBytes("ISO-8859-1"),"UTF-8");;	//用于分页
		String gamename = new String(request.getParameter("gamename").getBytes("ISO-8859-1"),"UTF-8");
		int num1 = Integer.parseInt(num11);
		int num = 12*(num1-1);											//每页12个	
		List<News> listnews = null;
		List<News> n = null;
		int maxnum =0;
		if(type.equals("最新")){
			n = newsdao.ilistMoreAllNum(gamename);			//获取一共多少条数据			
			listnews = newsdao.ilistMoreAll(gamename,num);
		}else{
			n = newsdao.ilistMoreNewsNum(type,gamename);			//获取一共多少条数据
			News news = new News();
			news.setN(num);
			news.setType(type);
			news.setGamename(gamename);
			listnews = newsdao.ilistMoreNews(news);
		}
		maxnum = n.size();
		if(maxnum%12==0){
			maxnum = maxnum/12;
		}else{
			maxnum = maxnum/12+1;
		}		
		response.setContentType("application/x-javascript;charset=utf-8");
		PrintWriter out = response.getWriter();	
		JSONArray obj = JSONArray.fromObject(listnews);
		JSONObject jo = new JSONObject();
		jo.put("code", 0);
		jo.put("listnews", obj);
		jo.put("maxnum", maxnum);
		String back = jo.toString();
		out.print(back);
	}
	
	/**
	 * 跳转新闻详情
	 * @param request
	 * @return
	 */
	@RequestMapping("/inewsinfo.do")
	public void inewsinfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String newsid = request.getParameter("newsid");
		News news = newsdao.getnewsinfo(newsid);
		JSONObject back = JSONObject.fromObject(news);
		response.setContentType("application/x-javascript;charset=utf-8");
		PrintWriter out = response.getWriter();	
		out.print(back);
	}
}
