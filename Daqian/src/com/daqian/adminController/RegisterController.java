package com.daqian.adminController;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.BorrowDao;
import com.daqian.dao.LoginfosDAO;
import com.daqian.dao.ProductinfosDAO;
import com.daqian.dao.PurchaseDao;
import com.daqian.dao.UserAssetsDao;
import com.daqian.entity.Loginfoss;
import com.daqian.entity.Productinfos;
import com.daqian.entity.UserAssets;
import com.daqian.entity.borrow;
import com.daqian.entity.purchase;

@Controller
public class RegisterController {
	@Resource
	private BorrowDao bdao;
	@Resource
	private LoginfosDAO ldao;
	@Resource
	private PurchaseDao pcdao;
	@Resource 
	private ProductinfosDAO pdao;
	@Resource
	private UserAssetsDao uadao;
	
	@SuppressWarnings("unused")
	@RequestMapping("addpurchase")
	private void addpurchase(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		int pid = Integer.parseInt(request.getParameter("ppid"));
		int amount = Integer.parseInt(request.getParameter("aamount"));
		double vyear = Double.parseDouble(request.getParameter("vvyear"));
		String username = request.getParameter("username");
		String pname =URLDecoder.decode(request.getParameter("ppname"),"utf-8") ;
//		String paypwd = request.getParameter("uname");
//		int monthoryear=Integer.parseInt(request.getParameter("monthoryear"));
		UserAssets uaa = uadao.findByName(username);
		if(uaa==null){
			out.print("用户不存在");
		}else{
			int aamount = (int) uaa.getAvailablemoney();
			if(amount<=aamount){
				//计算商品余额
				Productinfos p = pdao.findById(pid);
				int lastmoney = p.getLastmoney()-amount;
				System.out.println(p.getLastmoney());
				//修改剩余额度
				pdao.updateLastmoneyById(lastmoney, pid);
				
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
					pc.setMonthoryear(2);
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
				out.print("success");
				
			}else{
				out.print("用户资金不足");
			}
		}
	}
}
