package com.yqwan.ht.controller;

import java.io.FileInputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.ICdkeyInfoDao;
import com.yqwan.dao.IGameInfoDao;
import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.IGiftInfoDao;
import com.yqwan.domain.Cdkeyinfo;
import com.yqwan.domain.Gameinfo;
import com.yqwan.domain.Gamelist;
import com.yqwan.domain.Giftinfo;
import com.yqwan.service.PictureUpload;

@Controller
public class GiftinfoController {
	@Resource
	private IGiftInfoDao giftinfodao;;
	@Resource
	private ICdkeyInfoDao cdkeyinfodao;
	@Resource
	private IGameInfoDao gameinfodao;
	@Resource
	private IGameListDao gamelistdao;

	/**
	 * 礼包添加游戏查询
	 */
	@RequestMapping("/administrator/adgiftinfo.do")
	public String adgiftinfo(HttpServletRequest request){
		List<Gameinfo> gameinfo = gameinfodao.all();
		request.setAttribute("gameinfo", gameinfo);
		return "administratorht/template/giftinfo/addgift";
	}
	/**
	 * 分页查询礼包信息
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/administrator/giftinfo.do")
	public String giftinfo(HttpServletRequest request) throws UnsupportedEncodingException{
		// TODO Auto-generated catch block
		String curpage = request.getParameter("page");			//当前页数
		String giftname1 = request.getParameter("giftname");	//礼包名
		String giftname="";
		if(giftname1!=null && giftname1!=""){
			giftname = URLDecoder.decode(giftname1,"UTF-8");
		}
		//分页条件查询
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			List<Giftinfo> giftinfo = giftinfodao.paging(giftname,(currentpage-1)*10,10);
			request.setAttribute("giftinfo", giftinfo);
		}else{
			List<Giftinfo> giftinfo = giftinfodao.paging(giftname,0,10);
			request.setAttribute("giftinfo", giftinfo);
		}
		int count = giftinfodao.count(giftname);		//总页数
		request.setAttribute("count", count);
		request.setAttribute("giftname", giftname);
		return "administratorht/template/giftinfo/giftinfo";
	}
	/**
	 * 分页查询cdkey
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/administrator/cdkeyinfo.do")
	public String cdkeyinfo(HttpServletRequest request) throws UnsupportedEncodingException{
		// TODO Auto-generated catch block
		String curpage = request.getParameter("page");			//当前页数
		String giftname1 = request.getParameter("giftname");	//礼包名
		String giftname="";
		if(giftname1!=null && giftname1!=""){
			giftname = URLDecoder.decode(giftname1,"UTF-8");
		}
		//分页条件查询
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			List<Cdkeyinfo> cdkeyinfo = cdkeyinfodao.paging(giftname,(currentpage-1)*10,10);
			request.setAttribute("cdkeyinfo", cdkeyinfo);
		}else{
			List<Cdkeyinfo> cdkeyinfo = cdkeyinfodao.paging(giftname,0,10);
			request.setAttribute("cdkeyinfo", cdkeyinfo);
		}
		int count = cdkeyinfodao.countpag(giftname);		//总页数
		request.setAttribute("count", count);
		request.setAttribute("giftname", giftname);
		return "administratorht/template/giftinfo/cdkeyinfo";
	}
	/**
	 * 根据id查询礼包信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/administrator/singlegift.do")
	public String singlegift(HttpServletRequest request){
		// TODO Auto-generated catch block
		List<Gameinfo> gameinfos = gameinfodao.all();
		request.setAttribute("gameinfos", gameinfos);
		String aid = request.getParameter("id");			//获取礼包id
		if(aid!=null && aid!=""){
			int id = Integer.parseInt(aid);
			Giftinfo giftinfo = giftinfodao.findbyid(id);
			Gameinfo gameinfo = gameinfodao.findbyname(giftinfo.getGamename());
			Gamelist gamelist = gamelistdao.findbyname(giftinfo.getGamename());
			request.setAttribute("giftinfo",giftinfo);
			request.setAttribute("gamelist",gamelist);
			request.setAttribute("gameinfo",gameinfo);
		}
		
		
		return "administratorht/template/giftinfo/updategift";
	}
	/**
	 * 添加礼包信息
	 * 
	 */
	@RequestMapping("/administrator/addgift.do")
	public String addgift(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		// TODO 添加礼包
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		Date now = new Date();
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
		//上传图片
		PictureUpload a = new PictureUpload();
		a.pictureupload(request, path, map, null);   
		String giftname = (String) map.get("giftname");					//礼包名
		String gamename = (String) map.get("gamename");					//游戏名
		//Giftinfo获取数据
		String logo = (String) map.get("logo");							//图片
		String timelimit1=(String)map.get("timelimit");					//期限
		int timelimit=0;
		if(timelimit1!=null && timelimit1!=""){
			timelimit = Integer.parseInt(timelimit1);
		}
		String type = (String) map.get("type");							//礼包类型
		String content = (String) map.get("content");					//礼包内容
		String activationdate = (String) map.get("activationdate");		//激活时间
		String conditions = (String) map.get("conditions");				//条件
		SimpleDateFormat form = new SimpleDateFormat("yyyyMMddHHmmss"); //领取时间
		String date = form.format(now);
		//Giftinfo 表添加数据
		Giftinfo gi = new Giftinfo();
		gi.setGiftname(giftname);				//礼包名
		gi.setGamename(gamename);				//游戏名
		gi.setLogo(logo);						//Log
		gi.setTimelimit(timelimit);				//期限
		gi.setType(type);						//类型
		gi.setContent(content);					//内容
		gi.setActivationdate(activationdate);	//激活日期
		gi.setConditions(conditions);			//条件
		gi.setDate(date);
		int ret = giftinfodao.add(gi);	
		if(ret==0){
			System.out.println("添加礼包失败");
		}else{
			System.out.println("添加礼包成功");
		}
		return "redirect:giftinfo.do";
	}
	/**
	 * 修改礼包信息
	 * 
	 */
	@RequestMapping("/administrator/updategift.do")
	public String updategift(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		// TODO 修改礼包信息
		request.setCharacterEncoding("utf-8");
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		Date now = new Date();
		String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
		//上传图片
		PictureUpload a = new PictureUpload();
		//Giftinfo获取数据
		a.pictureupload(request, path, map, null);
		String giftname = (String) map.get("giftname");					//礼包名
		String gamename = (String) map.get("gamename");					//游戏名
		
		int id = Integer.parseInt((String) map.get("id"));				//id
		String logo = (String) map.get("logo");							//图片
		String timelimit1=(String)map.get("timelimit");					//期限
		int timelimit=0;
		if(timelimit1!=null && timelimit1!=""){
			timelimit = Integer.parseInt(timelimit1);
		}
		String type = (String) map.get("type");							//类型
		String content = (String) map.get("content");					//内容
		String activationdate = (String) map.get("activationdate");		//激活日期
		String conditions = (String) map.get("conditions");				//条件
		SimpleDateFormat form = new SimpleDateFormat("yyyyMMddHHmmss"); //日期
		String date = form.format(now);
		//Giftinfo 表添加数据
		Giftinfo gi = new Giftinfo();
		gi.setId(id);							//编号
		gi.setGiftname(giftname);				//礼包名
		gi.setGamename(gamename);				//游戏名
		gi.setLogo(logo);						//Log
		gi.setTimelimit(timelimit);				//期限
		gi.setType(type);						//类型
		gi.setContent(content);					//内容
		gi.setActivationdate(activationdate);	//激活日期
		gi.setConditions(conditions);			//条件
		gi.setDate(date);
		giftinfodao.update(gi);					
//		if(ret==0){
//			System.out.println("修改礼包失败");
//		}else{
//			System.out.println("修改礼包成功");
//		}
		return "redirect:giftinfo.do";
	}
	/*
	 * 添加礼包号
	 */
	@RequestMapping("/administrator/temp/addcdkey.do")
	public String addcdkeyjsp(HttpServletRequest request) throws Exception{
		List<Giftinfo> giftinfo = giftinfodao.all();
		request.setAttribute("giftinfo", giftinfo);
		return "administratorht/template/giftinfo/addcdkey";
	}
	/*
	 * 添加礼包号
	 */
	@RequestMapping("/administrator/addcdkey.do")
	public String addcdkey(HttpServletRequest request){
		try {
			request.setCharacterEncoding("utf-8");
			Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
			String path = "d://AllPicture//yqwan";//request.getSession().getServletContext().getRealPath("/gamePicture");	//图片上传地址
			//上传图片
			PictureUpload a = new PictureUpload();
			a.pictureupload(request, path, map, null);   
			String xls = (String) map.get("filexls");
			int giftid = Integer.parseInt((String) map.get("giftid"));
			HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream(path+"\\"+xls));
			HSSFSheet sheet = wb.getSheetAt(0);
	        HSSFRow row = null;
	        HSSFCell cell = null;
	        int rowNum=sheet.getLastRowNum();							//获得总行数
	        //int coloumNum=sheet.getRow(0).getPhysicalNumberOfCells();	//获得总列数
	        
	        row=sheet.getRow(1);
			cell=row.getCell(1);
			String cellStr = null;
			Cdkeyinfo c = new Cdkeyinfo();
	        for (int i = 0; i <= rowNum; i++) {
				row=sheet.getRow(i);
				if(row==null) break;
				cell=row.getCell(0);
				
				if (cell == null) {// 单元格为空设置cellStr为空串  
					continue;
				}else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
					cellStr = String.valueOf(cell.getNumericCellValue());
					cellStr = cellStr.substring(0, cellStr.lastIndexOf("."));
	             } else {// 其余按照字符串处理  
	            	 cellStr = cell.getStringCellValue();  
	             }
				
				c.setCdkey(cellStr);
				c.setGiftid(giftid);
				c.setIsreceive(0);
				cdkeyinfodao.add(c);
//				if(ret==0){
//					System.out.println("添加礼包号失败");
//				}else{
//					System.out.println("添加礼包号成功");
//				}			
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "administratorht/template/giftinfo/cdkeyinfo";
	}
	
	/**
	 * 删除礼包
	 */
	@RequestMapping("/administrator/deletegift.do")
	public String deletegift(HttpServletRequest request){
		// TODO 删除礼包
		int id = Integer.parseInt(request.getParameter("id"));
		giftinfodao.delete(id);
//		if(ret==0){
//			System.out.println("删除礼包失败");
//		}else{
//			System.out.println("删除礼包成功");
//		}
		return "redirect:giftinfo.do";
	}
	/**
	 * 删除礼包码
	 */
	@RequestMapping("/administrator/deletecdkey.do")
	public String deletecdkey(HttpServletRequest request){
		// TODO 删除礼包
		int id = Integer.parseInt(request.getParameter("id"));
		cdkeyinfodao.delete(id);
//		if(ret==0){
//			System.out.println("删除礼包码失败");
//		}else{
//			System.out.println("删除礼包码成功");
//		}
		return "redirect:cdkeyinfo.do";
	}
}