package com.yqwan.pagecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import alex.zhrenjie04.wordfilter.WordFilterUtil;

import com.alipay.util.UtilDate;
import com.yqwan.dao.ICdkeyInfoDao;
import com.yqwan.dao.IGameDistrictDao;
import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.IPhonecodeDao;
import com.yqwan.dao.IPromoterDao;
import com.yqwan.dao.IPromoterrecordDao;
import com.yqwan.dao.ITradeDao;
import com.yqwan.dao.IUserDao;
import com.yqwan.domain.Cdkeyinfo;
import com.yqwan.domain.Gamedistrict;
import com.yqwan.domain.Gamelist;
import com.yqwan.domain.Phonecode;
import com.yqwan.domain.Promoter;
import com.yqwan.domain.Promoterrecord;
import com.yqwan.domain.Trade;
import com.yqwan.domain.User;
import com.yqwan.gamefactory.GamenameFactory;
import com.yqwan.gamefactory.Operation;
import com.yqwan.service.ImageDeal;
//import com.yqwan.service.Mail;
import com.yqwan.service.PictureUploadDemo;

/**
 * 
 * @author PeterShi
 *
 */

@Controller("member")
public class MemberController {
	@Resource
	private IUserDao userdao;
	@Resource
	private IPhonecodeDao phonecodedao;
	@Resource
	private IGameListDao gamelist;
	@Resource
	private IGameDistrictDao gamedistrict;
	@Resource
	private ITradeDao tradedao;
	@Resource
	private IPromoterDao promoterdao;
	@Resource
	private IPromoterrecordDao promoterrecorddao;
	
	@Resource
	private ICdkeyInfoDao cdkeyinfodao;
	
	/**
	 * 微信扫码判断有无支付
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/wxpaystate.do")
	public void wxpaystate(HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf8");
		PrintWriter out = response.getWriter();
		
		String trade_no = request.getParameter("tradeno");
		Trade trade = tradedao.findbytrade_no(trade_no);
		String state = trade.getState();
		if(state.equals("待付款")){
			out.print("wait");
		}else if(state.equals("完成")){
			out.print("success");
		}
	}
	
	
	/**
	 * 新版本会员中心手机号绑定
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping("/telephonein.do")
	public void telephonein(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
			
		String code = request.getParameter("code");
		String phone = request.getParameter("telephone");
		
		User userphone = userdao.findByTelephone(phone);
		if(userphone==null){
			User user = (User) request.getSession().getAttribute("user");
			String userid = user.getUserid();
			boolean flag = checkphonecode(phone,code);		
			if(flag){
				User user1212 = new User();
				user1212.setUserid(userid);
				user1212.setTelephone(phone);
				userdao.updateTelephone(user1212);			
				//用户重新绑定session
				User user1 = userdao.findByUsername(userid);
				HttpSession session = request.getSession();
				session.setAttribute("user", user1);
				session.setMaxInactiveInterval(36000);
				
				out.print(" ");
			}else{
				out.print("× 验证码不正确");
			}
		}else{
			out.print("×手机号已被绑定");
		}
		
		
	}
	
	/**
	 * 新版本会员中心手机号解绑
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping("/telephoneout.do")
	public void telephoneout(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
			
		String code = request.getParameter("code");
		String phone = request.getParameter("telephone");
		User user = (User) request.getSession().getAttribute("user");
		String userid = user.getUserid();
System.out.println(userid);
		boolean flag = checkphonecode(phone,code);		
		if(flag){
			userdao.updatephone(userid);			
			//用户重新绑定session
			User user1 = userdao.findByUsername(userid);
			HttpSession session = request.getSession();
			session.setAttribute("user", user1);
			session.setMaxInactiveInterval(36000);
			
			out.print(" ");
		}else{
			out.print("× 验证码不正确");
		}
	}
	/**
	 * 校验验证码
	 * @param telephone
	 * @param code
	 * @return
	 */
	private boolean checkphonecode(String telephone,String code){
		Phonecode pc = phonecodedao.findByphone(telephone);
		String dbcode = pc.getCode();
		if(!code.equals(dbcode)){
			return false;
		}else{
			phonecodedao.delete(telephone);
			return true;
		}	
	}
	
	/**
	 * 上传头像
	 * @throws IOException 
	 * @throws Exception 
	 */
	@RequestMapping("/uploadtouxiang.do")
	public void uploadtouxiang(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/javascript;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		List<String> list = new ArrayList<String>();
		Map<String,String> map =new HashMap<String, String>();
		PictureUploadDemo.pictureupload("d://AllPicture//yqwan//touxiang",list,map,request);
		
		boolean flag = ImageDeal.modifyImage(map, list);
		if(flag==true){
			User user1 = (User) request.getSession().getAttribute("user");
			User user = new User();
			user.setUserid(user1.getUserid());
			
			StringBuffer url = request.getRequestURL();
			String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
			user.setHeadpicture(tempContextUrl+"picture/yqwan/touxiang/"+UtilDate.getMonth()+"/"+list.get(0));
			userdao.updateHead(user);
			out.print("{\"message\":\"success\"}");
		}else{
			out.print("{\"message\":\"fail\"}");
		}	
	}
	
	/**
	 * 列出用户每月推广记录
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/allrecommendlist.do")
	public void allrecommendlist(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("userid");
		List<Promoterrecord> list = promoterrecorddao.listallrecommend(userid);
		JSONArray obj = JSONArray.fromObject(list);
		String all = obj.toString();
		out.print(all);
	}
	
	/**
	 * 跳转至推广员页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/toinvitation.do")
	public String toinvitation(HttpServletRequest request, HttpServletResponse response){
		User user = (User) request.getSession().getAttribute("user");
		String userid = user.getUserid();
		if(userid!=""||userid!=null){
			Promoter promoter = promoterdao.findByUserid(userid);
			if(promoter!=null){
				promoter = promoterinformation(promoter);
				request.setAttribute("promoter", promoter);			//获得推广者信息
			}
			
			String date = UtilDate.getMonthLine();
			Promoterrecord promoterrecord = new Promoterrecord();
			promoterrecord.setUserid(userid);
			promoterrecord.setDate(date);
			Promoterrecord pr = promoterrecorddao.findByUserid(promoterrecord);
			if(pr==null){		//初始化
				pr = new Promoterrecord();
				pr.setRecommendmoney(0);
				pr.setRecommendperson(0);
			}
			request.setAttribute("promoterrecord", pr);				//获得当月收益信息
			Promoterrecord allpr = promoterrecorddao.getAllRecord(userid);
			if(allpr==null){
				allpr = new Promoterrecord();
				allpr.setMoneysum(0);
				allpr.setPersonsum(0);
			}
			request.setAttribute("historyamount", allpr);			//获得历史总额，总人数

		
		}
		return "newMemberCenter/invitation";
	}
	
	/**
	 * 信息替换隐藏
	 * @param promoter
	 * @return
	 */
	private Promoter promoterinformation(Promoter promoter) {
		promoter.setName("*"+promoter.getName().substring(1));
		promoter.setAliaccount(promoter.getAliaccount().replaceAll(promoter.getAliaccount().substring(0,4), "****"));
		promoter.setTelephone(promoter.getTelephone().replaceAll(promoter.getTelephone().substring(3, 7), "****"));
		return promoter;
	}

	/**
	 * 申请成为推广员
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/spreadapply.do")
	public String spreadapply(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String realname = request.getParameter("realname");
		String aliaccount = request.getParameter("aliaccount");
		String telephone = request.getParameter("telephone");
		String qq = request.getParameter("qq");
		User user = (User)request.getSession().getAttribute("user");
		String userid = user.getUserid();
		
		Promoter ppp = promoterdao.findByUserid(userid);	//过滤掉已经存在的
		if(ppp!=null){
			return "redirect:/Yqwan/toindex.do";
		}
		if(realname!="" && aliaccount!="" && telephone!="" && qq!="" && userid!=""){
			String code = code();
			String date = UtilDate.getDateFormatter();
			Promoter promoter = new Promoter(userid,realname,aliaccount,telephone,qq,code,date,"正常");
			promoterdao.addNewPromoter(promoter);
		}
		return "redirect:toinvitation.do";
	}
	
	/**
	 * 随机生成6位数
	 * @return
	 */
	public static String code(){
		String number="";
		char[] chars = {'A','B','C','D','E','F','G','H','I','J',
				'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
				'1','2','3','4','5','6','7','8','9','0'};
		Random r= new Random();
		for(int i=0;i<6;i++){
			number+=chars[r.nextInt(chars.length)];
		}
		return number;
	}
	
	
	/**
	 * 获得玩家所有的游戏充值记录
	 */
	@RequestMapping("/allchargegame.do")
	public void Allchargegame(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("userid");
		List<Trade> list = tradedao.findAllByUserid(userid);
		JSONArray obj = JSONArray.fromObject(list);
		String all = obj.toString();
		out.print(all);
	}
	
		
	/**
	 * 跳转至礼包记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/togift.do")
	public String togift(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		User user = (User) request.getSession().getAttribute("user");
		String userid = user.getUserid();
		List<Cdkeyinfo> cdkeyinfopagelist = giftpage(1,userid);

		request.setAttribute("cdkeyinfopagelist", cdkeyinfopagelist);		//第一页数据
		
		List<Cdkeyinfo> list = cdkeyinfodao.findAllbyrepeitor(userid);
		int maxnum = list.size();
		request.setAttribute("list", maxnum);
		if(maxnum%8==0){
			maxnum = maxnum/8;
		}else{
			maxnum = maxnum/8+1;
		}	
		request.setAttribute("maxnum", maxnum);			//一共多少页
		
		
		return "newMemberCenter/gift";
	}
	
	/**
	 * 截止日期格式
	 * @param cdkeyinfopagelist
	 * @return
	 */
	private List<Cdkeyinfo> changelimittime(List<Cdkeyinfo> cdkeyinfopagelist) {
		for(int i=0;i<cdkeyinfopagelist.size();i++){
			String ac = cdkeyinfopagelist.get(i).getActivationdate();
			String limit = cdkeyinfopagelist.get(i).getTimelimit();
			Calendar calendar = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				if(ac!=null){
					date = sdf.parse(ac);
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			calendar.setTime(date);
			calendar.add(Calendar.DATE, Integer.parseInt(limit));
			String limitdate = sdf.format(calendar.getTime());
			cdkeyinfopagelist.get(i).setTimelimit(limitdate);
		}
		return cdkeyinfopagelist;
	}

	/**
	 * 分页礼包记录
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pagegift.do")
	public void pagegift(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		User user = (User) request.getSession().getAttribute("user");
		String userid = user.getUserid();	
		int num1 = Integer.parseInt(request.getParameter("num"));	//用于分页
		List<Cdkeyinfo> Cdkeyinfolist = giftpage(num1,userid);	
			JSONArray obj = JSONArray.fromObject(Cdkeyinfolist);				//java对象转json类型
			String list121 = obj.toString();
			out.print(list121);
	}
	
	/**
	 * 礼包码分页方法
	 * @param num1
	 * @param userid
	 * @return
	 */
	private List<Cdkeyinfo> giftpage(int num1,String userid){
		int num = 8*(num1-1);											//每页8个	
		//获取一共多少充值记录
//		List<Cdkeyinfo> cdkeylist = cdkeyinfodao.findAllbyrepeitor(userid);
//		int maxnum = cdkeylist.size();
//		if(maxnum%8==0){
//			maxnum = maxnum/8;
//		}else{
//			maxnum = maxnum/8+1;
//		}
		
		Cdkeyinfo key = new Cdkeyinfo();								//封装成对象传入mybatis
		key.setN(num);
		key.setReceiptor(userid);
		List<Cdkeyinfo> Cdkeyinfopagelist = cdkeyinfodao.findPagebyrepeitor(key);
		Cdkeyinfopagelist = changelimittime(Cdkeyinfopagelist);
		return Cdkeyinfopagelist;
	}
	
	
	
	/**
	 * 跳转至充值记录
	 * @param request
	 * @return
	 */
	@RequestMapping("/totradelist.do")
	public String totradelist(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		User user = (User) request.getSession().getAttribute("user");
		String userid = user.getUserid();
		List<Trade> tradepagelist = tradepage(1,userid);
		request.setAttribute("tradepagelist", tradepagelist);		//第一页数据
		
		List<Trade> list = tradedao.findAllByUserid(userid);
		int maxnum = list.size();
		request.setAttribute("list", maxnum);
		if(maxnum%8==0){
			maxnum = maxnum/8;
		}else{
			maxnum = maxnum/8+1;
		}	
		request.setAttribute("maxnum", maxnum);			//一共多少页
		
		
		return "newMemberCenter/rechargeList";
	}
	
	/**
	 * 分页充值记录
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/pagerecharge.do")
	public void pagerecharge(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		User user = (User) request.getSession().getAttribute("user");
		String userid = user.getUserid();	
		int num1 = Integer.parseInt(request.getParameter("num"));	//用于分页
		List<Trade> tradepagelist = tradepage(num1,userid);	
			JSONArray obj = JSONArray.fromObject(tradepagelist);				//java对象转json类型
			String list121 = obj.toString();
			out.print(list121);
	}
	
	/**
	 * 充值分页方法
	 * @param num1
	 * @param userid
	 * @return
	 */
	private List<Trade> tradepage(int num1,String userid){
		int num = 8*(num1-1);											//每页8个	
		//获取一共多少充值记录
//		List<Trade> tradelist = tradedao.findAllByUserid(userid);
//		int maxnum = tradelist.size();
//		if(maxnum%8==0){
//			maxnum = maxnum/8;
//		}else{
//			maxnum = maxnum/8+1;
//		}
		
		Trade trade = new Trade();								//封装成对象传入mybatis
		trade.setN(num);
		trade.setUserid(userid);
		List<Trade> tradepagelist = tradedao.listpagetrade(trade);
		return tradepagelist;
	}
	
	
	/**
	 * 获得玩家最近充值的游戏区
	 */
	@RequestMapping("/lastestchargegame.do")
	public void lastestchargegame(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("userid");
		String gamename = tradedao.findByUserid(userid);
		if(gamename==null){
			out.print("无");
		}else{
			out.print(gamename);
		}	
	}
	
	
	/**
	 * 会员中心更多资料
	 * @return
	 */
	@RequestMapping("/memberinformation.do")
	public String memberinformation(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		User useru = (User) request.getSession().getAttribute("user");
		String userid = useru.getUserid();
		String email = request.getParameter("email");
		String qq = request.getParameter("qq");
		String sex = request.getParameter("sex");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String county = request.getParameter("county");
		String address = request.getParameter("address");
		address = province +" "+city+" "+county+" "+address;
		address = WordFilterUtil.simpleFilter(address, '*');
		User user = new User();
		user.setQq(qq);
		user.setEmail(email);
		user.setAddress(address);
		user.setSex(sex);
		user.setUserid(userid);
		userdao.addInformation(user);
		return "redirect:tomember.do";
	}
	
	/**
	 * 判断gb够不够
	 * @throws IOException 
	 */
	@RequestMapping("/gbcheck.do")
	public void gbcheck(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("userid");
		double gb = Double.parseDouble(request.getParameter("gb"));
		User user = userdao.findByUsername(userid);
		String dbgb = user.getGb();
		double dbgb1=Double.parseDouble(dbgb);
		if(gb<=dbgb1){
			out.print("ok");
		}else{
			out.print("G币不足,当前G币为"+dbgb1);
		}
	}
	
	/**
	 * 判断该区玩家存在角色否
	 * @throws IOException 
	 */
	@RequestMapping("/usercheck.do")
	public void usercheck(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out =null;
		try {
			out = response.getWriter();
			String userid = request.getParameter("userid");
			String gamename = URLDecoder.decode(request.getParameter("gamename"),"utf-8");
			String gameregion = URLDecoder.decode(request.getParameter("gameregion"),"utf-8");
			
			Gamedistrict gamedistrict1 = new Gamedistrict();			//获得分区serverid
			gamedistrict1.setGamename(gamename);
			gamedistrict1.setGameregion(gameregion);
			int serverid = gamedistrict.getserveridByregion(gamedistrict1);
			
			User user = userdao.findByUsername(userid);
			if(user!=null){
				String openuserid =user.getOpenuserid(); 
				Operation oper = GamenameFactory.createOperation(gamename,openuserid,serverid);
				String SubmitResult = oper.checkuser();
				 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
				 String status = jsonobject.getString("status");
				 if("0".equals(status)){
					 out.print("success");
				 }else{
					 out.print("角色信息不存在");
				 }
			}
			
		} catch (Exception e) {
			out.print("充值出错,请检查网络!");
		}
		
	}
	
//	/**
//	 * u77建立连接，查询角色存在否
//	 * @param path
//	 * @param userid
//	 * @return
//	 */
//	private String u77buildrequest(String path, String userid) {
//		HttpClient client = new HttpClient(); 
//		HttpMethod method = new GetMethod(path+"?username="+userid); 			
//		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");	
//		try {
//			client.executeMethod(method);			
//			String SubmitResult =method.getResponseBodyAsString();
//			 if("0".equals(SubmitResult)){
//				 return "success";
//			 }else{
//				 return "角色信息不存在";
//			 }
//		}catch (HttpException e){
//			e.printStackTrace();
//		}catch (IOException e){
//			e.printStackTrace();
//		}
//		return null;
//	}
//
//	/**
//	 * 像素骑士团建立连接，查询角色存在否
//	 * @param path
//	 * @param userid
//	 * @param serverid
//	 * @return
//	 */
//	private String buildrequest(String path, String userid, int serverid) {
//		HttpClient client = new HttpClient(); 
//		HttpMethod method = new GetMethod(path+"?uid="+userid+"&serverid="+serverid); 			
//		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");	
//		try {
//			client.executeMethod(method);	
//			
//			String SubmitResult =method.getResponseBodyAsString();
//			 int a = SubmitResult.indexOf("{");
//			 int b = SubmitResult.lastIndexOf("}");
//			 SubmitResult =  SubmitResult.substring(a, b+1);
//			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
//			 String status = jsonobject.getString("status");
////			 String battlevalue = jsonobject.getString("battlevalue");
////			 String username = jsonobject.getString("username");
////			 String lv = jsonobject.getString("lv");
//			
//			 if(status.equals("0")){
//				 return "success";
//			 }else{
//				 return "角色信息不存在";
//			 }
//
//		} catch (HttpException e) {
//			e.printStackTrace();
//		}catch (IOException e) {
//			e.printStackTrace();
//		}
//		return null;
//	}

	/**
	 * 根据游戏名字选择分区充值
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/czregion.do")
	public void czgameregion(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"UTF-8");
//System.out.println(gamename);
		List<Gamedistrict> region = gamedistrict.listgameregion(gamename);
		JSONArray obj = JSONArray.fromObject(region);
		String list = obj.toString();
		out.print(list);
	}
	
	/**
	 * 充值选择游戏名字
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/recharge.do")
	public String czgamename(HttpServletRequest request) throws Exception{
		String gameid = request.getParameter("gameid");
		String serverid = request.getParameter("serverid");
		if(gameid!=null && serverid!=null){
			Gamedistrict gs = gamedistrict.getnamebyid(gameid, serverid);
			if(gs!=null){
				String gamename = gs.getGamename();
				String gameregion = gs.getGameregion();
				List<Gamedistrict> region = gamedistrict.listgameregion(gamename);
				request.setAttribute("defaultgamename", gamename);
				request.setAttribute("defaultgameregion", gameregion);
				request.setAttribute("defaultregion", region);
			}
		}		
			List<Gamelist> game = gamelist.listneigougamename();
			JSONArray obj = JSONArray.fromObject(game);
			request.setAttribute("gamename", obj);
			return "/newMemberCenter/recharge";
	}
	
//	/**
//	 * 修改邮箱发送邮件验证
//	 * @param request
//	 */
//	@SuppressWarnings("deprecation")
//	@RequestMapping("/modifymail.do")
//	public void modifymail(HttpServletRequest request) {
//		String to = URLDecoder.decode(request.getParameter("mail"));	// 收件人的邮件地址，必须是真实地址 "1807165439@qq.com";//
//		//生成随机六位数
//		int mail_code = (int)((Math.random()*9+1)*100000);
//		String number = String.valueOf(mail_code);
//	
//		String smtp = "smtp.126.com";// smtp服务器
//		String from = "gm17wgj@126.com";// 邮件显示名称
//		String copyto = "";// 抄送人邮件地址
//		String subject = "一起玩-发送邮件";// 邮件标题
//		String content = "您的一起玩挂机验证码为"+number+",请不要泄漏给他人!";// 邮件内容
//		String username = "gm17wgj@126.com";// 发件人真实的账户名
//		String password = "isanktohabwsggpy";// 发件人密码
//		Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password);
//		//将邮箱验证码插入phonecode数据库
//		Phonecode p = phonecodedao.findByphone(to);
//		if(p==null){
//			Phonecode phonecode = new Phonecode();
//			phonecode.setPhone(to);
//			phonecode.setCode(number);
//			phonecodedao.add(phonecode);
//		}else{
//			Phonecode phonecode = new Phonecode();
//			phonecode.setPhone(to);
//			phonecode.setCode(number);
//			phonecodedao.delete(to);
//			phonecodedao.add(phonecode);	
//		}
//	}
	
	
	/**
	 * 核对验证码，同时更新用户信息
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkmailcode.do")
	public void checkmailcode(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("mail");
		String code = request.getParameter("code");
		Phonecode phonecode = phonecodedao.findByphone(email);
		if(phonecode.getCode().equalsIgnoreCase(code)){
			phonecodedao.delete(email);		//删除库里验证码
			
			//绑定邮箱
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			String userid = user.getUserid();
			User user1 = new User();
			user1.setUserid(userid);
			user1.setEmail(email);
			userdao.updateemail(user1);
			//重新绑定session
			User user2 =userdao.findByUsername(userid);
			session.setAttribute("user", user2);
			session.setMaxInactiveInterval(36000);
			
			out.print("true");
		}else{
			out.print("false");
		}
		
	}
	
//	/**
//	 * 邮箱发送邮件跳转至第二步
//	 * @param args
//	 * @return
//	 */
//	@RequestMapping("/sendmail.do")
//	public String mail(HttpServletRequest request) {
//		String to = URLDecoder.decode(request.getParameter("mail"));	// 收件人的邮件地址，必须是真实地址 "1807165439@qq.com";//
//		//生成随机六位数
//		int mail_code = (int)((Math.random()*9+1)*100000);
//		String number = String.valueOf(mail_code);
//	
//		String smtp = "smtp.126.com";// smtp服务器
//		String from = "gm17wgj@126.com";// 邮件显示名称
//		String copyto = "";// 抄送人邮件地址
//		String subject = "一起玩-发送邮件";// 邮件标题
//		String content = "您的一起玩挂机验证 码为"+number+",请不要泄漏给他人!";// 邮件内容
//		String username = "gm17wgj@126.com";// 发件人真实的账户名
//		String password = "isanktohabwsggpy";// 发件人密码
//		Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password);
//		
//		//将邮箱验证码插入phonecode数据库
//		Phonecode p = phonecodedao.findByphone(to);
//		if(p==null){
//			Phonecode phonecode = new Phonecode();
//			phonecode.setPhone(to);
//			phonecode.setCode(number);
//			phonecodedao.add(phonecode);
//		}else{
//			Phonecode phonecode = new Phonecode();
//			phonecode.setPhone(to);
//			phonecode.setCode(number);
//			phonecodedao.delete(to);
//			phonecodedao.add(phonecode);
//			
//		}
//		request.setAttribute("email", to);
//		return "memberCenter/addemail2";
//	}
	
	/**
	 * 解绑手机
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/telephone.do")
	public String telephone(HttpServletRequest request,ModelMap model) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("telephone_userid");
		//解绑手机号
		userdao.updatephone(userid);
		
		//用户重新绑定session
		User user1 = userdao.findByUsername(userid);
		HttpSession session = request.getSession();
		session.setAttribute("user", user1);
		session.setMaxInactiveInterval(36000);
		return "memberCenter/cellphone4";
	}
	
	/**
	 * 解绑手机号异步验证手机验证码
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping("/checktelephonecode.do")
	public void checktelephonecode(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
			
		String code = request.getParameter("code");
		String phone = request.getParameter("telephone");
		Phonecode pc = phonecodedao.findByphone(phone);
		String dbcode = pc.getCode();
		if(!code.equals(dbcode)){
			out.print("× 验证码不正确");
		}else{
			phonecodedao.delete(phone);
			out.print(" ");
		}
	}
	
	/**
	 * 绑定手机
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/bindtelephone.do")
	public String bindtelephone(HttpServletRequest request,ModelMap model) throws Exception{
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("bind_userid");
		String telephone = request.getParameter("bind_telephone");
		//修改手机号
		User user = new User();
		user.setUserid(userid);
		user.setTelephone(telephone);
		userdao.updateTelephone(user);
		
		//用户重新绑定session
		User user1 = userdao.findByUsername(userid);
		HttpSession session = request.getSession();
		session.setAttribute("user", user1);
		session.setMaxInactiveInterval(36000);
		return "memberCenter/cellphonebind2";
	}
	
	/**
	 * 绑定手机号异步验证手机验证码
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping("/checkbindcode.do")
	public void checkbindcode(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
			
		String code = request.getParameter("code");
		String phone = request.getParameter("telephone");
		
		User user = userdao.findByTelephone(phone);
		if(user==null){
			Phonecode pc = phonecodedao.findByphone(phone);
			String dbcode = pc.getCode();
			if(!code.equals(dbcode)){
				out.print("× 验证码不正确");
			}else{
				phonecodedao.delete(phone);
				out.print(" ");
			}
		}else{
			out.print("× 该手机号已绑定其他账号");
		}
		
	}
	
	/**
	 * 新版本会员中心密码提示问题
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/pwdproblem.do")
	public void pwdproblem(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String pwdproblem =URLDecoder.decode(request.getParameter("pwdproblem"), "utf-8");
		
		String userid; 
		User useruser = (User) request.getSession().getAttribute("user");
		if(useruser!=null){
			userid = useruser.getUserid();
			User user = new User();
			user.setUserid(userid);
		user.setPwdproblem(pwdproblem);
			userdao.updatePwdproblem(user);
			
			//用户信息重新绑定session
			User user1 = userdao.findByUsername(userid);
			HttpSession session = request.getSession();
			session.setAttribute("user", user1);
			session.setMaxInactiveInterval(36000);
			out.print("success");
		}else{
			out.print("fail");
		}
	}
	
	/**
	 * 新版本会员中心实名认证
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/newmemberrealname.do")
	public void memberrealname(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String realname =URLDecoder.decode(request.getParameter("realname"), "utf-8");
		String idcard = request.getParameter("idcard");
		
		String userid; 
		User useruser = (User) request.getSession().getAttribute("user");
		if(useruser!=null){
			userid = useruser.getUserid();
			User user = new User();
			user.setUserid(userid);
			user.setRealname(realname);
			user.setIdcard(idcard);
			userdao.updateRealname(user);
			
			//用户信息重新绑定session
			User user1 = userdao.findByUsername(userid);
			HttpSession session = request.getSession();
			session.setAttribute("user", user1);
			session.setMaxInactiveInterval(36000);
			out.print("success");
		}else{
			out.print("fail");
		}
	}
	
	
	/**
	 * 实名认证
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/realname.do")
	public String gameinfopicture(HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("UTF-8");
		String realname = request.getParameter("realname");
		String idcard = request.getParameter("idcard");
		String userid = request.getParameter("userid");
		User user = new User();
		user.setUserid(userid);
		user.setRealname(realname);
		user.setIdcard(idcard);
		userdao.updateRealname(user);
		
		//用户信息重新绑定session
		User user1 = userdao.findByUsername(userid);
		HttpSession session = request.getSession();
		session.setAttribute("user", user1);
		session.setMaxInactiveInterval(36000);
		return "/memberCenter/member";
	}
	
	/**
	 * 跳转会员中心
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/tomember.do")
	public String tomember(HttpServletRequest request,HttpServletResponse response){
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null){
			String userid = user.getUserid();
			User user1 = userdao.findByUsername(userid);
			HttpSession s = request.getSession();
			s.setAttribute("user",user1);
			s.setMaxInactiveInterval(36000);
		}
		return "newMemberCenter/member";
	}
}
