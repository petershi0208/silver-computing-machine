package com.yqwan.ht.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
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

import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.IRecordDao;
import com.yqwan.domain.Gamelist;
import com.yqwan.domain.Record;
import com.yqwan.service.PictureUpload;
@Controller
public class RecordController {
	@Resource
	private IGameListDao gamelistdao;
	@Resource
	private IRecordDao recorddao;
	
	/**
	 * 添加专辑信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("administrator/addrecord.do")
	public String addrecord(HttpServletRequest request,HttpServletResponse response){
		List<Gamelist> gamelist = gamelistdao.listAllNewgameMore();
		request.setAttribute("gamelist", gamelist);
		return "administratorht/template/record/addrecord";
	}
	/**
	 * 添加游戏到专辑信息
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("administrator/addgamerecord.do")
	public String addgamerecord(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		int id = Integer.parseInt(request.getParameter("id"));
		String gameid1 = request.getParameter("gameid");
		Record r = recorddao.findById(id);
		String gameid = r.getGameid();
		gameid = gameid+","+gameid1;
		Record record = new Record();
		record.setId(id);
		record.setGameid(gameid);
		recorddao.update(record);
		return "redirect:gamelist.do?page="+page;
	}
	/**
	 * 添加专辑信息
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("administrator/addrecord1.do")
	public String addrecord1(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		List<String> filelist = new ArrayList<String>();		//用于存放上传的文件
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
		//上传图片
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, filelist);
		String name = (String) map.get("name");
		String describe = (String) map.get("describe");
		String gameid = (String) map.get("gameid");		
		String picture = (String) map.get("picture1");
		String banner = (String) map.get("banner");
		int click = Integer.parseInt((String)map.get("click"));
		String score = (String) map.get("score");
		Date now = new Date();
		System.out.println(gameid);
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy-MM-dd");
		String date = form1.format(now);
		Record record = new Record();
		record.setName(name);
		record.setDescribe(describe);
		record.setGameid(gameid);
		record.setClick(click);
		record.setScore(score);
		record.setPicture(picture);
		record.setBanner(banner);
		record.setDate(date);
		int res = recorddao.add(record);
		System.out.println(res);
		return "redirect:recordinfo.do?res="+res;
	}
	/**
	 * 专辑详细信息
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("administrator/recordinfo.do")
	public String recordinfo(HttpServletRequest request,HttpServletResponse response){
		List<Record> record = recorddao.listRecord();
		request.setAttribute("record", record);
		List<Gamelist> gamelist = gamelistdao.listAllNewgameMore();
		request.setAttribute("gamelist", gamelist);
		return "administratorht/template/record/recordinfo";
	}
	/**
	 * 专辑游戏查询
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("administrator/recordgame.do")
	public String recordgame(HttpServletRequest request,HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		Record r = recorddao.findById(id);
		request.setAttribute("r", r);
		List<Gamelist> gamelist = gamelistdao.listAllNewgameMore();
		request.setAttribute("gamelist", gamelist);
		return "administratorht/template/record/recordgame";
	}
	/**
	 * 专辑信息单查
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("administrator/recordsig.do")
	public String recordsig(HttpServletRequest request,HttpServletResponse response){
		int id = Integer.parseInt(request.getParameter("id"));
		Record r = recorddao.findById(id);
		List<Gamelist> gamelist = gamelistdao.listAllNewgameMore();
		request.setAttribute("gamelist", gamelist);
		request.setAttribute("r", r);
		return "administratorht/template/record/updaterecord";
	}
	/**
	 * 修改专辑
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("administrator/updaterecord.do")
	public String updaterecord(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		List<String> filelist = new ArrayList<String>();		//用于存放上传的文件
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
		//上传图片
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, filelist);
		int id = Integer.parseInt((String) map.get("id"));
		String name = (String) map.get("name");
		String describe = (String) map.get("describe");
		String gameid = (String) map.get("gameid");		
		String picture = (String) map.get("picture1");
		String banner = (String) map.get("banner");
		String score = (String) map.get("score");
System.out.println(id);
		Record record = new Record();
		record.setId(id);
		record.setName(name);
		record.setDescribe(describe);
		record.setGameid(gameid);
		record.setScore(score);
		record.setPicture(picture);
		record.setBanner(banner);
		int res = recorddao.update(record);
		return "redirect:recordsig.do?id="+id+"&res="+res;
	}
	/**
	 * 删除专辑游戏
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException 
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("administrator/deleterecordgame.do")
	public String deleterecordgame(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		int id = Integer.parseInt(request.getParameter("id"));
		String gameid1 = request.getParameter("gameid");
		Record r = recorddao.findById(id);
		String gameid = r.getGameid();
		gameid = gameid.replace(","+gameid1, "");
		gameid = gameid.replace(gameid1+",", "");
		Record record = new Record();
		record.setId(id);
		record.setGameid(gameid);
		int res = recorddao.update(record);
		if(gameid.length()==6){
			res = 100;
		}
		return "redirect:recordsig.do?id="+id+"&res="+res;
	}
}
