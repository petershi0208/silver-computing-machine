package com.yqwan.ht.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.IPromoterrecordDao;
import com.yqwan.dao.ITradeDao;
import com.yqwan.dao.IUserDao;
import com.yqwan.domain.Promoter;
import com.yqwan.domain.Promoterrecord;
import com.yqwan.domain.User;
@Controller
public class PromoterController {
	@Resource
	private IPromoterrecordDao ipdao;
	@Resource
	private IUserDao iudao;
	@Resource
	private ITradeDao itdao;
	/**
	 * 分页查询分区
	 * 根据游戏名和全部查询
	 */
	@RequestMapping("/administrator/promoter.do")
	public String promoter(HttpServletRequest request) throws UnsupportedEncodingException{
		String curpage = request.getParameter("page");		//获取当前页
		String userid = request.getParameter("userid");	//获取游戏名
		String date = request.getParameter("date");	//获取日期
		if(userid!=null && userid!=""){
			userid = URLDecoder.decode(userid,"UTF-8");
		}
		if(date!=null && date!=""){
			date = URLDecoder.decode(date,"UTF-8");
		}
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			if(currentpage>0){
				List<Promoterrecord> promoter = ipdao.paging(userid,date,(currentpage-1)*10,10);//分页查询
				request.setAttribute("promoter", promoter);
			}
		}else{
			List<Promoterrecord> promoter = ipdao.paging(userid,date,0,10);//分页查询
			request.setAttribute("promoter", promoter);
		}
		
		int count = ipdao.count(userid,date);		//总页数
		request.setAttribute("userid", userid);
		request.setAttribute("date", date);
		request.setAttribute("count", count);
		return "administratorht/template/user/promoter";
	}
	
	/**
	 * 分页查询分区
	 * 根据游戏名和全部查询
	 */
	@RequestMapping("/administrator/promotertotal.do")
	public String promotertotal(HttpServletRequest request) throws UnsupportedEncodingException{
		String curpage = request.getParameter("page");		//获取当前页
		String userid = request.getParameter("userid");	    //获取游戏名
		if(userid!=null && userid!=""){
			userid = URLDecoder.decode(userid,"UTF-8");
		}
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			if(currentpage>0){
				List<Promoterrecord> total = ipdao.total(userid,(currentpage-1)*10,10);//分页查询
				request.setAttribute("total", total);
			}
		
		}else{
			List<Promoterrecord> total = ipdao.total(userid,0,10);//分页查询
			request.setAttribute("total", total);
		}
		
		int count = ipdao.totalcount(userid);		//总页数
		request.setAttribute("userid", userid);
		
		request.setAttribute("count", count);
		
		
		return "administratorht/template/user/promotertotal";
	}
	/**
	 * 修改双表状态
	 * 根据双表id
	 */
	@RequestMapping("/administrator/prstateup.do")
	public String prstateup(HttpServletRequest request) throws UnsupportedEncodingException{
		String pcid1 =request.getParameter("pcid");			//pcid
		String prid1 = request.getParameter("prid");	    //prid
		String pcstate = request.getParameter("pcstate");	//获取pc状态
		String prstate = request.getParameter("prstate");	//获取pr状态
		String url = request.getParameter("url");			//获取地址
		String date = request.getParameter("date");
		String userid = request.getParameter("userid");
		String page = request.getParameter("page");
		int prid = 0;
		int pcid = 0;
		if(pcid1!=null && pcid1!=""){
			pcid = Integer.parseInt(pcid1);
		}
		if(prid1!=null && prid1!=""){
			prid = Integer.parseInt(prid1);
		}
		
//		System.out.println(pcstate+"1"+prstate);
		Promoter pr = new Promoter();
		Promoterrecord pc = new Promoterrecord();
		if(pcstate!=null){
			if(pcstate.equals("yj")){
				pc.setState("已结算");
//				System.out.println();
			}else if(pcstate.equals("dj")){
				pc.setState("待结算");
			}
		}
		
		if(prstate!=null){
			if(prstate.equals("zc")){
				pr.setState("异常");
			}else if(prstate.equals("yf")){
				pr.setState("正常");
			}
		}
		pr.setId(prid);
		pc.setId(pcid);
		pc.setPromoter(pr);
		HttpSession session = request.getSession();
		if(session.getAttribute("admin")!=null){
			ipdao.update(pc);
		}	
		if(url.equals("promoter")){
			return "redirect:/administrator/promoter.do?userid="+userid+"&date="+date+"&page="+page;
		}else if(url.equals("promotertotal")){
			return "redirect:/administrator/promotertotal.do?userid="+userid;
		}
		return null;
		
	}
	/**
	 * 修改双表状态
	 * 根据双表id
	 */
	@RequestMapping("/administrator/upstate.do")
	public String upstate(HttpServletRequest request) throws UnsupportedEncodingException{
		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String date = sdf.format(now);
		String[] dd = date.split("-");
		int b = Integer.parseInt(dd[1])-1;
		int c=Integer.parseInt(dd[0]);
		if(b==0){
			b=12;
			c=c-1;
		}
		if(b<10){
			date = c+"-0"+b;
		}else{
			date = c+"-"+b;
		}
		List<Promoterrecord> proc = ipdao.findByDate(date);
		Promoterrecord pc = new Promoterrecord();
		Promoter pr1 = new Promoter();
		for (Promoterrecord promoterrecord : proc) {
			int person = promoterrecord.getRecommendperson();
			int id = promoterrecord.getId();
			if(person>=20){
				Promoter pr = promoterrecord.getPromoter();
				String recommendcode = pr.getRecommendcode();
				List<User> userlist = iudao.findByCode(recommendcode,date);
				int count=0;
				for (User user : userlist) {
					int a = itdao.ifCount(user.getUserid());
					count = count+a;
				}
				if(count>0){
					pc.setId(id);
					pc.setState("待结算");
					pc.setPromoter(pr1);
					ipdao.update(pc);
				}else{
					pc.setId(id);
					pc.setState("未达标");
					pc.setPromoter(pr1);
					ipdao.update(pc);
				}
			}else{
				pc.setId(id);
				pc.setState("未达标");
				pc.setPromoter(pr1);
				ipdao.update(pc);	
			}
		}
		return "redirect:/administrator/promoter.do";
	}
	
}
