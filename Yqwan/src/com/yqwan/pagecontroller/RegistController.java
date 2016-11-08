package com.yqwan.pagecontroller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import alex.zhrenjie04.wordfilter.WordFilterUtil;

import com.alipay.util.UtilDate;
import com.yqwan.cplfactory.CPL;
import com.yqwan.cplfactory.CPLNameFactory;
import com.yqwan.dao.ICplUserDao;
import com.yqwan.dao.IGameDistrictDao;
import com.yqwan.dao.IPhonecodeDao;
import com.yqwan.dao.IPromoterDao;
import com.yqwan.dao.IPromoterrecordDao;
import com.yqwan.dao.IUserDao;
import com.yqwan.domain.CplUser;
import com.yqwan.domain.Gamedistrict;
import com.yqwan.domain.Phonecode;
import com.yqwan.domain.Promoter;
import com.yqwan.domain.Promoterrecord;
import com.yqwan.domain.User;
import com.yqwan.service.FirstLetter;
import com.yqwan.sign.MD5;

/**
 * 
 * @author TYShi
 *
 */

@Controller("regist")
public class RegistController {
	@Resource
	private IUserDao userdao;
	@Resource
	private IPhonecodeDao phonecodedao;
	@Resource
	private IPromoterDao promoterdao;
	@Resource
	private IPromoterrecordDao promoterrecorddao;
	@Resource
	private ICplUserDao cpluserdao;
	@Resource
	private IGameDistrictDao gamedistrictdao;
	
	
	/**
	 * 手机注册地址
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/phoneregist.do")
	public void phoneregist(HttpServletRequest request,HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String code = request.getParameter("code");
		String gamename = new String(request.getParameter("gamename").getBytes("ISO-8859-1"),"UTF-8");
		
		JSONObject jo = new JSONObject();
		
		HttpSession session1 = request.getSession();
		String registcode = (String) session1.getAttribute("registcode");
		if(!registcode.equalsIgnoreCase(code)){				//校验验证码
			jo.put("code", "0");
			out.print(jo.toString());
//			out.print("codeerror");
			return;
		}
		//获取注册时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String registdate = sdf.format(date);
		//注册参数封装成对象
		User user1 = new User();
		user1.setUserid(username);
		user1.setOpenuserid(MD5.sign(username, "utf-8"));
		user1.setNickname(username);				//手机注册默认昵称和用户名一致
		user1.setPassword(password);
		user1.setSpreadcode("phoneregist");
		user1.setRegistdate(registdate);
		user1.setLogindate(registdate);					//初始化登录时间
		user1.setHeadpicture("http://www.199y.com/picture/yqwan/touxiang.png");
		user1.setGb("0");
		
		User user = userdao.findByUsername(username);
		if(user==null){
			userdao.regist(user1);						//向数据库插入注册数据		
			HttpSession session = request.getSession();
			session.setAttribute("user", user1);
			session.setMaxInactiveInterval(3600);
			addCookie(user1, response, request);
			jo.put("code", "1");
			jo.put("letter", FirstLetter.cn2py(gamename).toUpperCase());
			out.print(jo.toString());
//			out.print("success");
		}else{
			jo.put("code", "2");
			out.print(jo.toString());
		}
	}
	
	/**
	 * 注册完成后跳转到游戏（平台注册则不执行）
	 * @param request
	 * @param response
	 */
	@RequestMapping("/registtogame.do")
	public void registgetlatestgame(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gamename = new String(request.getParameter("gamename").getBytes("ISO-8859-1"),"UTF-8");
		List<Gamedistrict> list = gamedistrictdao.listallregion(gamename);		//该游戏所有分区
		Gamedistrict gd = null;
		for(int i=0;i<list.size();i++){					//推最新的已上线的游戏（集合为每个游戏最新的区）
			gd = list.get(list.size()-i-1);
			String date = gd.getDate();
			DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Long gamedate = df.parse(date).getTime();
			Long nowdate = df.parse(UtilDate.getDateFormatter()).getTime();
			if(nowdate>gamedate) break;
		}
		JSONObject json = JSONObject.fromObject(gd);
		String fl = FirstLetter.cn2py(gamename);
		json.put("letter", fl.toUpperCase());
		out.print(json.toString());
	}
	
	/**
	 * 注册成功，向数据库插数据(PC注册)
	 * @param request
	 * @param model
	 * @return
	 * @throws ParseException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("/registtwo.do")
	public String registtwo(HttpServletRequest request,HttpServletResponse response,ModelMap model) throws Exception{
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String telephone = request.getParameter("telephone");
//		String realname = request.getParameter("realname");
//		String idcard = request.getParameter("idcard");
		String nickname = request.getParameter("nickname");
		String spreadcode = request.getParameter("invitecode");
		String gamename = request.getParameter("gamename");
		String originalpage = request.getParameter("originalpage");
		
		String code = request.getParameter("code");
		
		boolean flag = checkphonecode(telephone,code);
		if(!flag){
			return "redirect:toindex.do";
		}
		phonecodedao.delete(telephone);
		
		//MD5加密
		password = MD5.sign(password, "UTF-8");
		//获取注册时间
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String registdate = sdf.format(date);
		//注册参数封装成对象
		User user1 = new User();
//		user1.setRealname(realname);
//		user1.setIdcard(idcard);
		user1.setUserid(username);
		user1.setOpenuserid(MD5.sign(username, "utf-8"));
		user1.setNickname(nickname);
		user1.setSpreadcode(spreadcode);
		user1.setPassword(password);
		user1.setTelephone(telephone);
		user1.setRegistdate(registdate);
		user1.setLogindate(registdate);					//初始化登录时间
		user1.setHeadpicture("http://www.199y.com/picture/yqwan/touxiang.png");
		user1.setGb("0");
		if(userdao.findByTelephone(telephone)==null){
			userdao.regist(user1);						//向数据库插入注册数据
			
			updatePromoter(spreadcode);		//给推广者更新数据
			
			String tid = (String) request.getSession().getAttribute("tid");
			if(tid!=null){
				try {
					String tokenID = (String) request.getSession().getAttribute("tokenID");
					if(tokenID==null) tokenID="无";
					
					CPL yrtcpl = CPLNameFactory.createCPL(spreadcode); 	//根据推广码创建工厂
					String openusername = MD5.sign(username, "utf-8");
					System.out.println(nickname);
					String Result = yrtcpl.buildRequest(openusername,tid,tokenID,nickname);
					CplUser cpluser = new CplUser();
					cpluser.setBackmsg(Result);
					cpluser.setSpreadcode(spreadcode);
					cpluser.setOpenuid(openusername);
					cpluser.setTid(tid);
					cpluser.setUid(username);
					cpluser.setAdsense(tokenID);
					cpluserdao.insertcpluser(cpluser);
					request.getSession().removeAttribute("tid");
				} catch (Exception e){
					// TODO: handle exception
				}				
			}				
			HttpSession session = request.getSession();
			session.setAttribute("user", user1);
			session.setMaxInactiveInterval(3000);
			addCookie(user1, response, request);
			request.setAttribute("invitecode",spreadcode);
			request.setAttribute("gamename",gamename);
			request.setAttribute("originalpage",originalpage);
			return "registThree";
		}
		return null;
	}
	
	/**
	 * 推广员更新数据
	 * @param spreadcode
	 */
	public void updatePromoter(String spreadcode){
		Promoter promoter = promoterdao.findBynumber(spreadcode);		//获得推广者
		if(promoter!=null){
			Promoterrecord pr = new Promoterrecord();
			pr.setDate(UtilDate.getMonthLine());
			pr.setUserid(promoter.getUserid());
			Promoterrecord p = promoterrecorddao.findByUserid(pr);
			if(p!=null){
				pr.setRecommendperson(p.getRecommendperson()+1);
				promoterrecorddao.updateperson(pr);					//增加推广人数
			}else{
				pr.setRecommendmoney(0);
				pr.setRecommendperson(1);
				pr.setState("推广中");
				promoterrecorddao.addrecord(pr);
			}
		}
	}
	
	/**
	 * 异步验证手机验证码
	 * @param request
	 * @param response
	 * @throws IOException 
	 */
	@RequestMapping("/checkregisttwocode.do")
	public void checkregisttwocode(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
			
		String code = request.getParameter("code");
		String phone = request.getParameter("telephone");
		boolean flag = checkphonecode(phone,code);		
		if(flag){
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
			return true;
		}	
	}
	
	/**
	 * 注册第一张跳转页面
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/registone.do")
	public String regist(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("pwd");
		String telephone = request.getParameter("telephone");
//		String realname = request.getParameter("realname");
//		String idcard = request.getParameter("idcard");
		String nickname = request.getParameter("nickname");
		String spreadcode = request.getParameter("invite");
		String gamename = request.getParameter("gamename");
		String originalpage = request.getParameter("originalpage");
		User user = new User(); 
		user.setUserid(username);
		user.setPassword(password);
		user.setTelephone(telephone);
//		user.setRealname(realname);
//		user.setIdcard(idcard);
		user.setNickname(nickname);
		user.setSpreadcode(spreadcode);
		
		request.setAttribute("user", user);
		request.setAttribute("gamename", gamename);
		request.setAttribute("originalpage", originalpage);
		return "registTwo";	
	}
	
	/**
	 * to regist page
	 * @param request
	 * @return
	 */
	@RequestMapping("/toRegistOne.do")
	public String toRegistOne(HttpServletRequest request){
		String invitecode = request.getParameter("invitecode");			//推广码
		String gamename = request.getParameter("gamename");
		String originalpage = request.getParameter("originalpage");
		if(invitecode!=null){
			HttpSession session = request.getSession();
			session.setAttribute("invitecode",invitecode);
			session.setMaxInactiveInterval(3600);
		}
		request.setAttribute("gamename", gamename);
		request.setAttribute("originalpage", originalpage);
		return "registOne";
	}
	
	/**
	 * 判断验证码是否正确
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkcode.do")
	public void checkcode(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String code = request.getParameter("code");
		HttpSession session = request.getSession();
		String registcode = (String) session.getAttribute("registcode");
		if(registcode.equalsIgnoreCase(code)){
			out.print("√ 验证码正确");
		}else{
			out.print("× 验证码错误");
		}	
	}
	
	
	/**
	 * 异步验证手机号
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checktelephone.do")
	public void checkphone(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String telephone = request.getParameter("telephone");
		User user = userdao.findByTelephone(telephone);
		if(user==null){
			out.print("√ 此手机号可以使用");
		}else{
			out.print("× 此手机号已被使用");
		}	
	}
	
	/**
	 * 校验昵称
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checknickname.do")
	public void checknickname(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String nickname = URLDecoder.decode(request.getParameter("nickname"),"UTF-8");
		nickname = WordFilterUtil.simpleFilter(nickname,'*');
		if(nickname.indexOf("*")!=-1){
			out.print("× 昵称不合法");
		}else{
			User user = userdao.findByNickname(nickname);
			if(user==null){
				out.print("√ 昵称可以使用");
			}else{
				out.print("× 昵称已被注册");
			}	
		}		
	}
	
	/**
	 * 异步验证用户名
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/checkusername.do")
	public void checkname(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		User user = userdao.findByUsername(username);
		if(user==null){
			out.print("√ 用户名可以使用");
		}else{
			out.print("× 用户名已被注册");
		}		
	}
	
	/**
	 * 发送手机短信验证功能
	 * @param request
	 * @return
	 */
	@RequestMapping("/sendsms1.do")
	public void sendsms(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String telephone = request.getParameter("phone");
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		String code1 = request.getParameter("code");
		
		String msgip = (String) request.getSession().getAttribute("ip");
System.out.println(msgip);
		if(msgip!=null){
			out.print("请勿重复发送!");
			return;
		}
		String mycode =(String) request.getSession().getAttribute("registcode");
		if(code1==null ||!code1.equalsIgnoreCase(mycode)){
			out.print("验证码错误");
			return;
		}
		
		String ip = request.getHeader("x-forwarded-for"); 
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
			ip = request.getHeader("Proxy-Client-IP"); 
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
			ip = request.getHeader("WL-Proxy-Client-IP"); 
		}
		if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)){ 
			ip = request.getRemoteAddr(); 
		}
		HttpSession ips = request.getSession();
		ips.setAttribute("ip", ip);
		ips.setMaxInactiveInterval(30);
		System.out.println(ip);
		
		String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

		
		int mobile_code = (int)((Math.random()*9+1)*100000);
		String mobilecode = String.valueOf(mobile_code);
		Phonecode pc = phonecodedao.findByphone(telephone);
		if(pc==null){
			Phonecode phonecode = new Phonecode();
			phonecode.setPhone(telephone);
			phonecode.setCode(mobilecode);
			phonecodedao.add(phonecode);
		}else{
			Phonecode phonecode = new Phonecode();
			phonecode.setPhone(telephone);
			phonecode.setCode(mobilecode);
			phonecodedao.delete(telephone);
			phonecodedao.add(phonecode);
		}
		
		
		System.out.println(telephone);
		
		 String content =null;
		if(userid!=null){
			 content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。本次注册账号为"+userid+",密码为"+password+"。");
		}else{
			 content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
		}
	    

		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "cf_199Y"), 
			    new NameValuePair("password", "wslintghost110"), 	//密码可以使用明文密码或使用32位MD5加密
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", telephone), 
			    new NameValuePair("content", content),
		};
	//	System.out.println(telephone);
		method.setRequestBody(data);		
			
		try {
			client.executeMethod(method);	
			
			String SubmitResult =method.getResponseBodyAsString();
					
			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			
			
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
						
			if("2".equals(code)){
				System.out.println("短信提交成功");
				out.print("success");
			}else{
				out.print("短信发送失败");
			}
			
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}			
	}
	
	
	/**
	 * 验证码
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/checkregistcode.do")
	public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		//1创建一个内存印象（画布）
		BufferedImage image = new BufferedImage(100,34,BufferedImage.TYPE_INT_RGB);
		//2获得画笔
		Graphics g = image.getGraphics();
		//3给画笔设置颜色
		g.setColor(new Color(255,255,255));
		//4给画布设置背景颜色
		g.fillRect(0,0,100,34);
		//5重新设置画笔颜色
		Random r = new Random();
		g.setColor(new Color(r.nextInt(111),r.nextInt(255),r.nextInt(255)));
		//6生成一个随机数（验证码）
		//	String number = r.nextInt(89999)+10000+"";
		String number = code();
		HttpSession session = request.getSession();
		session.setAttribute("registcode",number);
		session.setMaxInactiveInterval(3600);
		//7绘制number
		g.setFont(new Font(null,Font.ITALIC,25));
		g.drawString(number, 10, 30);
		//加一些干扰线
		for(int i=0;i<8;i++){
			g.setColor(new Color(r.nextInt(255)));
		g.drawLine(r.nextInt(120),r.nextInt(30),r.nextInt(120),r.nextInt(30));
		}
		
		//二，压缩图片，发送给浏览器jpg
		//1,设置服务器返回的数据类型（图片）
		response.setContentType("image/jpeg");
		//2,获得自己输出流
		OutputStream ops = response.getOutputStream();
		//3，压缩图片，输出
		javax.imageio.ImageIO.write(image, "jpeg",ops);
		ops.close();
		}
		
		public static String code(){
			String number="";
			char[] chars = {'A','B','C','D','E','F','G','H','I','J',
					'K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z',
					'1','2','3','4','5','6','7','8','9','0'};
			Random r= new Random();
			for(int i=0;i<5;i++){
				number+=chars[r.nextInt(chars.length)];
			}
			return number;
		}
		
		/**
		 * 添加cookie
		 * @param user	用户信息
		 * @param response 
		 * @throws Exception
		 */
		public void addCookie(User user,HttpServletResponse response,HttpServletRequest request) throws Exception{
			StringBuffer url = request.getRequestURL();  
			String tempContextUrl = url.delete(url.length() - request.getRequestURI().length(), url.length()).append("/").toString();
			String u = getTopDomainWithoutSubdomain(tempContextUrl);		//转一级域名	
			
			String cookieuser = "{'userid':'"+user.getUserid()+"','nickname':'"+user.getNickname()+"'}";
			JSONObject jsonObject = JSONObject.fromObject(cookieuser);
//			System.out.println(jsonObject.toString());
			Cookie c = new Cookie("cookieuser",URLEncoder.encode(jsonObject.toString(),"utf-8")); 
			c.setDomain("."+u);//注意是以点号开头的. 
			c.setPath("/");
			c.setMaxAge(60*60*24);
			response.addCookie(c);
		}
		
		/**
		 * 二级域名转一级域名
		 * @param url
		 * @return
		 * @throws MalformedURLException
		 */
		public static String getTopDomainWithoutSubdomain(String url)throws MalformedURLException {

			String host = new URL(url).getHost().toLowerCase();// 此处获取值转换为小写
			Pattern pattern = Pattern.compile("[^\\.]+(\\.com\\.cn|\\.net\\.cn|\\.org\\.cn|\\.gov\\.cn|\\.com|\\.net|\\.cn|\\.org|\\.cc|\\.me|\\.tel|\\.mobi|\\.asia|\\.biz|\\.info|\\.name|\\.tv|\\.hk|\\.公司|\\.中国|\\.网络)");
			Matcher matcher = pattern.matcher(host);
			while (matcher.find()) {
				return matcher.group();
			}
			return null;
		}
}
