package com.daqian.adminController;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.BorrowDao;
import com.daqian.dao.LoginfosDAO;
import com.daqian.entity.Loginfoss;
import com.daqian.entity.borrow;

@Controller
public class BorrowController {
	@Resource
	private BorrowDao bdao;
	@Resource
	private LoginfosDAO ldao;
	
	/**
	 * 
	 * 理财产品信息
	 * 查询所有
	 */
	@RequestMapping("/borrow-list.do")
	public String borrowlist(HttpServletRequest request){
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		if(date1!="" && date2!="" && date1!=null && date2!=null){
			List<borrow> blist = bdao.findByDate(date1, date2);
			request.setAttribute("blist", blist);
		}else{
			List<borrow> blist = bdao.all();
			request.setAttribute("blist", blist);
		}
		return "Administrator/template/borrow/borrow-list";
	}
	/**
	 * 修改状态
	 */
	@RequestMapping("/borrow-update1.do")
	public void borrowupdate1(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String state="已审核";
		bdao.updateState(state,id);
		//加入日志
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(now);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("borrow");
		log.setDate(date);
		log.setContent("修改状态为已审核");
		log.setType("成功");
		ldao.add(log);
		out.print("已审核");
	}
	@RequestMapping("/borrow-update2.do")
	public void borrowupdate(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String state="待审核";
		bdao.updateState(state,id);
		//加入日志
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(now);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("borrow");
		log.setDate(date);
		log.setContent("修改状态为待审核");
		log.setType("修改成功");
		ldao.add(log);
		
		out.print("待审核");
	}
	
	@RequestMapping("/looo.do")
	public String looo(HttpServletRequest request, HttpServletResponse response) throws IOException{
		return "WEB-INF/Administrator/index";
	}
}
