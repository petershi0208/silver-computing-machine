package com.daqian.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.PurchaseDao;
import com.daqian.entity.purchase;

@Controller("zczlcontroller")
public class zczlController {
	
	@Resource
	private PurchaseDao purchasedao;
	
	@RequestMapping("/showproduct.do")
	public void product(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String page1 = request.getParameter("page");
		if(page1==null||page1==""){
			return;
		}
		int page = Integer.parseInt(page1);
	
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		
		
		
		List<purchase> p = purchasedao.findByName(username,page);
		JSONArray obj = JSONArray.fromObject(p);
		String jsonStr  = obj.toString();
		out.println(jsonStr);
	//	System.out.println(jsonStr);
	}
}
