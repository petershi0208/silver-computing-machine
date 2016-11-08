package com.daqian.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.UserAssetsDao;
import com.daqian.dao.UserDao;
import com.daqian.entity.User;
import com.daqian.entity.UserAssets;

@Controller("security")
public class SecurityController {
	@Resource
	private UserAssetsDao userassetsdao;
	@Resource
	private UserDao userdao;
	
	@RequestMapping("/checkcard.do")
	public String checkcard(HttpServletRequest request) throws UnsupportedEncodingException{
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		User u = userdao.login(username);
		String realname = u.getRealname();
		String card = u.getCard();
		
		HttpSession realsession = request.getSession();
		realsession.setAttribute("realname", realname);
		realsession.setMaxInactiveInterval(72000);
		
		HttpSession cardsession = request.getSession();
		cardsession.setAttribute("card", card);
		cardsession.setMaxInactiveInterval(72000);
		
		return "user/hyzx/anquan";
	}
	
	/**
	 * 实名认证
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/changecard.do")
	public void changecode(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		
		String name = request.getParameter("name");
		String card = request.getParameter("card");
		System.out.println(name);
		userdao.changecard(username, name, card);
		out.print("修改成功");
		
	}
	
	/**
	 * 更改支付密码
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/changepaypwd.do")
	public void changepaypwd(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String oldpwd = request.getParameter("oldpwd");
		String newpwd = request.getParameter("newpwd");
		String code = request.getParameter("code");
		
		//MD5加密
		oldpwd = DigestUtils.md5Hex(getContentBytes(oldpwd, "utf-8")).toString();
		newpwd = DigestUtils.md5Hex(getContentBytes(newpwd, "utf-8")).toString();
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
	//	System.out.println(username);
		
		HttpSession s = request.getSession();
		String dbcode = (String) s.getAttribute("number");
		if(!dbcode.equals(code)){
			out.print("验证码错误");
			return;
		}
		
		UserAssets u = userassetsdao.findByName(username);
		String dbpwd = u.getPaypassword();
		if(!dbpwd.equals(oldpwd)){
			out.print("旧密码输入错误");
			return;
		}
		
		userassetsdao.changepaypwd(username,newpwd);
		out.print("修改成功");
		
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
	
	/**
	 * 验证码
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/checkpaycode.do")
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
}
