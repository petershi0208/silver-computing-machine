package com.yqwan.pagecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.util.UtilDate;
import com.yqwan.dao.ICommentDao;
import com.yqwan.dao.IGameInfoDao;
import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.INewsDao;
import com.yqwan.dao.IThreeBannerDao;
import com.yqwan.domain.Comment;
import com.yqwan.domain.Gameinfo;
import com.yqwan.domain.Gamelist;
import com.yqwan.domain.News;
import com.yqwan.domain.Threebanner;
import com.yqwan.service.GameService;

/**
 * 
 * @author PeterShi
 *
 */

@Controller("index")
public class IndexController {
	@Resource
	private IGameListDao gamelistdao;
	@Resource
	private IGameInfoDao gameinfodao;
	@Resource
	private IThreeBannerDao threebannerdao;
	@Resource
	private ICommentDao commentdao;
	@Resource
	private INewsDao newsdao;
	
	int count=0;
	
	/**
	 * 跳转至首页
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toindex.do")
	public String toindex(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		List<Threebanner> threebanner = threebannerdao.listAll();	//首页banner
		List<News> news = newsdao.listNews();						//游戏新闻
		List<News> glnews = newsdao.getnews(0, "攻略");						//游戏新闻
		List<Gamelist> boutique = gamelistdao.listBoutiqueAll();	//精品游戏
		List<Comment> comment = commentdao.listAll();				//评论
//		List<Gameinfo> listrenew = gameinfodao.listByComment();		//更新列表（以评论多少排）
		List<Gamelist> listhot = gamelistdao.listhotAll();			//热门游戏
		List<Gamelist> listresou = gamelistdao.listresouAll();		//热搜游戏
		List<Gamelist> listnewgame = gamelistdao.listNewgame();		//新游戏27个
		List<Gamelist> neigou = gamelistdao.listneigouhAll();		//内购游戏,H5游戏
		
		List<Threebanner> newserverbanner = threebannerdao.newserverbanner();	//new server banner
		
		List<Gamelist> openservice = gamelistdao.listOpenService(); //开服列表
		request.setAttribute("openservice", openservice);
		request.setAttribute("newserverbanner", newserverbanner);	
		request.setAttribute("threebanner",threebanner);
		request.setAttribute("news", news);
		request.setAttribute("glnews", glnews);
		request.setAttribute("boutique", boutique);
		request.setAttribute("comment", comment);
//		request.setAttribute("listrenew", listrenew);
		request.setAttribute("listhot", listhot);
		request.setAttribute("listresou", listresou);
		request.setAttribute("listnewgame", listnewgame);
		request.setAttribute("neigou", neigou);
		return "newindex";
	}
	
	/**
	 * 首页热游or热搜排行榜
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/listrank.do")
	public void listrank(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String type = request.getParameter("type");
		String callback = request.getParameter("jsoncallback");
		JSONObject jo = new JSONObject();
		if("reyou".equals(type)){
			List<Gamelist> listhot = gamelistdao.listhotAll();
			jo = GameService.listToJson(listhot);
		}else if("resou".equals(type)){
			List<Gamelist> listresou = gamelistdao.listresouAll();
			jo = GameService.listToJson(listresou);
		}else{
			jo.put("code","1");
			jo.put("msg", "参数错误");
		}
		GameService.result(callback, out, jo.toString());
	}
	
	/**
	 * 首页游戏评论
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("indexcomment.do")
	public void indexcomment(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Comment> comment = commentdao.listAll();
		JSONArray obj = JSONArray.fromObject(comment);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 根据输入模糊游戏名字返回合适的游戏
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/returngame.do")
	public void returngame(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gameid = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		List<Gamelist> gamelist = gamelistdao.listselectgame(gameid);
		JSONArray obj = JSONArray.fromObject(gamelist);
		out.print(obj.toString());	
	}
	
	/**
	 * 头部搜索框判断游戏存在与否
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/headcheckgamename.do")
	public void headcheckgamename(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gameid = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		List<Gamelist> gamelist = gamelistdao.listselectgame(gameid);
		if(gamelist.isEmpty()){
			out.print("false");
		}		
	}
	
	/**
	 * 模糊查询游戏 跳更多页面
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/headselectmoregame.do")
	public String headselectmoregame(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		int num1 = Integer.parseInt(request.getParameter("num"));	//用于分页
		int num = 16*(num1-1);											//每页16个
		
			//获取一共多少游戏
			List<Gamelist> gamelist1 = gamelistdao.listallselectmoregame(gamename);
			int maxnum = gamelist1.size();
			if(maxnum%16==0){
				maxnum = maxnum/16;
			}else{
				maxnum = maxnum/16+1;
			}	
			request.setAttribute("maxnum", maxnum);
			
			Gamelist list1 = new Gamelist();								//封装成对象传入mybatis
			list1.setN(num);
			list1.setGamename(gamename);
			List<Gamelist> gamelist = gamelistdao.listselectmoregame(list1);
			JSONArray obj = JSONArray.fromObject(gamelist);				//java对象转json类型
			String list121 = obj.toString();
			request.setAttribute("list1", list121);
		
		
		request.setAttribute("gametype", gamename);
		request.setAttribute("from", "搜索");
		request.setAttribute("page", num1);
		return "moreGame";
	}
	
	
	
	
	/**
	 * 头部三个横幅
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/indexthreebanner.do")
	public void threebanner(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Threebanner> threebanner = threebannerdao.listAll();
		count++;
		System.out.println("=================一起玩访问次数"+count);
		
		JSONArray obj = JSONArray.fromObject(threebanner);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 新游榜排行
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/indexnewtop.do")
	public void indexnewtop(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Gamelist> gamelist = gamelistdao.listnewAll();
		JSONArray obj = JSONArray.fromObject(gamelist);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 热销榜排行
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/indexhottop.do")
	public void indexhottop(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Gamelist> gamelist = gamelistdao.listhotAll();
		JSONArray obj = JSONArray.fromObject(gamelist);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 首页推荐应用4个
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/indexrecommend.do")
	public void indexrecommend(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Gamelist> gamelist = gamelistdao.listrecommendAll();
		JSONArray obj = JSONArray.fromObject(gamelist);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 首页精品游戏6个
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/indexboutique.do")
	public void indexboutique(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Gamelist> gamelist = gamelistdao.listBoutiqueAll();
		JSONArray obj = JSONArray.fromObject(gamelist);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 点击更多跳转更多游戏页面（带分页）新游戏，精品游戏，单机类，网络游戏
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/moregame.do")
	public String moregame(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String gametype = URLDecoder.decode(request.getParameter("gametype"),"UTF-8");
		int num1 = Integer.parseInt(request.getParameter("num"));	//用于分页
		int num = 16*(num1-1);											//每页16个
		Gamelist list = new Gamelist();								//封装成对象传入mybatis
		list.setN(num);
		list.setGametype(gametype);
		
		//判断是新游戏还是其他两种游戏
		if(gametype.equals("新游戏")){
			//获取一共多少新游戏
			List<Gamelist> gamelist1 = gamelistdao.listAllNewgameMore();
			int maxnum = gamelist1.size();
			if(maxnum%16==0){
				maxnum = maxnum/16;
			}else{
				maxnum = maxnum/16+1;
			}	
			request.setAttribute("maxnum", maxnum);
			
			List<Gamelist> gamelist = gamelistdao.listNewgameMore(num);
			JSONArray obj = JSONArray.fromObject(gamelist);				//java对象转json类型
			String list1 = obj.toString();
			request.setAttribute("list1", list1);	
		}else if(gametype.equals("精品游戏")){
			//获取一共多少精品游戏
			List<Gamelist> gamelist1 = gamelistdao.listBoutiqueMoreAllGame();
			int maxnum = gamelist1.size();
			if(maxnum%16==0){
				maxnum = maxnum/16;
			}else{
				maxnum = maxnum/16+1;
			}
			request.setAttribute("maxnum", maxnum);
			
			List<Gamelist> gamelist = gamelistdao.listBoutiqueMoreAll(num);
			JSONArray obj = JSONArray.fromObject(gamelist);				//java对象转json类型
			String list1 = obj.toString();
			request.setAttribute("list1", list1);
		}else if(gametype.equals("热门游戏")){
			//获取一共多少热门游戏 和新游戏一样
			List<Gamelist> gamelist1 = gamelistdao.listAllNewgameMore();
			int maxnum = gamelist1.size();
			if(maxnum%16==0){
				maxnum = maxnum/16;
			}else{
				maxnum = maxnum/16+1;
			}
			request.setAttribute("maxnum", maxnum);
			
			List<Gamelist> gamelist = gamelistdao.listhotAllGame(num);
			JSONArray obj = JSONArray.fromObject(gamelist);				//java对象转json类型
			String list1 = obj.toString();
			request.setAttribute("list1", list1);
		}else if(gametype.equals("网页游戏")){
			//获取一共多少热门游戏 和新游戏一样
			List<Gamelist> gamelist1 = gamelistdao.listAllyeyou();
			int maxnum = gamelist1.size();
			if(maxnum%16==0){
				maxnum = maxnum/16;
			}else{
				maxnum = maxnum/16+1;
			}
			request.setAttribute("maxnum", maxnum);
			
			List<Gamelist> gamelist = gamelistdao.listyeyouMore(num);
			JSONArray obj = JSONArray.fromObject(gamelist);				//java对象转json类型
			String list1 = obj.toString();
			request.setAttribute("list1", list1);
		}else{
			//获取一共多少单机网游
			List<Gamelist> gamelist1 = gamelistdao.listAllMoreGame(gametype);
			int maxnum = gamelist1.size();
			if(maxnum%16==0){
				maxnum = maxnum/16;
			}else{
				maxnum = maxnum/16+1;
			}
			request.setAttribute("maxnum", maxnum);
			
			List<Gamelist> gamelist = gamelistdao.listAllMore(list);
			JSONArray obj = JSONArray.fromObject(gamelist);				//java对象转json类型
			String list1 = obj.toString();
			request.setAttribute("list1", list1);
		}
		
		request.setAttribute("gametype", gametype);
		request.setAttribute("from", "<a href='http://www.199y.com'>首页</a>");
		request.setAttribute("page", num1);
		return "moreGame";
	}
	
	/**
	 * 点击游戏进入游戏详情页
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/gameinfo.do")
	public String gameinfo(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String gameid = URLDecoder.decode(request.getParameter("gameid"),"UTF-8");
		gameid=gamelistdao.getgamenamebygameid(Integer.parseInt(gameid));
//		String gameid = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
System.out.println("当前进入的游戏名字为："+gameid);
		clickmethod(gameid,1);		//点击量加1

		Gameinfo gameinfo = gameinfodao.findBygameid(gameid);
		if("内购游戏".equals(gameinfo.getGametype())||"H5游戏".equals(gameinfo.getGametype())){			//内购，H5游戏跳专题页
			Gamelist gl = gamelistdao.findbyname(gameid);
			String date = gl.getDate();
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Long gamedate = df.parse(date).getTime();
			Long nowdate = df.parse(UtilDate.getDateFormatter()).getTime();
			if(nowdate<gamedate){
				return "lookforward";
			}else{
				return "redirect:"+gameinfo.getGameurl();
			}			
		}
		gameinfo = someChanges(gameinfo);
		
		//游戏详情页图片
		String picture = gameinfodao.listpicAll(gameid);
		String[] arr = picture.split(","); //字符串转化为数组
		
		//游戏详情页中间游戏循环
		List<Gamelist> gamelist = gamelistdao.listgameinfo();
		request.setAttribute("gamelist", gamelist);
		//获得评论条数
		List<Comment> list = commentdao.listComment(gameid);
		int commentnum = list.size();
		
		request.setAttribute("commentnum", commentnum);
		request.setAttribute("gameinfo", gameinfo);
		request.setAttribute("picture", arr);
		return "gameinfo";
	}
	
	/**
	 * 用于修改取出的参数
	 * @param gameinfo
	 * @return
	 */
	private Gameinfo someChanges(Gameinfo gameinfo) {
		String placetype = gameinfo.getPlacetype();
		if(placetype.equals("anzhuo.jpg")){
			gameinfo.setPlacetype("安卓放置");
		}else if(placetype.equals("pc.jpg")){
			gameinfo.setPlacetype("电脑放置");
		}else{
			gameinfo.setPlacetype("苹果放置");
		}
		String isBoutique = gameinfo.getIsBoutique();
		if(isBoutique.equals("是")){
			gameinfo.setIsBoutique("精品游戏");
		}else{
			gameinfo.setIsBoutique("推荐游戏");
		}
		gameinfo.setCode(gameinfo.getCode().toLowerCase());
		return gameinfo;
	}

	/**
	 * 主页中间新游戏三个
	 * @param request
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/indexthree.do")
	public void index(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gametype = URLDecoder.decode(request.getParameter("gametype"),"UTF-8");
		//判断是新游戏还是单机或者网游
		if(gametype.equals("新游戏")){
			List<Gamelist> gamelist = gamelistdao.listNewgame();
			JSONArray obj = JSONArray.fromObject(gamelist);
			String list = obj.toString();
			out.print(list);
		}else if(gametype.equals("热门游戏")){
			List<Gamelist> gamelist = gamelistdao.listhotAll();
			JSONArray obj = JSONArray.fromObject(gamelist);
			String list = obj.toString();
			out.print(list);
		}else if(gametype.equals("网页游戏")){
			List<Gamelist> gamelist = gamelistdao.listyeyou();
			JSONArray obj = JSONArray.fromObject(gamelist);
			String list = obj.toString();
			out.print(list);
		}else{
			List<Gamelist> gamelist = gamelistdao.listAll(gametype);
			JSONArray obj = JSONArray.fromObject(gamelist);
			String list = obj.toString();
			out.print(list);
		}
	}
	
	/**
	 * 点击量加
	 * @param gamename
	 */
	public void  clickmethod(String gamename,int num){
		String click = gamelistdao.click(gamename);		
		Gamelist list = new Gamelist();
		list.setGamename(gamename);
		click=Integer.parseInt(click)+num+"";
		list.setClick(click);
		gamelistdao.modifyClick(list);
	}
}
