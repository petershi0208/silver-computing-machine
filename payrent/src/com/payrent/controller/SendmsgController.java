package com.payrent.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.payrent.dao.IPhonecodeDao;
import com.payrent.domain.Phonecode;
import com.payrent.domain.Renter;
import com.peter.util.Log;
import com.peter.util.UtilDate;

@Controller("sendmsgcontroller")
public class SendmsgController {
	@Resource
	private IPhonecodeDao phonecodedao;
	
	private static final String msgurl ="http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	
	/**
	 * 发送短信
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/payrentsendmsg.do")
	public void sendmsg(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		Renter renter = (Renter) request.getSession().getAttribute("renter");		
		if(renter==null){
			out.print("error");
		}else{
			String telephone = request.getParameter("telephone");
			String result = sendmsg(telephone);
			if("success".equals(result)){
				out.print("success");
			}else{
				out.print(result);
			}
		}
	}
	
	
	/**
	 * 发送消息
	 * @param telephone
	 * @param money
	 * @return
	 */
	private String sendmsg(String telephone){
		int mobile_code = (int)((Math.random()*9+1)*100000);
		String mobilecode = String.valueOf(mobile_code);
		Phonecode pc = phonecodedao.findByphone(telephone);
		if(pc==null){
			phonecodedao.add(telephone,mobilecode);
		}else{
			phonecodedao.updatecode(telephone,mobilecode);
		}
				
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(msgurl); 	
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");		
		String content ="你好,如非本人操作，可不用理会！你的校验码是:"+mobilecode;
		NameValuePair[] data = {//提交短信
			    new NameValuePair("account", "cf_1ykg"),
			    new NameValuePair("password", "nt3mB8"), 	//密码可以使用明文密码或使用32位MD5加密
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", telephone),
			    new NameValuePair("content", content),
		};
		method.setRequestBody(data);					
		try {
			client.executeMethod(method);
			String SubmitResult =method.getResponseBodyAsString();
			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();
			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
//			String smsid = root.elementText("smsid");
Log.logResult(UtilDate.getDateFormatter()+";"+telephone+";发送状态："+msg+"\r\n", "d:\\igjiaLogs\\payrentLogs");
			if("2".equals(code)){
				return "success";
			}else{
				return msg;
			}			
		}catch (Exception e) {
			return "error";
		}
	}
}
