package com.yqwan.ht.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.util.UtilDate;
import com.yqwan.dao.ICdkeyBannerDao;
import com.yqwan.dao.IGameInfoDao;
import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.IThreeBannerDao;
import com.yqwan.domain.CdkeyBanner;
import com.yqwan.domain.Gameinfo;
import com.yqwan.domain.Threebanner;
import com.yqwan.service.PictureUpload;

@Controller
public class BannerController {
	@Resource
	private IThreeBannerDao threebannerdao;
	@Resource
	private ICdkeyBannerDao cdkeybannerdao;

	@Resource
	private IGameInfoDao gameinfodao;
	@Resource
	private IGameListDao gamelistdao;
	
	
	/**
	 * banner图添加游戏查询
	 */
	@RequestMapping("/administrator/adbanner3.do")
	public String adbanner3(HttpServletRequest request){
		List<Gameinfo> gameinfo = gameinfodao.all();
		request.setAttribute("gameinfo", gameinfo);
		return "administratorht/template/bannerpicture/addbanner3";
	}
	/**
	 * 发号banner图添加游戏查询
	 */
	@RequestMapping("/administrator/adcdkeybanner.do")
	public String adcdkeybanner(HttpServletRequest request){
		List<Gameinfo> gameinfo = gameinfodao.all();
		request.setAttribute("gameinfo", gameinfo);
		return "administratorht/template/bannerpicture/addcdekybanner";
	}
	/**
	 * 首页3张banner图
	 */
	@RequestMapping("/administrator/banner3.do")
	public String banner3(HttpServletRequest request){
		List<Threebanner> threebanner = threebannerdao.listAll();
		request.setAttribute("threebanner", threebanner);
		return "administratorht/template/bannerpicture/banner3";
	}
	/**
	 * 首页3张banner图单查
	 */
	@RequestMapping("/administrator/singlebanner3.do")
	public String singlebanner3(HttpServletRequest request){
		List<Gameinfo> gameinfo = gameinfodao.all();
		request.setAttribute("gameinfo", gameinfo);
		int id = Integer.parseInt(request.getParameter("id"));
		Threebanner singlebanner = threebannerdao.findbyid(id);
		request.setAttribute("singlebanner", singlebanner);
		return "administratorht/template/bannerpicture/updatebanner3";
	}
	/**
	 * 首页3张banner图添加
	 */
	@RequestMapping("/administrator/addbanner3.do")
	public String addbanner3(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, null);
		String gamename = (String) map.get("gamename");					//获取游戏名
		String gamepicture = (String) map.get("gamepicture");			//获取小图
		String largegamepicture = (String) map.get("largegamepicture");	//获取大图
		
		int gameid = gamelistdao.getgameidbygamename(gamename);
		Threebanner t = new Threebanner();
		t.setGamename(gamename);
		t.setGameid(gameid);
		t.setGamepicture(gamepicture);
		t.setLargegamepicture(largegamepicture);
		t.setBannerdate(UtilDate.getDateFormatter());
		int ret = threebannerdao.insert(t);
		if(ret==0){
			System.out.println("首页banner图添加失败");
		}else{
			System.out.println("首页banner图添加成功");
		}
		return "redirect:banner3.do";
	}
	/**
	 * 首页3张banner图修改
	 */
	@RequestMapping("/administrator/updatebanner3.do")
	public String updatebanner3(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, null);
	    int id = Integer.parseInt((String) map.get("id"));				//获取id
		String gamename = (String) map.get("gamename");					//获取游戏名
		String gamepicture = (String) map.get("gamepicture");			//获取小图
		String largegamepicture = (String) map.get("largegamepicture");	//获取大图
		
		int gameid = gamelistdao.getgameidbygamename(gamename);
		Threebanner t = new Threebanner();
		t.setId(id);
		t.setGamename(gamename);
		t.setGameid(gameid);
		t.setGamepicture(gamepicture);
		t.setLargegamepicture(largegamepicture);
		t.setBannerdate(UtilDate.getDateFormatter());
		int ret = threebannerdao.update(t);
		if(ret==0){
			System.out.println("首页banner图修改失败");
		}else{
			System.out.println("首页banner图修改成功");
		}
		return "redirect:banner3.do";
	}
	
	/**
	 * 发号中心banner图
	 * 全部查询
	 */
	@RequestMapping("/administrator/cdkeybanner.do")
	public String cdkeybanner(HttpServletRequest request){
		List<CdkeyBanner> cdkeybanner = cdkeybannerdao.listAll();
		request.setAttribute("cdkeybanner", cdkeybanner);
		return "administratorht/template/bannerpicture/cdkeybanner";
	}
	/**
	 * 发号中心banner图
	 * 单个查询
	 */
	@RequestMapping("/administrator/singlecdkeybanner.do")
	public String singlecdkeybanner(HttpServletRequest request){
		List<Gameinfo> gameinfo = gameinfodao.all();
		request.setAttribute("gameinfo", gameinfo);
		int id = Integer.parseInt(request.getParameter("id"));		//获取id
		CdkeyBanner singlecdkeybanner = cdkeybannerdao.findbyid(id);
		request.setAttribute("singlecdkeybanner", singlecdkeybanner);
		return "administratorht/template/bannerpicture/updatecdkeybanner";
	}
	/**
	 * 发号中心banner图
	 * 添加
	 */
	@RequestMapping("/administrator/addcdkeybanner.do")
	public String addcdkeybanner(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
		//上传图片
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, null);
		
	    String gamename = (String) map.get("gamename");			//游戏名
		String picture = (String) map.get("picture");			//图片
		Date now = new Date();
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		String date = form.format(now);							//时间
		CdkeyBanner c = new CdkeyBanner();
		c.setPicture(picture);
		c.setGamename(gamename);
		c.setDate(date);
		int ret = cdkeybannerdao.add(c);
		if(ret==1){
			System.out.println("发号中心banner图添加成功");
		}else{
			System.out.println("发号中心banner图添加失败");
		}
		return "redirect:cdkeybanner.do";
	}
	/**
	 * 发号中心banner图
	 * 修改
	 */
	@RequestMapping("/administrator/updatecdkeybanner.do")
	public String updatecdkeybanner(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
		//上传图片
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, null);

		int id = Integer.parseInt((String) map.get("id"));
	    String gamename = (String) map.get("gamename");			//游戏名
		String picture = (String) map.get("picture");			//图片
		Date now = new Date();
		SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		String date = form.format(now);							//时间
		CdkeyBanner c = new CdkeyBanner();
		c.setId(id);
		c.setPicture(picture);
		c.setGamename(gamename);
		c.setDate(date);
		int ret = cdkeybannerdao.update(c);
		if(ret==1){
			System.out.println("发号中心banner图修改成功");
		}else{
			System.out.println("发号中心banner图修改失败");
		}
		return "redirect:cdkeybanner.do";
	}
}