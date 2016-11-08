package com.yqwan.ht.controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.util.UtilDate;
import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.INewsDao;
import com.yqwan.domain.Gamelist;
import com.yqwan.domain.News;
import com.yqwan.service.PictureUploadDemo;



@Controller
public class NewsinfoController {
	@Resource
	private INewsDao newsdao;
	@Resource
	private IGameListDao gamelistdao;
	
	/**
	 * 删除新闻
	 * @param request
	 * @return
	 */
	@RequestMapping("/deletenews.do")
	public String deletenews(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		newsdao.delete(id);
		return "redirect:/administrator/newslist.do";
	}
	
	/**
	 * 标题查询
	 */
	@RequestMapping("/administrator/newslist.do")
	public String newslist(HttpServletRequest request) throws UnsupportedEncodingException{
		String curpage = request.getParameter("page");
		String title = request.getParameter("title");
		if(title!=null && title!=""){
			title = URLDecoder.decode(title,"UTF-8");
		}
		if(curpage!=null && curpage!=""){
			int currentpage=(Integer.parseInt(curpage)-1)*20;
//			String cur = currentpage+"";
			List<News> news = newsdao.paging(title, currentpage, 20);
			request.setAttribute("news", news);
		}else{
			List<News> news = newsdao.paging(title, 0, 20);
			request.setAttribute("news", news);
		}
		
		int count = newsdao.newscount(title);
		request.setAttribute("title", title);
		request.setAttribute("count", count);
		return "administratorht/template/Newsinfo/Newsinfo";
	}
	@RequestMapping("/administrat/addnews.do")
	public String addnewsdo(HttpServletRequest request){
		List<Gamelist> gamelist = gamelistdao.listgamename();
		request.setAttribute("gamelist", gamelist);
		return "administratorht/template/Newsinfo/Addnews";
	}
	/**
	 * 添加
	 * @param request
	 * @return
	 */
	@RequestMapping("/addnews.do")
	public void addnews(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date = sdf.format(now);
		String title =  URLDecoder.decode(request.getParameter("title"),"UTF-8");
		String content =  URLDecoder.decode(request.getParameter("content"),"UTF-8");
		String origin =  URLDecoder.decode(request.getParameter("origin"),"UTF-8");
		String author = URLDecoder.decode(request.getParameter("author"),"UTF-8");
		String description = URLDecoder.decode(request.getParameter("description"),"UTF-8");
		String indexpicture = URLDecoder.decode(request.getParameter("indexpicture"),"UTF-8");
		String type = URLDecoder.decode(request.getParameter("type"),"UTF-8");
		//String state = URLDecoder.decode(request.getParameter("state"),"UTF-8");
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		int newsid = newsdao.newsid()+1;
		News news = new News();
		news.setNewsid(newsid+"");
		news.setDescription(description);
		news.setIndexpicture(indexpicture);
		news.setOrigin(origin);
		news.setTitle(title);
		news.setContent(content);
		news.setAuthor(author);
		news.setDate(date);
		news.setGamename(gamename);
		news.setState("是");
		news.setType(type);
		newsdao.insert(news);
		out.print("添加成功");
	}
	/**
	 * 单查
	 * @param request
	 * @return
	 */
	@RequestMapping("/singlenews.do")
	public String singlenews(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		News news = newsdao.findById(id);
		request.setAttribute("news", news);
		List<Gamelist> gamelist = gamelistdao.listgamename();
		request.setAttribute("gamelist", gamelist);
		return "administratorht/template/Newsinfo/updatenews";
	}
	/**
	 * 修改
	 * @param request
	 * @return
	 */
	@RequestMapping("/updatenews.do")
	public void updatenews(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String title =  URLDecoder.decode(request.getParameter("title"),"UTF-8");
		String content =  URLDecoder.decode(request.getParameter("content"),"UTF-8");
		String origin =  URLDecoder.decode(request.getParameter("origin"),"UTF-8");
		String author = URLDecoder.decode(request.getParameter("author"),"UTF-8");
		String indexpicture = request.getParameter("indexpicture");
//		String date = URLDecoder.decode(request.getParameter("date"),"UTF-8");
		String type = URLDecoder.decode(request.getParameter("type"),"UTF-8");
//		String state = URLDecoder.decode(request.getParameter("state"),"UTF-8");
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		if(indexpicture!=null && indexpicture!=""){
			indexpicture = URLDecoder.decode(indexpicture,"UTF-8");
		}
		String description = URLDecoder.decode(request.getParameter("description"),"UTF-8");
		News news = new News();
		news.setId(id);
		news.setDescription(description);
		news.setIndexpicture(indexpicture);
		news.setOrigin(origin);
		news.setTitle(title);
		news.setContent(content);
		news.setAuthor(author);
//		news.setDate(date);
		news.setGamename(gamename);
		news.setState("是");
		news.setType(type);
		newsdao.update(news);
		out.print("修改成功");
	}
	/**
	 * 图片上传
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/administrat/fileload.do")
	public void fileload(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		List<String> filelist = new ArrayList<String>();	//用于存放上传的文件
		Map<String,String> map =new HashMap<String, String>();
		PictureUploadDemo.pictureupload("d://AllPicture//yqwan//news//upload",filelist,map,request);
		String picname = filelist.get(0);
		StringBuffer url = request.getRequestURL();  
		String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
		picname = tempContextUrl+"picture/yqwan/news/upload/"+UtilDate.getMonth()+"/"+picname;
		
		
		out.print(picname);
//		//String path = request.getSession().getServletContext().getRealPath("/administratorht/images");	//图片上传地址
//		//上传图片
//		PictureUpload a = new PictureUpload();
//		a.pictureupload(request, path, map, filelist);
	}
}
