package com.daqian.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;
import java.util.Timer;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;



import org.springframework.stereotype.Controller;

import com.daqian.dao.DAO;
import com.daqian.dao.impl.JdbcDAO;
import com.daqian.entity.Productinfos;
import com.daqian.entity.UserAssets;
import com.daqian.entity.purchase;

@Controller
public class MyTask extends java.util.TimerTask implements Servlet{
	private static final long serialVersionUID = 1L;
	/**
	 * 定时对购买时间进行判断
	 */
	public void run() {
		// TODO Auto-generated method stub
		System.out.println("success");
		DAO jdao = new JdbcDAO();
		List<purchase> plist = jdao.findByState("成功");		//获取状态成功的用户集合
		//对状态成功的用户集合进行遍历
		for (int i = 0; i < plist.size(); i++) {
			UserAssets u = jdao.findByUsername(plist.get(i).getUsername()); 	//根据当前用户查询用户资产
			Productinfos p = jdao.findByPname(plist.get(i).getProductname());	//根据当前产品名查询周期
			String d = plist.get(i).getStartdate();				//根据当前用户获取产品开始时间
			String lbdate = plist.get(i).getLastbackdate();		//根据当前用户获取上一次返还时间
			String lbd[] = lbdate.split("-");					//分割上一次获得收益时间年月日
			String a[] = d.split("-");							//分隔产品开始时间获取年月日
			Date da = new Date();								
			SimpleDateFormat bartDateFormat = new SimpleDateFormat
				("YYYY-MM-dd"); 
			String dd = bartDateFormat.format(da);				//获取当前时间
			int monthoryear=plist.get(i).getMonthoryear();		//获取年月
			//月付
			if(monthoryear==1){		
					//上一次回款时间month+1
					int lyear=Integer.parseInt(lbd[0]);
					int lmonth=Integer.parseInt(lbd[1]+1);
					int lday=Integer.parseInt(lbd[2]);
					//月份大于12年份+1月份-12
					if(lmonth>12){
						lmonth=lmonth-12;
						lyear=lyear+1;
					}
					if(lday>=30 && lmonth==2 && lyear%4==0){
						lday=29;
					}
					if(lday>=29 && lmonth==2 && lyear%4!=0){
						lday=28;
					}
					if(lday==31){
						lday=30;
					}
					String date1 = lyear+"-"+lmonth+"-"+lday;	//上一次回款时间month+1日期
					//当前日期与上一次日期+1进行对比
					if(dd.equals(date1)){						
						double earned = plist.get(i).getEarned();				//获取利息						
						double aa = u.getAvailablemoney()+earned/p.getCycle();	//可用金额 增加利息						
						double bb = u.getResidualmoney()+earned/p.getCycle();	//余额 增加利息						
						UserAssets u1 = new UserAssets();						//根据当前用户添加数据
						u1.setAvailablemoney(aa);
						u1.setResidualmoney(bb);
						u1.setUsername(plist.get(i).getUsername());
						jdao.updateByusername(u1);
						jdao.updateLastbackdateById(date1, plist.get(i).getId());//更改上次付款时间
					}
					//分隔开始时间 获得产品到期时间
					int year = Integer.parseInt(a[0]);
					int month = Integer.parseInt(a[1]+p.getCycle());
					int day = Integer.parseInt(a[2]);
					String date2 = year+"-"+month+"-"+day;
					//月份小于12年份-1月份+12
					while(month>12){
							month=month-12;
							year=year+1;
					}
					if(day>=30 && month==2 && year%4==0){
						day=29;
					}
					if(day>=29 && month==2 && year%4!=0){
						day=28;
					}
					if(day==31){
						day=30;
					}
					//判断到期时间与当前时间
					if(dd.equals(date2)){
						//到期可用金额 余额 理财金额计算 修改
						double aa = u.getRolemoney()-plist.get(i).getMoney();
						double bb = u.getAvailablemoney()+plist.get(i).getMoney();
						double cc = u.getResidualmoney()+plist.get(i).getMoney();
						UserAssets u1 = new UserAssets();
						u1.setRolemoney(aa);
						u1.setAvailablemoney(bb);
						u1.setResidualmoney(cc);
						jdao.updateByCycle(u1);			//到期返还理财金额
						jdao.updatePurchase(plist.get(i).getStartdate(), plist.get(i).getProductname());
					}
			}
			//年付
			if(monthoryear==2){	
				if(p.getCycle()<=12){
					int year = Integer.parseInt(a[0]);
					int month = Integer.parseInt(a[1]+p.getCycle());
					int day = Integer.parseInt(a[2]);
					String date2 = year+"-"+month+"-"+day;
					//月份大于于12年份-1月份+12
					if(month>12){
						month=month-12;
						year=year+1;
					}
					if(day>=30 && month==2 && year%4==0){
						day=29;
					}
					if(day>=29 && month==2 && year%4!=0){
						day=28;
					}
					if(day==31){
						day=30;
					}
					if(dd.equals(date2)){
						//到期修改余额可用金额
						//获取利息
						double earned = plist.get(i).getEarned();
						//可用金额 增加利息
						double eava = u.getAvailablemoney()+earned;
						//余额 增加利息
						double bres = u.getResidualmoney()+earned;
						//根据当前用户添加数据
						UserAssets u1 = new UserAssets();
						u1.setAvailablemoney(eava);
						u1.setResidualmoney(bres);
						u1.setUsername(plist.get(i).getUsername());
						jdao.updateByusername(u1);
						jdao.updateLastbackdateById(date2, plist.get(i).getId());
						//到期可用金额 余额 理财金额计算 修改
						double aa = u.getRolemoney()-plist.get(i).getMoney();
						double bb = u.getAvailablemoney()+plist.get(i).getMoney();
						double cc = u.getResidualmoney()+plist.get(i).getMoney();
						UserAssets u2 = new UserAssets();
						u1.setRolemoney(aa);
						u1.setAvailablemoney(bb);
						u1.setResidualmoney(cc);
						jdao.updateByCycle(u2);
						//到期修改状态为完成
						jdao.updatePurchase(plist.get(i).getStartdate(), plist.get(i).getProductname());
					}
				}
				if(p.getCycle()>12){
					int year1 = Integer.parseInt(lbd[0]+1);
					int month1 = Integer.parseInt(lbd[1]);
					int day1 = Integer.parseInt(lbd[2]);
					//获得上次返还收益+1年的时间
					if(day1>=29 && month1==2 && year1%4!=0){
						day1=28;
					}
					if(day1>=30 && month1==2 && year1%4==0){
						day1=29;
					}
					String date1 = year1+"-"+month1+"-"+day1;
					
					//判断时间
					if(dd.equals(date1)){
						double earned = plist.get(i).getEarned();
						double eava = u.getAvailablemoney()+earned/p.getCycle()*12;
						double bres = u.getResidualmoney()+earned/p.getCycle()*12;
						UserAssets u1 = new UserAssets();
						u1.setAvailablemoney(eava);
						u1.setResidualmoney(bres);
						u1.setUsername(plist.get(i).getUsername());		
						jdao.updateByusername(u1);									//添加收益
						jdao.updateLastbackdateById(date1, plist.get(i).getId());	//
					}
					//获得到期时间
					int year2 = Integer.parseInt(a[0]+p.getCycle()/12);
					String date2 = year2+"-"+month1+"-"+day1;
					if(date2.equals(plist.get(i).getStartdate())){
						//到期返还理财金额
						//到期可用金额,余额增加.理财金额减少
						double aa = u.getRolemoney()-plist.get(i).getMoney();
						double bb = u.getAvailablemoney()+plist.get(i).getMoney();
						double cc = u.getResidualmoney()+plist.get(i).getMoney();
						UserAssets u1 = new UserAssets();
						u1.setRolemoney(aa);
						u1.setAvailablemoney(bb);
						u1.setResidualmoney(cc);
						//到期返还理财金额
						jdao.updateByCycle(u1);
						jdao.updatePurchase(plist.get(i).getStartdate(), plist.get(i).getProductname());
					}
				}		
			}
		}
	}
//	
//	/**
//	 * 点击开始计时
//	 */
//	@RequestMapping("/index1.do")
//	public void indexa(){
//		Timer timer = new Timer(true);
//		timer.schedule(new MyTask(), 1000, 60*60*1000);
//		System.out.println("===========TIME RUNNING========");
////			List<Productinfos> list = pdao.all();
//			
////			for (int j = 0; j < list.size(); j++) {
////				System.out.println(list.get(j).getPid());
////			}
//	    	
//			 while(true){
//				 try{
//					 int in = System.in.read(); 
//					 if(in == 's'){
//						 timer.cancel();
//						 break;
//					 }
//				 } catch (IOException e){
//					 e.printStackTrace();  
//				 }
//			 }  
//	}

	public void destroy() {
		// TODO Auto-generated method stub
		System.out.println("cancel");
		Timer timer = new Timer(true);
		timer.cancel();	
	}

	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return null;
	}

	public String getServletInfo() {
		// TODO Auto-generated method stub
		return null;
	}

	public void init(ServletConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		Timer timer = new Timer(true);
		timer.schedule(new MyTask(),1000,60*60*1000);
//			List<Productinfos> list = pdao.all();
			System.out.println("=========time running=================");
//			for (int j = 0; j < list.size(); j++) {
//				System.out.println(list.get(j).getPid());
//			}
	    	
			/* while(true){
				 try{
					 int in = System.in.read(); 
					 if(in == 's'){
						 timer.cancel();
						 break;
					 }
				 } catch (IOException e){
					 e.printStackTrace();  
				 }
			 }  */
		
	}
	public void service(ServletRequest arg0, ServletResponse arg1)
			throws ServletException, IOException {
		
	}
}

