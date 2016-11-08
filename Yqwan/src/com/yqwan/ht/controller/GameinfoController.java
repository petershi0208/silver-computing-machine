package com.yqwan.ht.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
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
import com.yqwan.dao.IGameDistrictDao;
import com.yqwan.dao.IGameInfoDao;
import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.IRecordDao;
import com.yqwan.domain.Gameinfo;
import com.yqwan.domain.Gamelist;
import com.yqwan.domain.Gamedistrict;
import com.yqwan.domain.Record;
import com.yqwan.service.PictureUpload;

@Controller
public class GameinfoController {
	@Resource
	private IGameInfoDao gameinfodao;
	@Resource
	private IGameListDao gamelistdao;
	@Resource
	private IGameDistrictDao gamedistrictdao;
	@Resource
	private IRecordDao recorddao;
	/**
	 * 分页查询分区
	 * 根据游戏名和全部查询
	 */
	@RequestMapping("/administrator/gamedistrict.do")
	public String gamedistrict(HttpServletRequest request) throws UnsupportedEncodingException{
		String curpage = request.getParameter("page");		//获取当前页
		String gamename1 = request.getParameter("gamename");//获取游戏名
		String gamename="";
		if(gamename1!=null && gamename1!=""){
			gamename = URLDecoder.decode(gamename1,"UTF-8");
		}
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			List<Gamedistrict> gamedistrict = gamedistrictdao.paging(gamename,(currentpage-1)*10,10);//分页查询
			request.setAttribute("gamedistrict", gamedistrict);
		}else{
			List<Gamedistrict> gamedistrict = gamedistrictdao.paging(gamename,0,10);
			request.setAttribute("gamedistrict", gamedistrict);
		}
		int count = gamedistrictdao.count(gamename);		//总页数
		request.setAttribute("gamename", gamename);
		request.setAttribute("count", count);
		return "administratorht/template/gameinfo/gamedistrict";
	}
	/**
	 * 查询单个区
	 */
	@RequestMapping("/administrator/singledistrict.do")
	public String singledistrict(HttpServletRequest request){
		String aid = request.getParameter("id");
		if(aid!=null){
			int id=Integer.parseInt(aid);
			Gamedistrict gamedistrict = gamedistrictdao.findbyid(id);
			request.setAttribute("district", gamedistrict);
		}
		List<Gameinfo> gameinfo = gameinfodao.all();
		request.setAttribute("gameinfo",gameinfo);
		return "administratorht/template/gameinfo/updategamedistrict";
	}
	/**
	 * 查询全部游戏名
	 */
	@RequestMapping("/administrator/adddistrict.do")
	public String adddistrictjsp(HttpServletRequest request){
		List<Gamelist> gameinfo = gamelistdao.listgamename();			//所有游戏改为所有内购游戏
		request.setAttribute("gameinfo",gameinfo);
		return "administratorht/template/gameinfo/addgamedistrict";
	}
	/**
	 * 添加分区
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/administrator/adddistrict1.do")
	public String adddistrict(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String gamename = request.getParameter("gamename");
		String gameregion = request.getParameter("gameregion");
		String serverid = request.getParameter("serverid");
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		String date = date1+" "+date2;
		Gamelist gamelist = gamelistdao.findbyname(gamename);
		int gameid = gamelist.getGameid();
		
		Gamedistrict district = new Gamedistrict();
		district.setGamename(gamename);
		district.setGameid(gameid);
		district.setGameregion(gameregion);
		district.setServerid(Integer.parseInt(serverid));
		district.setDate(date);
		district.setClick("0");
		gamedistrictdao.add(district);
//		if(ret==0){
//			System.out.println("添加分区失败");
//		}else{
//			System.out.println("添加分区成功");
//		}
		return "redirect:gamedistrict.do";
	}
	/**
	 * 修改区
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/administrator/updatedistrict.do")
	public String updatedistrict(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String gamename = request.getParameter("gamename");
		String gameregion = request.getParameter("gameregion");
		String serverid = request.getParameter("serverid");
		Gamedistrict district = new Gamedistrict();
		district.setId(id);
		district.setGamename(gamename);
		district.setGameregion(gameregion);
		district.setServerid(Integer.parseInt(serverid));
		gamedistrictdao.update(district);
//		if(ret==0){
//			System.out.println("修改分区失败");
//		}else{
//			System.out.println("修改分区成功");
//		}
		return "redirect:gamedistrict.do";
	}
	/**
	 * 删除分区
	 */
	@RequestMapping("/administrator/deletedistrict.do")
	public String deletegamedistrict(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		gamedistrictdao.delete(id);
//		if(ret==0){
//			System.out.println("删除分区失败");
//		}else{
//			System.out.println("删除分区成功");
//		}
		return "redirect:gamedistrict.do";
	}
	/**
	 * 分页查询游戏信息
	 * 查询所有
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/administrator/gameinfo.do")
	public String gameinfo(HttpServletRequest request) throws UnsupportedEncodingException{
		String curpage = request.getParameter("page");		//获取当前页
		String gamename1 = request.getParameter("gamename");//获取游戏名
		String gamename="";
		if(gamename1!=null && gamename1!=""){
			gamename = URLDecoder.decode(gamename1,"UTF-8");
		}
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			List<Gameinfo> gameinfo = gameinfodao.paging(gamename,(currentpage-1)*10,10);//分页查询
			request.setAttribute("gameinfo", gameinfo);
		}else{
			List<Gameinfo> gameinfo = gameinfodao.paging(gamename,0,10);
			request.setAttribute("gameinfo", gameinfo);
		}
		int count = gameinfodao.count(gamename);		//总页数
		request.setAttribute("gamename", gamename);
		request.setAttribute("count", count);
		return "administratorht/template/gameinfo/gameinfo";
	}
	/**
	 * 分页查询游戏列表
	 * 查询所有
	 */
	@RequestMapping("/administrator/gamelist.do")
	public String gamelist(HttpServletRequest request) throws UnsupportedEncodingException{
		String curpage = request.getParameter("page");		//获取当前页
		String gamename1 = request.getParameter("gamename");//获取游戏名
		String gamename="";
		if(gamename1!=null && gamename1!=""){
			gamename = URLDecoder.decode(gamename1,"UTF-8");
		}
		if(curpage==null || curpage==""){
			List<Gamelist> gamelist = gamelistdao.paging(gamename,0,10);
			request.setAttribute("gamelist", gamelist);
		}else{
			int currentpage=Integer.parseInt(curpage);
			List<Gamelist> gamelist = gamelistdao.paging(gamename,(currentpage-1)*10,10);//分页查询
			request.setAttribute("gamelist", gamelist);
		}
		int count = gamelistdao.count(gamename);		//总页数
		
		List<Record> record = recorddao.listRecord();
		request.setAttribute("record", record);
		request.setAttribute("gamename", gamename);
		request.setAttribute("count", count);
		return "administratorht/template/gameinfo/gamelist";
	}	
	/**
	 * 添加游戏信息
	 * 添加所有
	 */
	@RequestMapping("/administrator/addgame.do")
	public String addgame(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		request.setCharacterEncoding("utf-8");
		List<String> filelist = new ArrayList<String>();		//用于存放上传的文件
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
		//上传图片
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, filelist);
		   
	    String picture2 = filelist.toString();
	    String picture = picture2.substring(1,picture2.length()-1);		//图片
		String gamename = (String) map.get("gamename");					//游戏名
		Gameinfo gameinfoinfo = gameinfodao.findbyname(gamename);
		if(gameinfoinfo==null){
			//Gameinfo获取数据
			String detaildescripe = (String) map.get("detaildescripe");		//详细描述
			//String picture = request.getParameter("picture");
			String gamesize = (String) map.get("gamesize");					//游戏大小
			String howstart = (String) map.get("howstart");					//如何开始
			String gamegoal = (String) map.get("gamegoal");					//游戏目标
			String gameurl = (String) map.get("gameurl");					//游戏地址
			String code = (String) map.get("code");
			
			//Gamelist 获取数据
			String gametype = (String) map.get("gametype");					//游戏类型
			String descrip = (String) map.get("descrip");					//描述
			String placetype = (String) map.get("placetype");				//放置类型
			String roletype = (String) map.get("roletype");					//角色类型
			String score = (String) map.get("score");						//游戏评分
			String mainpicture = (String) map.get("mainpicture");			//主图片
			String toppicture = (String) map.get("toppicture");				//排行图片
			String indexpicture = (String) map.get("indexpicture");			//首页图片
			String isBoutique =(String)  map.get("isBoutique");				//是否精品
			String isrecommend = (String) map.get("isrecommend");			//是否推荐
			Date now = new Date();
			SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
			String date = form.format(now);
			//gamedistrict 获取数据
			String gameregion = (String) map.get("gameregion");
			String serverid = (String) map.get("serverid");
			
			int gameid = gameinfodao.getlastgameid();	//获取上一个游戏的ID	
			gameid=gameid+1;
			//gamedistrict 添加数据
			String date1 = (String) map.get("date1");
			String date2 = (String) map.get("date2");
			String date3 = date1+" "+date2;
			Gamedistrict gd = new Gamedistrict();
			gd.setDate(date3);
			gd.setGameid(gameid);
			gd.setClick("0");
			gd.setGamename(gamename);
			gd.setGameregion(gameregion);
			gd.setServerid(Integer.parseInt(serverid));
			gamedistrictdao.add(gd);
//			if(ret3==0){
//				System.out.println("添加分区失败");
//			}else{
//				System.out.println("添加分区成功");
//			}
			

			//Gameinfo 表添加数据
			Gameinfo gi = new Gameinfo();
			gi.setGamename(gamename);				//游戏名
			gi.setGameid(gameid);
			gi.setDetaildescripe(detaildescripe);	//详细描述
			gi.setPicture(picture);					//图片
			gi.setGamesize(gamesize);				//游戏大小
			gi.setCommentnum(0);					//评论数量
			gi.setHowstart(howstart);				//如何开始
			gi.setGamegoal(gamegoal);				//游戏目标
			gi.setGameurl(gameurl);					//游戏地址
			gi.setCode(code);
			gameinfodao.add(gi);		
			Gameinfo gamei = gameinfodao.findbyname(gamename);
			int id = gamei.getId();
			//GameList 添加数据
			Gamelist gl = new Gamelist();
				if(gamei!=null){
				gl.setId(id);
				gl.setGamename(gamename);			//游戏名
				gl.setGameid(gameid);
				gl.setGametype(gametype);			//游戏类型
				gl.setDescrip(descrip);				//描述
				gl.setPlacetype(placetype);			//放置类型
				gl.setRoletype(roletype);			//角色类型
				gl.setMainpicture(mainpicture);		//主图片
				gl.setToppicture(toppicture);		//排行图片
				gl.setIndexpicture(indexpicture);	//首页图片
				gl.setIsBoutique(isBoutique);		//是否精品
				gl.setIsrecommend(isrecommend);		//是否推荐
				int num = (int)(Math.random()*200)+100;
				gl.setClick(num+"");					//点击量
				gl.setDate(date3);					//时间
				gl.setScore(score);
				int ret2 = gamelistdao.add(gl);
				if(ret2!=1){
					gameinfodao.delete(id);
				}
			}
			
//			SimpleDateFormat form2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			if(ret1==0){
//				System.out.println("添加游戏信息失败");
//			}else{
//				System.out.println("添加游戏信息成功");
//			}
//			if(ret2==0){
//				System.out.println("添加游戏列表失败");
//			}else{
//				System.out.println("添加游戏列表成功");
//			}
			return "redirect:gamelist.do";
		}else{
			return "redirect:administrator/gamelist.do?gamename=&page=1";
		}		
	}
	/**
	 * 查询单个游戏信息
	 * 
	 */
	@RequestMapping("/administrator/singlegame.do")
	public String singlegame(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		Gameinfo singlegameinfo = gameinfodao.findbyid(id);
		Gamelist singlegamelist = gamelistdao.findbyid(id);
		request.setAttribute("singlegameinfo", singlegameinfo);
		request.setAttribute("singlegamelist", singlegamelist);
		return "administratorht/template/gameinfo/updategame";
	}
	
	
	/**
	 * 修改游戏信息
	 * 添加所有
	 */
	@RequestMapping("/administrator/updategame.do")
	public String updategame(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		request.setCharacterEncoding("utf-8");
		List<String> filelist = new ArrayList<String>();		//用于存放上传的文件
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
		//上传图片
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, filelist);        
	    String picture2 = filelist.toString();
	    String picture = picture2.substring(1,picture2.length()-1);
		String gamename = (String) map.get("gamename");
		int id = Integer.parseInt((String) map.get("id"));
		
		//Gameinfo获取数据
		String detaildescripe = (String) map.get("detaildescripe");
		//String picture = request.getParameter("picture");
		String gamesize = (String) map.get("gamesize");
		String howstart = (String) map.get("howstart");
		String gamegoal = (String) map.get("gamegoal");
		String gameurl = (String) map.get("gameurl");
		String code = (String) map.get("code");
		
		//Gamelist 获取数据
		int gameid = Integer.parseInt((String) map.get("gameid"));
		String gametype = (String) map.get("gametype");
		String descrip = (String) map.get("descrip");
		String placetype = (String) map.get("placetype");
		String roletype = (String) map.get("roletype");
		String mainpicture = (String) map.get("mainpicture");
		String toppicture = (String) map.get("toppicture");
		String indexpicture = (String) map.get("indexpicture");
		String isBoutique =(String)  map.get("isBoutique");
		String isrecommend = (String) map.get("isrecommend");
		String click = (String) map.get("click");
		
		//获得现在时间
		String date1 = (String) map.get("date1");
		String date2 = (String) map.get("date2");
		String date = date1+" "+date2;
		
		//Gameinfo 表添加数据
		Gameinfo gi = new Gameinfo();
		gi.setId(id);
		gi.setGamename(gamename);				//游戏名
		gi.setDetaildescripe(detaildescripe);	//详细描述
		gi.setPicture(picture);					//图片
		gi.setGamesize(gamesize);				//游戏大小
		gi.setHowstart(howstart);				//如何开始
		gi.setGamegoal(gamegoal);				//游戏目标
		gi.setGameurl(gameurl);					//游戏地址
		gi.setCode(code);
		gi.setGameid(gameid);					//
		
		Gamedistrict gd = new Gamedistrict();
		gd.setGamename(gamename);
		gd.setGameid(gameid);
		gamedistrictdao.updateByName(gd);
		
		
		gameinfodao.update(gi);					
		//GameList 添加数据
		Gamelist gl = new Gamelist();
		gl.setDate(date);
		gl.setId(id);
		gl.setGamename(gamename);				//游戏名
		gl.setGameid(gameid);					//gameid
		gl.setGametype(gametype);				//游戏类型
		gl.setDescrip(descrip);					//描述
		gl.setPlacetype(placetype);				//放置类型
		gl.setRoletype(roletype);				//角色类型
		gl.setClick(click);
		if(mainpicture!=null && mainpicture!=""){
			gl.setMainpicture(mainpicture);		//主图片
		}
		if(toppicture!=null && toppicture!=""){
			gl.setToppicture(toppicture);		//排行图片
		}
		if(indexpicture!=null && indexpicture!=""){
			gl.setIndexpicture(indexpicture);	//首页图片
		}
		gl.setIsBoutique(isBoutique);			//是否精品
		gl.setIsrecommend(isrecommend);			//是否推荐				//时间
		gamelistdao.update(gl);
//		if(ret1==0){
//			System.out.println("修改游戏信息失败");
//		}else{
//			System.out.println("修改游戏信息成功");
//		}
//		if(ret2==0){
//			System.out.println("修改游戏列表失败");
//		}else{
//			System.out.println("修改游戏列表成功");
//		}
		return "redirect:gamelist.do";
	}
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/administrator/vagameid.do")
	public void vagameid(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int gameid = Integer.parseInt(request.getParameter("gameid"));
		String gamename = gamelistdao.getgamenamebygameid(gameid);
		if(gamename==null){
			out.print("");
		}else{
			out.print(gamename);
		}
		
	}
	
	/**
	 * 删除游戏
	 */
	@RequestMapping("/administrator/deletegame.do")
	public String deletegame(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		String url = request.getParameter("url");
		gamelistdao.delete(id);
		gameinfodao.delete(id);
//		if(ret1==0){
//			System.out.println("删除游戏信息失败");
//		}else{
//			System.out.println("删除游戏信息成功");
//		}
//		if(ret2==0){
//			System.out.println("删除游戏列表失败");
//		}else{
//			System.out.println("删除游戏列表成功");
//		}
		if(url.equals("gameinfo")){
			return "redirect:gameinfo.do";
		}else if(url.equals("gamelist")){
			return "redirect:gamelist.do";
		}
		return url;

	}
}