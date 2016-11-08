package com.daqian.controller;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.NewsDAO;
import com.daqian.dao.ProductinfosDAO;
import com.daqian.dao.PurchaseDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.News;
import com.daqian.entity.Productinfos;
import com.daqian.entity.User;
import com.daqian.entity.purchase;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller("index")
public class indexController{
	@Resource
	private ProductinfosDAO pdao;
	@Resource
	private UserDao udao;
	@Resource
	private PurchaseDao pcdao;
	@Resource
	private NewsDAO ndao;
	int count=2150;
	
	@RequestMapping("/index.do")
	public String index(HttpServletRequest request){
		
		count++;
		System.out.println("=================大钱访问次数"+count);
		List<Productinfos> list = pdao.paging(0, 5);
		List<Productinfos> minlist = pdao.findByminsun();
		List<Productinfos> maxlist = pdao.findBymaxsun();
		List<News> nlist = ndao.all();
		User user = udao.findCount();
		purchase money = pcdao.findSum();
		purchase earned = pcdao.findSumEarned();
		int totaluser = user.getCount()+1246;
		double totalm = money.getSum();
		double totale = earned.getSum();
		int totalmoney = (int) Math.ceil(totalm)+3574900;
		int totalearned = (int) Math.ceil(totale)+292345;
		request.setAttribute("totaluser", totaluser);
		request.setAttribute("totalmoney", totalmoney);
		request.setAttribute("totalearned", totalearned);
		request.setAttribute("minlist", minlist);
		request.setAttribute("maxlist", maxlist);
		request.setAttribute("aaa", list);
		request.setAttribute("nlist", nlist);
		return "user/index";	
	}
	@RequestMapping("/moreindex.do")
	public void moreindex(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int page =Integer.parseInt(request.getParameter("num"));
		List<Productinfos> list = pdao.paging(page, 5);
		JSONArray array = new JSONArray();
		array = JSONArray.fromObject(list);
//		System.out.println(array);
		out.print(array);
			
	}
	public void indexb(){ 
		List<Productinfos> list = pdao.all();
		System.out.println(list.get(0).getPdate());
	}
	
	
	
}
