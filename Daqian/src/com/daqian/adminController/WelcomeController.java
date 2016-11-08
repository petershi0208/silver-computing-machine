package com.daqian.adminController;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.BorrowDao;
import com.daqian.dao.LoginfosDAO;
import com.daqian.dao.NewsDAO;
import com.daqian.dao.ProductinfosDAO;
import com.daqian.dao.PurchaseDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.Loginfoss;
import com.daqian.entity.News;
import com.daqian.entity.Productinfos;
import com.daqian.entity.User;
import com.daqian.entity.borrow;
import com.daqian.entity.purchase;


@Controller
public class WelcomeController {
	@Resource
	private BorrowDao bdao;
	@Resource
	private PurchaseDao pdao;
	@Resource
	private UserDao udao;
	@Resource
	private NewsDAO ndao;
	@Resource
	private ProductinfosDAO prdao;
	@Resource
	private LoginfosDAO ldao;
	
	@RequestMapping("/log-list.do")
	public String loglist(HttpServletRequest request){
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		if(date1!=null && date1!="" && date2!=null && date2!=""){
			List<Loginfoss> llist=ldao.findBydate(date1, date2);
			request.setAttribute("llist", llist);
		}else{
			List<Loginfoss> llist = ldao.all();
			request.setAttribute("llist", llist);
		}
		return "Administrator/template/system/log-list";
	}
	
	
	@RequestMapping("/welcome.do")
	public String borrow(HttpServletRequest request){
		Date now = new Date();
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");
		String date = sfd.format(now);
		String lbd[] = date.split("-");				//分割时间
		//计算昨天
		int day = Integer.parseInt(lbd[2])-1;
		int month = Integer.parseInt(lbd[1]);
		int year = Integer.parseInt(lbd[0]);
		if(day<=0){
			month=month-1;
			if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12){
				day = 31;
			}
			if(month==4 || month==6 || month==9 || month ==11){
				day = 30;
			}
			if(month==2 && year%4==0){
				day=29;
			}
			if(month==2 && year%4!=0){
				day=28;
			}
			if(month<=0){
				year = year-1;
				month = 12;
				day = 31;
			}
		}
		//计算上月
		int month1 = Integer.parseInt(lbd[1])-1;
		int year1 = Integer.parseInt(lbd[0]);
		if(month1<=0){
			year1=year1-1;
			month1=month1+12;
		}
		String today=lbd[0]+"-"+lbd[1]+"-"+lbd[2];	//今天
		String tomonth=lbd[0]+"-"+lbd[1];			//当月
		
		String today1=year+"-"+month+"-"+day;	//昨天
		String tomonth1=year1+"-"+month1;			//上月
		//计算产品数量
		Productinfos product = prdao.findCount();
		Productinfos productday = prdao.findCountByDay(today);
		Productinfos productday1 = prdao.findCountByDay(today1);
		Productinfos productmonth = prdao.findCountByMonth(tomonth);
		Productinfos productmonth1 = prdao.findCountByMonth(tomonth1);
		request.setAttribute("product", product);
		request.setAttribute("productday", productday);
		request.setAttribute("productday1", productday1);
		request.setAttribute("productmonth", productmonth);
		request.setAttribute("productmonth1", productmonth1);
		//计算新闻数量
		News news = ndao.findCount();
		News newsday = ndao.findCountByDay(today);
		News newsday1 = ndao.findCountByDay(today1);
		News newsmonth = ndao.findCountByMonth(tomonth);
		News newsmonth1 = ndao.findCountByMonth(tomonth1);
		request.setAttribute("news", news);
		request.setAttribute("newsday", newsday);
		request.setAttribute("newsday1", newsday1);
		request.setAttribute("newsmonth", newsmonth);
		request.setAttribute("newsmonth1", newsmonth1);
		//计算注册用户
		User user = udao.findCount();
		User userday = udao.findCountByDay(today);
		User userday1 = udao.findCountByDay(today1);
		User usermonth = udao.findCountByMonth(tomonth);
		User usermonth1 = udao.findCountByMonth(tomonth1);
		request.setAttribute("user", user);
		request.setAttribute("userday", userday);
		request.setAttribute("userday1", userday1);
		request.setAttribute("usermonth", usermonth);
		request.setAttribute("usermonth1", usermonth1);
		//计算投资金额
		purchase money = pdao.findSum();
		purchase moneyday = pdao.findSumByday(today);
		purchase moneyday1 = pdao.findSumByday(today1);
		purchase moneymonth = pdao.findSumBymonth(tomonth);
		purchase moneymonth1 = pdao.findSumBymonth(tomonth1);
		request.setAttribute("money",money);
		request.setAttribute("moneyday",moneyday);
		request.setAttribute("moneyday1",moneyday1);
		request.setAttribute("moneymonth",moneymonth);
		request.setAttribute("moneymonth1",moneymonth1);
		//计算收益
		purchase earned = pdao.findSumEarned();
		purchase earnedday = pdao.findSumEarnedByDay(today);
		purchase earnedday1 = pdao.findSumEarnedByDay(today1);
		purchase earnedmonth = pdao.findSumEarnedByMonth(tomonth);
		purchase earnedmonth1 = pdao.findSumEarnedByMonth(tomonth1);
		request.setAttribute("earned",earned);
		request.setAttribute("earnedday",earnedday);
		request.setAttribute("earnedday1",earnedday1);
		request.setAttribute("earnedmonth",earnedmonth);
		request.setAttribute("earnedmonth1",earnedmonth1);
		//已审核借款
		borrow audit = bdao.findCount("已审核");
		borrow auditday = bdao.findCountByDay("已审核",today);
		borrow auditday1 = bdao.findCountByDay("已审核",today1);
		borrow auditmonth = bdao.findCountByMonth("已审核",tomonth);
		borrow auditmonth1 = bdao.findCountByMonth("已审核",tomonth1);
		request.setAttribute("audit", audit);
		request.setAttribute("auditday", auditday);
		request.setAttribute("auditday1", auditday1);
		request.setAttribute("auditmonth", auditmonth);
		request.setAttribute("auditmonth1", auditmonth1);
		//未审核借款
		borrow notaudit = bdao.findCount("待审核");
		borrow notauditday = bdao.findCountByDay("待审核",today);
		borrow notauditday1 = bdao.findCountByDay("待审核",today1);
		borrow notauditmonth = bdao.findCountByMonth("待审核",tomonth);
		borrow notauditmonth1 = bdao.findCountByMonth("待审核",tomonth1);
		request.setAttribute("notaudit", notaudit);
		request.setAttribute("notauditday", notauditday);
		request.setAttribute("notauditday1", notauditday1);
		request.setAttribute("notauditmonth", notauditmonth);
		request.setAttribute("notauditmonth1", notauditmonth1);
		return "Administrator/template/welcome/welcome";
	}
}
