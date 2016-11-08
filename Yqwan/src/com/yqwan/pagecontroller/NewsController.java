package com.yqwan.pagecontroller;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.IGiftInfoDao;
import com.yqwan.dao.INewsDao;
import com.yqwan.domain.Gamelist;
import com.yqwan.domain.Giftinfo;
import com.yqwan.domain.News;
import com.yqwan.service.GameService;

@Controller("yqwannewscontroller")
public class NewsController {
	@Resource
	private INewsDao newsdao;
	@Resource
	private IGameListDao gamelistdao;
	@Resource
	private IGiftInfoDao giftinfodao;
	
	/**
	 * 专题游戏登录页获得更多新闻
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/gamegznews.do")
	public void gamegznews(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-javascript;charset=utf-8");
		PrintWriter out = response.getWriter();		
		List<News> news=null;
		String type = URLDecoder.decode(request.getParameter("type"),"UTF-8");
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		if(type.equals("最新")){
			news = newsdao.ilistAll(gamename);		
		}else{
			news = newsdao.ilistNews(type,gamename);
		}	
		JSONArray obj = JSONArray.fromObject(news);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 获得新闻详情
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/newsinfo.do")
	public String newsinfo(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String newsid = request.getParameter("newsid");
		News news = newsdao.getnewsinfo(newsid);
		request.setAttribute("newsinfo", news);
		
		List<Gamelist> bontique = gamelistdao.listBoutiqueAll();
		request.setAttribute("bontique", bontique);
		return "newsinfo";
	}
	
	/**
	 * 新闻页礼包
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/toNews.do")
	public String toNews(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		List<News> news = newsdao.getnews(0,"新闻");
		List<Gamelist> bontique = gamelistdao.listBoutiqueAll();
		List<Giftinfo> giftinfo = giftinfodao.paging("",0,3);
		
		request.setAttribute("bontique", bontique);
		request.setAttribute("news", news);
		request.setAttribute("gift", giftinfo);
		return "news";
	}
	
	/**
	 * 获得更多新闻
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/getmorenews.do")
	public void getmorenews(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String callback = request.getParameter("jsoncallback");
		String page = request.getParameter("page");
		String pagesize = request.getParameter("pagesize");
		String type = URLDecoder.decode(request.getParameter("type"),"utf-8");	
		if(page!=null && pagesize!=null && type!=null){
			int p = (Integer.parseInt(page)-1)*Integer.parseInt(pagesize);
			List<News> list = newsdao.getnews(p,type);
			JSONObject jo = GameService.listToJson(list);
			GameService.result(callback, out, jo.toString());
		}		
	}
}
