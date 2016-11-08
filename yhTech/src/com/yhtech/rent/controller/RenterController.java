package com.yhtech.rent.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.peter.util.Log;
import com.peter.util.PictureUpload;
import com.peter.util.ReadXls;
import com.peter.util.UtilDate;
import com.yhtech.rent.dao.IApplyyearpayDao;
import com.yhtech.rent.dao.IHouseDao;
import com.yhtech.rent.dao.IRentorderDao;
import com.yhtech.rent.domain.Applyyearpay;
import com.yhtech.rent.domain.House;
import com.yhtech.rent.domain.Rentorder;

@Controller("rentercontroller")
public class RenterController {
	@Resource
	private IHouseDao ihousedao;
	@Resource
	private IApplyyearpayDao iapplyyearpaydao;
	@Resource
	private IRentorderDao irentorderdao;
	/**
	 * 获取当日需要发短信租客
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/gettodayrent.do")
	public void gettodayrent(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("fail");
		}else{
			List<House> listh = ihousedao.listAll();
			List<House> l = new ArrayList<House>();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date now = new Date();
			String date;
			Date rentdate;
			for(int i=0;i<listh.size();i++){
				date = listh.get(i).getDate();
				try {
					rentdate = sdf.parse(date);
					if(rentdate.getTime()-now.getTime()<7*24*60*60*1000 && rentdate.getTime()-now.getTime()>6*24*60*60*1000){
						House r = new House(listh.get(i).getId(), listh.get(i).getHouse_id(), listh.get(i).getMoney(), 
								listh.get(i).getDate(), listh.get(i).getMode(), listh.get(i).getRenter_telephone(), 
								listh.get(i).getRenter_phone(), listh.get(i).getRenter_name());
						l.add(r);
					}
				} catch (ParseException e) {
					Log.logResult(UtilDate.getDateFormatter()+";房源编号"+listh.get(i).getHouse_id()+"获取当日发送短信异常\r\n", "d:\\igjiaLogs\\yhTech\\ErrorLogs");
				}
								
			}
			JSONArray obj = JSONArray.fromObject(l);
			String list = obj.toString();
			out.print(list);

		}
		
	}
	
	
	/**
	 * 获取单个租客
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getrenter.do")
	public void getrenter(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String name = URLDecoder.decode(request.getParameter("name"), "utf-8");
		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("fail");
		}else{
			List<House> l = ihousedao.findByName(name);
			JSONArray obj = JSONArray.fromObject(l);
			String list = obj.toString();

			out.print(list);
		}
	}
	
	/**
	 * 获取所有租客
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getAllrenter.do")
	public void getAllrenter(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String page = request.getParameter("page");
		String num = request.getParameter("num");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("fail");
		}else{		
			List<House> l = ihousedao.listAll();
			
			int begin = (Integer.parseInt(page)-1)*Integer.parseInt(num);
			int end = (Integer.parseInt(page)-1)*Integer.parseInt(num)+Integer.parseInt(num);
			if(begin>l.size()){ 
				out.print("error");
			}else if(end>l.size()){
				l = l.subList(begin,l.size());
			}else{
				l = l.subList(begin,end);
			}
			
			
			JSONArray obj = JSONArray.fromObject(l);
			String list = obj.toString();

			out.print(list);
		}
	}
	
	/**
	 * 上传excel文件,批量更新房屋信息
	 */
	@RequestMapping("/uploadexcelfile.do")
	public void uploadexcelfile(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("您还尚未登录,<a href=\"login.html\" target=\"_blank\">点击登录</a>");
		}else{
			List<String> list = new ArrayList<String>();
			Map<String,String> map = new HashMap<String, String>();
			PictureUpload.pictureupload("d:\\AllPicture\\igjia", list, map, request);
			String excelname = list.get(0);
			if(!excelname.substring(excelname.length()-3).equals("xls")){
				 out.println("文件格式错误");
				 return;
			}
//			String r = PictureUpload.renameFile("d:\\AllPicture\\igjia\\"+UtilDate.getMonth()+"\\"+excelname, "d:\\AllPicture\\igjia\\"+UtilDate.getMonth()+"\\fangyuan.xls");
				List<String> houseid = ReadXls.readexcel("d:\\AllPicture\\igjia\\"+UtilDate.getMonth()+"\\"+excelname, 1);
				List<String> renter_name = ReadXls.readexcel("d:\\AllPicture\\igjia\\"+UtilDate.getMonth()+"\\"+excelname, 2);
				List<String> renter_telephone = ReadXls.readexcel("d:\\AllPicture\\igjia\\"+UtilDate.getMonth()+"\\"+excelname,3);
				List<String> money = ReadXls.readexcel("d:\\AllPicture\\igjia\\"+UtilDate.getMonth()+"\\"+excelname,4);
				List<String> date = ReadXls.readexcel("d:\\AllPicture\\igjia\\"+UtilDate.getMonth()+"\\"+excelname,5);
				
				String errorRow = "";

				if(houseid.size()==renter_name.size()&&renter_name.size()==renter_telephone.size()&&renter_telephone.size()==money.size()){
					House h;
					House findId;
					for(int i=0;i<houseid.size();i++){
						findId = ihousedao.findByHouseid(houseid.get(i));
						h = new House(0, houseid.get(i), money.get(i), date.get(i), null, renter_telephone.get(i), null, renter_name.get(i));
						
						if(findId == null){
							if(renter_telephone.get(i).trim().length()==11){
								try {
									ihousedao.add(h);
								} catch (Exception e) {
									errorRow=renter_name.get(i)+renter_telephone.get(i)+"添加异常<br /> ";
									out.println(errorRow);
								}								
							}else{
								errorRow=renter_name.get(i)+renter_telephone.get(i)+"手机号格式错误,添加失败<br /> ";
								out.println(errorRow);
							}
						}else{
							if(renter_telephone.get(i).trim().length()==11){
								ihousedao.update(h);							
							}else{
								errorRow=renter_name.get(i)+renter_telephone.get(i)+"手机号格式错误,更新失败<br /> ";
								out.println(errorRow);
							}							
						}
					}
				}else{
					out.print("更新失败,查看excel表数据是否缺失");
				}
		}
	}
	/**
	 * login
	 */
	@RequestMapping("/logs.do")
	public void logs(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("fail");
		}else{
			String path = request.getParameter("path");
			
			
			if(path=="" || path==null){
				path="D:\\igjiaLogs\\yhTech\\MsgLogs";
			}else{
				path="D:\\igjiaLogs\\yhTech\\MsgLogs\\"+path;
			}
			
			
			File dir=new File(path);
			String[] fileNames=dir.list();
			
			List<String> list=new ArrayList<String>();
			for(int i=0;i<fileNames.length;i++)
			{
				list.add(fileNames[i]);
			}
			
			JSONArray obj = JSONArray.fromObject(list);
			String lists = obj.toString();

			out.print(lists);
		}
	}
	
	/**
	 * 单个house
	 */
	@RequestMapping("/seachhouse.do")
	public void seachhouse(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String house_id = request.getParameter("id");
		House h = ihousedao.findByHouseid(house_id);
		JSONObject obj = JSONObject.fromObject(h);
		String house =obj.toString();
		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("fail");
		}else{
			out.print(house);
		}
		
	}
	
	/**
	 * 修改房屋信息
	 */
	@RequestMapping("/updatehouse.do")
	public void updatehouse(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();		
		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("fail");
		}else{
			String house_id = URLDecoder.decode(request.getParameter("house_id"),"UTF-8");
			String renter_telephone = URLDecoder.decode(request.getParameter("renter_telephone"),"UTF-8");
			String renter_name = URLDecoder.decode(request.getParameter("renter_name"),"UTF-8");
			String money = URLDecoder.decode(request.getParameter("money"),"UTF-8");
			String date = URLDecoder.decode(request.getParameter("date"),"UTF-8");
			House h = new House(0, house_id, money, date, null, renter_telephone, null, renter_name);
			int res = ihousedao.update(h);			
			if(res==1){
				out.print("success");
			}else{
				out.print("error");
			}
		}
		
	}
	
	/**
	 * 获取所有申请年付订单的记录
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/applyyearpay.do")
	public void applyyearpay(HttpServletRequest request,HttpServletResponse response) throws IOException{		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("fail");
		}else{		
			String page = request.getParameter("page");
			String num = request.getParameter("num");
			String name = URLDecoder.decode(request.getParameter("name"),"UTF-8");
			List<Applyyearpay> l = iapplyyearpaydao.findByName(name);
			
			int begin = (Integer.parseInt(page)-1)*Integer.parseInt(num);
			int end = (Integer.parseInt(page)-1)*Integer.parseInt(num)+Integer.parseInt(num);
			if(begin>l.size()){ 
				out.print("error");
			}else if(end>l.size()){
				l = l.subList(begin,l.size());
			}else{
				l = l.subList(begin,end);
			}
			
			
			JSONArray obj = JSONArray.fromObject(l);
			String list = obj.toString();

			out.print(list);
		}
	}
	
	/**
	 * 获取所有付房租订单
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/rentorder.do")
	public void rentorder(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String page = request.getParameter("page");
		String num = request.getParameter("num");
		String name = URLDecoder.decode(request.getParameter("name"),"UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String admin = (String) request.getSession().getAttribute("admin");
		if(admin==null){
			out.print("fail");
		}else{		
			List<Rentorder> l = irentorderdao.findByName(name);
			
			int begin = (Integer.parseInt(page)-1)*Integer.parseInt(num);
			int end = (Integer.parseInt(page)-1)*Integer.parseInt(num)+Integer.parseInt(num);
			if(begin>l.size()){ 
				out.print("error");
			}else if(end>l.size()){
				l = l.subList(begin,l.size());
			}else{
				l = l.subList(begin,end);
			}
			JSONArray obj = JSONArray.fromObject(l);
			String list = obj.toString();
			out.print(list);
		}
	}
	
}
