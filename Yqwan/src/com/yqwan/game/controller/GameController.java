package com.yqwan.game.controller;

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

import com.alipay.util.UtilDate;
import com.yqwan.dao.IGameDistrictDao;
import com.yqwan.dao.IGameListDao;
import com.yqwan.domain.Gamedistrict;
import com.yqwan.domain.Gamelist;

/**
 * 获取游戏分区以及顶部head5个游戏的接口
 * @author PeterShi
 *
 */
@Controller("igame")
public class GameController {
	@Resource
	private IGameDistrictDao districtdao;
	@Resource
	private IGameListDao gamelistdao;
	
	/**
	 * 获取游戏新区 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/newDistrict.do")
	public void newDistrict(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String gamename = URLDecoder.decode(request.getParameter("g"),"utf-8");
		String callback = request.getParameter("jsoncallback");
		
		List<Gamedistrict> newDistrict = districtdao.findNewDistrict(gamename);
		Gamedistrict gd = null;
		for(int i=0;i<newDistrict.size();i++){
			gd = newDistrict.get(i);
			String date = gd.getDate();
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Long gamedate = df.parse(date).getTime();
			Long nowdate = df.parse(UtilDate.getDateFormatter()).getTime();
			if(gamedate<nowdate) break;
		}	
		String back = "{'code':0,'district':'"+gd.getGameregion()+"','serverid':'"+gd.getServerid()+"'}";
		JSONObject jsonback = JSONObject.fromObject(back);
		out.print(callback + "(" + jsonback + ")");
	}
	
	/**
	 * 专题页5个推荐的游戏
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/fiverecommend.do")
	public void indexrecommend(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String callback = request.getParameter("jsoncallback");
		List<Gamelist> gamelist = gamelistdao.listfiverecommend();
		JSONObject jsonback = listToJson(gamelist);
		out.print(callback + "(" + jsonback + ")");
	}
	
	/**
	 * 所有游戏分区
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/allregion.do")
	public void allregion(HttpServletRequest request,HttpServletResponse response) throws Exception{		
		String gamename = URLDecoder.decode(request.getParameter("g"),"utf-8");
		String callback = request.getParameter("jsoncallback");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<Gamedistrict> gamedistrict = districtdao.listallregion(gamename);
		for(int i=0;i<gamedistrict.size();i++){
			Gamedistrict gd = gamedistrict.get(i);
			String date = gd.getDate();
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Long gamedate = df.parse(date).getTime();
			Long nowdate = df.parse(UtilDate.getDateFormatter()).getTime();
			if(nowdate>gamedate) continue;
			gamedistrict.remove(i);
		}
		
		JSONObject jsonback = listToJson(gamedistrict);
		out.print(callback + "(" + jsonback + ")");
	}
	
	/**
	 * list转成json
	 * @param list
	 * @return
	 */
	@SuppressWarnings("unchecked")
	private JSONObject listToJson(List list){
		JSONArray obj = JSONArray.fromObject(list);
		String lista = obj.toString();
		String back = "{'code':0,'jsonarray':'" + lista + "'}";
		JSONObject jsonback = JSONObject.fromObject(back);
		return jsonback;
	}
}
