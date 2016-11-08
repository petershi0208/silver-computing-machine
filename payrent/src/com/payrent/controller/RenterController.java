package com.payrent.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.payrent.dao.IHouseDao;
import com.payrent.dao.IRentOrderDao;
import com.payrent.dao.IYearPayDao;
import com.payrent.domain.House;
import com.payrent.domain.RentOrder;
import com.payrent.domain.Renter;
import com.payrent.domain.YearPay;
import com.peter.util.UtilDate;

@Controller("rentercontroller")
public class RenterController {
	@Resource
	private IHouseDao housedao;
	@Resource
	private IRentOrderDao orderdao;
	@Resource
	private IYearPayDao yearpaydao;
	
	/**
	 * 获取租客租金信息
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/getrenterinfo.do")
	public void getrenterinfo(HttpServletRequest request,HttpServletResponse response) throws IOException,java.text.ParseException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Renter renter = (Renter) request.getSession().getAttribute("renter");
		JSONObject jo = JSONObject.fromObject(renter);
		if(renter!=null){
			String telephone = renter.getTelephone();
			if(telephone!=null && telephone.length()>0){
				List<House> listhouse = housedao.findByTelephone(telephone);	//一个手机号对应多套房子
				House house;
				if(listhouse.size()!=0){
					JSONArray ja = JSONArray.fromObject(listhouse);
					int index=0;
					SimpleDateFormat sdf;
					Date now = new Date();
					String date;
					Date rentdate;
					Date dbdate;
					for(int i=0;i<listhouse.size();i++){
						house = listhouse.get(i);
						sdf = new SimpleDateFormat("yyyy-MM-dd");	
						date = house.getDate();
						rentdate = sdf.parse(date);
						if(rentdate.getTime()-now.getTime()<7*24*60*60*1000 && rentdate.getTime()-now.getTime()>-24*60*60*1000){			//距离交租日7天内
							List<RentOrder> listorder = orderdao.findByTelephone(telephone,house.getHouse_id());//查订单交租日有无交租记录
							RentOrder order;
							sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							for(int j=0;j<listorder.size();j++){
								order = listorder.get(j);
								date = order.getDate();
								dbdate = sdf.parse(date);
								if(rentdate.getTime()-dbdate.getTime()<7*24*60*60*1000 && rentdate.getTime()-dbdate.getTime()>-24*60*60*1000){			//7日内有无交租记录								
									ja.remove(i-index);		//交了则移除
									index++;
									break;
								}
							}				
						}else{
							ja.remove(i-index);		//不在交租日7天内，移除
							index++;
						}
					}
					
					//统计该付房租的房子
					if(ja.size()!=0){
						jo.put("house", ja.toString());//存在需要付租金的房子(集合)
					}
				}
				out.print(jo.toString());
			}else{
				out.print("error");					//租客未绑定手机号
			}
		}else{
			out.print("error");						//租客未登录
		}
	}
	
	/**
	 * 申请年付
	 */
	@RequestMapping("/applyyearpay.do")
	public void applyyearpay(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); 
		Renter renter = (Renter) request.getSession().getAttribute("renter");
		if(renter!=null){
			String houseid = request.getParameter("house_id");
			String telephone = request.getParameter("telephone");
			String name = URLDecoder.decode(request.getParameter("name"),"utf-8");
			YearPay yp = new YearPay(houseid,name,telephone,UtilDate.getDateFormatter(),"申请中");
			yearpaydao.add(yp);
			out.print("success");
		}else{
			out.print("error");
		}
	}
	/**
	 * 查看有无申请年付
	 */
	@RequestMapping("/yearpayornot.do")
	public void yearpayornot(HttpServletRequest request,HttpServletResponse response) throws IOException,java.text.ParseException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Renter renter = (Renter) request.getSession().getAttribute("renter");
		if(renter!=null){
			String telephone = renter.getTelephone();
			List<YearPay> list = yearpaydao.findByTelephone(telephone);
			if(list.size()==0){
				out.print("no");
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String date = list.get(list.size()-1).getDate();
				Long d  = sdf.parse(date).getTime();
				if(new Date().getTime()-d<365*24*60*60*1000){
					out.print("yes");
				}else{
					out.print("no");
				}
			}
		}else{
			out.print("error");
		}
	}
}
