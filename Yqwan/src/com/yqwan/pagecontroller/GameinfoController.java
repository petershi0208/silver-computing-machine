package com.yqwan.pagecontroller;

import java.io.IOException;
import java.io.PrintWriter;
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

import alex.zhrenjie04.wordfilter.WordFilterUtil;

import com.alipay.util.UtilDate;
import com.yqwan.dao.ICommentDao;
import com.yqwan.dao.IGameInfoDao;
import com.yqwan.dao.IGameListDao;
import com.yqwan.domain.Comment;
import com.yqwan.domain.Gameinfo;
import com.yqwan.domain.Gamelist;

/**
 * 
 * @author PeterShi
 *
 */

@Controller("gameinfo")
public class GameinfoController {
	@Resource
	private IGameListDao gamelist;
	@Resource
	private ICommentDao commentdao;
	@Resource
	private IGameInfoDao gameinfodao;
	@Resource
	private IGameListDao gamelistdao;
	/**
	 * 跳转至开始游戏
	 * @param request
	 * @return
	 */
	@RequestMapping("/tostartguajigame.do")
	public String tostartguajigame(HttpServletRequest request){
		String url = request.getParameter("url");
		request.setAttribute("game_url", url);
		return "gameDJMY/gameStart";
	}
	
	/**
	 * 游戏评分
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/gamescore.do")
	public void gamescore(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println(1);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String score = request.getParameter("score");
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		Gamelist ga = gamelist.findbyname(gamename);
		double score2 = Double.parseDouble(ga.getScore());
		double score3 = 0;
		if(score!=null){
			int score1=Integer.parseInt(score);
			score1 = score1+3;
			if(score1 == 11){
				score1 = score1-1;
			}
			if(score1>=score2){
				score3 = score2*0.4+score1*0.6;
				
			}else{
				score3 = score2*0.6+score1*0.4;
			}
		}
		score3 = Math.round(score3*10);
		score3=score3/10;
		String score4 = String.valueOf(score3);
		Gamelist g = new Gamelist();
		g.setScore(score4);
		g.setGamename(gamename);
		gamelist.updatescore(g);
		out.print(score3);
	}

	
	/**
	 * 点赞加10访问量
	 */
	@RequestMapping("/givePerfect.do")
	public void givePerfect(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		clickmethod(gamename,10);
		Gamelist game = gamelist.findbyname(gamename);
		String click = game.getClick();
		out.print(click);
	}
	/**
	 * 点击量加
	 * @param gamename
	 */
	public void  clickmethod(String gamename,int num){
		String click = gamelist.click(gamename);		
		Gamelist list = new Gamelist();
		list.setGamename(gamename);
		click=Integer.parseInt(click)+num+"";
		list.setClick(click);
		gamelist.modifyClick(list);
	}
	
	/**
	 * 获得游戏评论（分页）
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/gameinfogetcomment.do")
	public void gameinfogetcomment(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
		int num1 = Integer.parseInt(request.getParameter("num"));	//用于分页
		int num = 3*(num1-1);											//每页3条
		Comment comment = new Comment();
		comment.setN(num);
		comment.setGamename(gamename);
		
		//获取评论条数
		List<Comment> list = commentdao.listComment(gamename);
		int maxnum = list.size();
		if(maxnum%3==0){
			maxnum = maxnum/3;
		}else{
			maxnum = maxnum/3+1;
		}	
		List<Comment> listcomment = commentdao.listAllComment(comment);
		JSONArray obj = JSONArray.fromObject(listcomment);				//java对象转json类型
		out.print(obj.toString()+"&&&"+maxnum+"&&&"+num1);	
	}
	
	/**
	 * 新增游戏评论
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/addgameinfocomment.do")
	public void addgameinfocomment(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gamename = URLDecoder.decode(request.getParameter("gamename1"),"UTF-8");
		String comment = URLDecoder.decode(request.getParameter("comment1"),"UTF-8");
		comment = WordFilterUtil.simpleFilter(comment, '*');	//过滤敏感词
		String userid = request.getParameter("userid");
		String date = UtilDate.getDateFormatter();
		String state="是";
		if(userid==""||userid==null){
			userid="匿名玩家";
		}
		int gameid = gamelist.getgameidbygamename(gamename);
		Comment comment1 = new Comment(gamename,gameid,userid,comment,date,state);
		commentdao.insert(comment1);			//插入评论数
		
		//评论数量加1
		Gameinfo gameinfo = gameinfodao.findBygameid(gamename);
		int num1 = gameinfo.getCommentnum();
		int new_num = com.yqwan.service.Gameinfo.plusnum(num1, 1);
		
		//修改评论数
		Gameinfo gameinfo1 = new Gameinfo();
		gameinfo1.setGamename(gamename);
		gameinfo1.setCommentnum(new_num);
		gameinfodao.updatecomment(gameinfo1);
		out.print("success");
	}
	
	/**
	 * 获得畅言的评论
	 * @param request
	 */
	@RequestMapping("getchangyancomment.do")
	public void getchangyancomment(HttpServletRequest request){
		String data = request.getParameter("data");
		data = data.trim();
		if(data!=null){
			JSONObject j =JSONObject.fromObject(data);
			String id = j.getString("sourceid");
			int gameid = Integer.parseInt(id);
			String gamename=null;
			if(199==gameid){
				gamename = "像素骑士团";
				gameid = gamelistdao.getgameidbygamename(gamename);
			}else if(1991==gameid){
				gamename = "宝石与爬塔";
				gameid = gamelistdao.getgameidbygamename(gamename);
			}else if(1980==gameid){
				gamename = "梦幻家园";
				gameid = gamelistdao.getgameidbygamename(gamename);
			}else if(1992==gameid){
				gamename = "魔卡幻想X";
				gameid = gamelistdao.getgameidbygamename(gamename);
			}else if(1993==gameid){
				gamename = "热血球球";
				gameid = gamelistdao.getgameidbygamename(gamename);
			}else{
				gamename = gamelistdao.getgamenamebygameid(gameid);
			}
			String comments = j.getString("comments");
			try {
				JSONArray  ja = JSONArray.fromObject(comments.trim());
				j = (JSONObject) ja.get(0);
				String content = j.getString("content");
				Long ctime = j.getLong("ctime");
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = df.format(ctime);
				String user = j.getString("user");
				j = JSONObject.fromObject(user);
				String userid = j.getString("nickname");
				Comment comment = new Comment(gamename,gameid,userid,content,date,"是");
				commentdao.insert(comment);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("json格式错误");
			}			
		}
	}
}
