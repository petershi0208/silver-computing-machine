package com.daqian.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.CreditorDao;
import com.daqian.dao.NewsDAO;
import com.daqian.dao.ProductinfosDAO;
import com.daqian.dao.PurchaseDao;
import com.daqian.dao.SubproductDAO;
import com.daqian.dao.UserDao;

import com.daqian.dao.UserAssetsDao;
import com.daqian.entity.Creditor;
import com.daqian.entity.News;
import com.daqian.entity.Productinfos;
import com.daqian.entity.Subproduct;
import com.daqian.entity.User;
import com.daqian.entity.UserAssets;
import com.daqian.entity.purchase;


@Controller("indexController")
public class productsController {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Resource
	private ProductinfosDAO pdao;
	@Resource
	private PurchaseDao pcdao;
	@Resource
	private UserAssetsDao uadao;
	@Resource
	private SubproductDAO sdao;
	@Resource
	private CreditorDao cdao;
	@Resource
	private NewsDAO ndao;
	
	@RequestMapping("/moreproduct.do")
	public String moreproduct(HttpServletRequest request){
		int page=1;
		String page1 =request.getParameter("page");
		Productinfos p = pdao.findCount();
		int count = p.getCount();
		count = (int) Math.ceil((count+0.0)/10);
//		System.out.println(count);
		if(page1!=null && page1!=""){
			page = Integer.parseInt(page1);
		}
		List<Productinfos> list = pdao.paging((page-1)*10, 10);
		List<Productinfos> minlist = pdao.findByminsun();
		List<Productinfos> maxlist = pdao.findBymaxsun();
		request.setAttribute("minlist", minlist);
		request.setAttribute("maxlist", maxlist);
		request.setAttribute("aaa", list);	
		request.setAttribute("page", page);
		request.setAttribute("count", count);
		List<News> nlist = ndao.all();
		request.setAttribute("nlist", nlist);
		return "user/moreproduct";	
	}
	
	@RequestMapping("/products.do")
	public String products(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		Productinfos p = pdao.findById(id);
		Subproduct s = sdao.findByPId(id);
		Creditor cc = cdao.findById(Integer.parseInt(s.getSperson()));
		List<purchase> pc=pcdao.findByPaname(p.getProductname());
		request.setAttribute("cc", cc);
		request.setAttribute("pc", pc);
		request.setAttribute("s", s);
		request.setAttribute("p", p);
		
		Productinfos minp = pdao.findminByid(id);
		Productinfos maxp = pdao.findmaxByid(id);
		request.setAttribute("minp", minp);
		request.setAttribute("maxp", maxp);
		
		return "user/products";
	}
	
	@RequestMapping("/product.do")
	public String product(HttpServletRequest request){
		List<Productinfos> list = pdao.all();
		List<Productinfos> minlist = pdao.findByminsun();
		List<Productinfos> maxlist = pdao.findBymaxsun();
		request.setAttribute("minlist", minlist);
		request.setAttribute("maxlist", maxlist);
		request.setAttribute("aaa", list);
		return "user/product";
	}
	
	@RequestMapping("/producttb.do")
	public void producttb(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int pid = Integer.parseInt(request.getParameter("pid"));
		int monthoryear = Integer.parseInt(request.getParameter("monthoryear"));
		int amount = Integer.parseInt(request.getParameter("amount"));
		Productinfos p = pdao.findmoneyByid(pid, monthoryear, amount);
		double yearreturn = p.getYearreturn();
		out.print(yearreturn);
	}
	
	@RequestMapping("/prodd.do")
	public String prodd(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int pid = Integer.parseInt(request.getParameter("ppid"));
		int amount = Integer.parseInt(request.getParameter("aamount"));
		double vyear = Double.parseDouble(request.getParameter("vvyear"));
		String pname = request.getParameter("ppname");
//		String paypwd = request.getParameter("uname");
		int monthoryear=Integer.parseInt(request.getParameter("monthoryear"));
		
		//获得用户名
		HttpSession usernameSession = request.getSession();
		String username = (String) usernameSession.getAttribute("username");
		
		//计算商品余额
		Productinfos p = pdao.findById(pid);
		int lastmoney = p.getLastmoney()-amount;
		//修改剩余额度
		if(pname!=""){
			pdao.updateLastmoneyById(lastmoney, pid);
		}
		
		//添加购买信息
		purchase pc = new purchase();
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format( now ); 
	//	System.out.println(date);
		int number = amount/100;
		double earned = amount*vyear/12*p.getCycle()/100;
		String state="冻结";
		if(pname!=""){
			pc.setUsername(username);
			pc.setMoney(amount);
			pc.setDate(date);
			pc.setState(state);
			pc.setProductname(pname);
			pc.setAmount(number);
			pc.setExpectedannual(vyear);
			pc.setEarned(earned);
			pc.setMonthoryear(monthoryear);
			pcdao.add(pc);
		}
		
	//	UserAssets u = new UserAssets();
		//查询用户资产
		UserAssets ua = uadao.findByUsername(username);
		double availablemoney=ua.getAvailablemoney()-amount;
		
		//当lastmoney为0时执行
		if(lastmoney==0){
			List<purchase> list = pcdao.findByPname(pname);	
//			SimpleDateFormat dfa = new SimpleDateFormat("yyyy-MM-dd");
//			String datea = dfa.format(now);
			//修改购买此产品的用户状态为成功
			pcdao.updateState(date,date,pname);
			//修改购买此产品用户的资产信息
			for (int i = 0; i < list.size(); i++) {	
				UserAssets uas = uadao.findByUsername(list.get(i).getUsername());
				double residualmoney = uas.getResidualmoney()-list.get(i).getMoney();
				double rolemoney = uas.getRolemoney()+list.get(i).getMoney();
	//			System.out.println(residualmoney);
	//			System.out.println(rolemoney);
				uadao.updateMoneyByStateAndPname(rolemoney,residualmoney,list.get(i).getUsername());
			}	
		}
		//修改用户资产
		uadao.update(availablemoney,username);
		
		HttpSession availableSession = request.getSession();
		availableSession.setAttribute("availablemoney", availablemoney);
		availableSession.setMaxInactiveInterval(72000);
		
		//获取一共多少多少页
		List<purchase> l = pcdao.findNum(username);
		int totalpage = l.size();
		if(totalpage%3==0){
			totalpage = totalpage/3;
		}else{
			totalpage = totalpage/3 +1;
		}		
		HttpSession pagesession = request.getSession();
		pagesession.setAttribute("total", totalpage);
		pagesession.setMaxInactiveInterval(72000);
		
		
		return "redirect:/tomember.do";
		
	}
	
//	private Timer timer = null; 
//	public static void main(String[] args){
//		Timer timer = new Timer();
//		timer.schedule(new MyTask(), 1000, 1000);
//		 while(true){
//			 try{
//				 int in = System.in.read(); 
//				 if(in == 's'){
//					 timer.cancel();
//					 break;
//				 }
//			 } catch (IOException e){
//				 e.printStackTrace();  
//			 }
//		 }
//	}
//	static class MyTask extends java.util.TimerTask{      
//        public void run(){     
//            System.out.println("________");     
//        }     
//    }
//	public void contextDestroyed(ServletContextEvent event) {
//		
//		timer = new Timer(true); 
//		event.getServletContext().log("定时器已启动");
//		timer.schedule(new MyTask(),0,5*1000); 
//		 event.getServletContext().log("已经添加任务");
//	}
//
//	public void contextInitialized(ServletContextEvent event) {
//	
//	}
	
	/**
	 * 异步验证支付密码
	 * @throws IOException 
	 */
	@RequestMapping("/productpay.do")
	public void productpay(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
			
		String paypwd = request.getParameter("paypwd");
		String username = request.getParameter("username");
		
		//MD5加密
		paypwd = DigestUtils.md5Hex(getContentBytes(paypwd, "utf-8"));
		
		UserAssets ua = uadao.findByName(username);
		String paypassword = ua.getPaypassword();
//		System.out.println(paypassword+paypwd);
		if(paypassword.equals(paypwd)){
			out.print("成功");
		}else{
			out.print("支付密码错误");
		}
	}
	
	/**
	 * MD5
	 * @param content
	 * @param charset
	 * @return
	 */
	 private static byte[] getContentBytes(String content, String charset) {
	        if (charset == null || "".equals(charset)) {
	            return content.getBytes();
	        }
	        try {
	            return content.getBytes(charset);
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("MD5签名过程中出现错误,指定的编码集不对,您目前指定的编码集是:" + charset);
	        }
	    }
	
}
