package com.yihuo.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.peter.util.UtilDate;
import com.yihuo.dao.IHouseDao;
import com.yihuo.domain.House;

@Controller("hellocontroller")
@RequestMapping("/house")
public class HouseController{
	@Resource
	private IHouseDao housedao;
	
	@RequestMapping(method=RequestMethod.GET)
	public void handleRequestGET(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		List<House> list = housedao.listAll();
		JSONArray obj = JSONArray.fromObject(list);
		String a = obj.toString();
		out.print(a);
	}
	@RequestMapping(method=RequestMethod.POST)
	public void handleRequestPOST(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String test = request.getParameter("test");
		out.print("POST"+test);
	}
	@RequestMapping(method=RequestMethod.DELETE)
	public void handleRequestDELETE(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String test = request.getParameter("test");
		out.print("DELETE"+test);
	}
	@RequestMapping(method=RequestMethod.PUT)
	public void handleRequestPUT(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String test = request.getParameter("test");
		out.print("PUT"+test);
	}
	
}
