package com.yqwan.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringReader;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.xml.sax.InputSource;
import org.xml.sax.XMLReader;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.cplfactory.CPL;
import com.yqwan.cplfactory.CPLNameFactory;
import com.yqwan.domain.Cdkeyinfo;
import com.yqwan.domain.Game;
import com.yqwan.domain.LatestRegion;
import com.yqwan.domain.Phonecode;
import com.yqwan.gamefactory.GamenameFactory;
import com.yqwan.gamefactory.Operation;
import com.yqwan.service.BeanListHandler;
import com.yqwan.service.FirstLetter;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;
import com.yqwan.service.Http;
import com.yqwan.service.ReadXls;
import com.yqwan.sign.MD5;


public class TestDI {
	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
//		String conf="applicationContext.xml";
//		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
//		IPtdataDao ptdao = (IPtdataDao) ac.getBean("ptdata",IPtdataDao.class);
//	
//		Http hp = Http.getInstance();
//		HashMap<String,String> m = new LinkedHashMap<String,String>();
//		m.put("sid", "14");
//		m.put("mintime", "2016-08-26");
//		m.put("maxtime", "2016-08-29");
//		m.put("gid", "1");
//		m.put("time", UtilDate.getTimeStamp());
//		MapToParam.createValueMysign(m, "73255d4f1e57a0186c9dfffb753e4d6b");
//		String result = hp.hp("http://qq.17515.cn:880/gamelist/199y/199y_pt_player.php", m, "get");
//		System.out.println(result);
//		JSONArray ja = JSONArray.fromObject(result.substring(result.indexOf("[")));
//		JSONObject jo;
//		for(int i=0;i<ja.size();i++){
//			jo = (JSONObject) ja.get(i);
//			String openuserid = jo.getString("id");
//			String name = jo.getString("name");
//			String lv = jo.getString("maxFloor");
//			ptdao.add(openuserid,name,lv);
//		}
		
//		Operation op = GamenameFactory.createOperation("联盟与部落","petershi",1);
//		String a = op.buildRequest(UtilDate.getTimeStamp());
//		String a = op.checkuser();
//		String a =op.payresult(UtilDate.getTimeStamp(),"33063", "18","");
//		System.out.println(a);
		
//		CPL cpl = CPLNameFactory.createCPL("jjw199y");
//		String result = cpl.buildRequest("35ca1f81c9db74ba2b11bd96580c8473", "76624","11738", "23222");
//		System.out.println(result);
//		List<String> l  = ReadXls.readexcel("d:\\fangdong.xls",3);
//		System.out.println(l.get(0));
		 
//		HSSFWorkbook wb = new HSSFWorkbook(new FileInputStream("d:\\fangdong.xls"));
//		HSSFSheet sheet = wb.getSheetAt(0);
//        HSSFRow row = null;
//        HSSFCell cell = null;
//        HSSFCell cell2 = null;
//        int rowNum=sheet.getLastRowNum();							//获得总行数
//        //int coloumNum=sheet.getRow(0).getPhysicalNumberOfCells();	//获得总列数
//        
//		String cellStr = null;
//		String cell2Str = null;
//        for (int i = 0; i <= rowNum; i++) {
//			row=sheet.getRow(i);
//			if(row==null) break;
//			cell=row.getCell(1);
//			cell2=row.getCell(0);
//			if (cell == null) {// 单元格为空设置cellStr为空串  
//				continue;
//			}else if(cell.getCellType()==HSSFCell.CELL_TYPE_NUMERIC){
//				cell.setCellType(cell.CELL_TYPE_STRING);
//				cellStr = cell.getStringCellValue();
//				cell2.setCellType(cell.CELL_TYPE_STRING);
//				cell2Str = cell2.getStringCellValue();
//             } else {// 其余按照字符串处理
//            	cellStr = cell.getStringCellValue();
//            	cell2Str = cell2.getStringCellValue();
//             }
//			cellStr = cellStr.replace(" ","");
//			String telephone="13120570868";
//			String SubmitResult = sendmsg(telephone);
//			Log.logResult(UtilDate.getDateFormatter()+telephone+"戚辉收到租客王康，租金为：6600;发送状态："+SubmitResult+"\r\n", "d:\\Logs\\igjiaLogs");
//		}	
		
		Map<String,String> m = new LinkedHashMap<String, String>();
		m.put("test", "123");
		Http hp = Http.getInstance();
		String result = hp.hp("http://192.168.1.115/springmvc/hello2.do", m, "delete");
		System.out.println(result);
	}
	
	private static String sendmsg(String telephone){
		String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url);
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");		
		String content ="由于您电话始终联系不上，现最终短信告知您，您收取的租客名字：王康，租金为：6600，公司已追究您的法律责任，进入法律流程，已寄出律师函！";
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
			String smsid = root.elementText("smsid");	
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