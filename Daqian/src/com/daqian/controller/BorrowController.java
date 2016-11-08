package com.daqian.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.BorrowDao;
import com.daqian.entity.borrow;

@Controller("borrow")
public class BorrowController {
	
	@Resource
	private BorrowDao borrowdao; 
	
	
	//跳转borrowapply2
	@RequestMapping("/borrow2.do")
	public String borrow2(HttpServletRequest request){
		return "user/borrowapplytwo";
	}
	
	/**
	 * 借款申请表第一步
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 * @throws ParseException 
	 */
	@RequestMapping("/borrow.do")
	public String borrow(HttpServletRequest request) throws UnsupportedEncodingException, ParseException{
		request.setCharacterEncoding("utf-8");
		HttpSession namesession = request.getSession();
		String username = (String) namesession.getAttribute("username");		//获得用户名
		
		Date date1 = new Date();
		SimpleDateFormat sfd = new SimpleDateFormat("yyyy-MM-dd");
		String day = sfd.format(date1);
		Date date =sfd.parse(day);
		java.sql.Date borrowdate=new java.sql.Date(date.getTime());				//获得当前时间
		
		List<String> filelist = new ArrayList<String>();		//用于存放上传的文件
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
		
	//将上传的文件写入到本地
		try{  
	//		 File tmpDir = null;//初始化上传文件的临时存放目录  
	//		 File saveDir = null;//初始化上传文件后的保存目录 
	        if(ServletFileUpload.isMultipartContent(request)){  
	          DiskFileItemFactory dff = new DiskFileItemFactory();//创建该对象  
	//        dff.setRepository(tmpDir);//指定上传文件的临时目录  
	          dff.setSizeThreshold(1024000);//指定在内存中缓存数据大小,单位为byte 
	          ServletFileUpload sfu = new ServletFileUpload(dff);//创建该对象  
	          sfu.setSizeMax(5000000);//指定单个上传文件的最大尺寸  
	          sfu.setSizeMax(15000000);//指定一次上传多个文件的总尺寸  
	          FileItemIterator fii = sfu.getItemIterator(request);//解析request 请求,并返回FileItemIterator集合  
	         
	          while(fii.hasNext()){
	            FileItemStream fis = fii.next();//从集合中获得一个文件流  
	          
                String name = fis.getFieldName();  	//得到表单域的名称     
                InputStream stream = fis.openStream();	//得到表单域的值（这是一个输入流）  
                
	            if(!fis.isFormField() && fis.getName().length()>0){//过滤掉表单中非文件域  
	                String fileName = fis.getName().substring(fis.getName().lastIndexOf("//")+1);//获得上传文件的文件名  
	                fileName = username+"-"+fileName;
	                BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流  
	                BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File("d://Tomcat//apache-tomcat-6.0.44//webapps//Daqian//image//"+fileName)));//获得文件输出流  
	                Streams.copy(in, out, true);//开始把文件写到你指定的上传文件夹 
	                filelist.add(fileName);
	                in.close();
	                out.close();
	                stream.close();
	            }else{
	            	 String value = Streams.asString(stream,request.getCharacterEncoding()); 
	            	 map.put(name, value);
	            }
	          } 
	          
	        }  
	    }catch(Exception e){  
	        e.printStackTrace();  
	    }          
	    String file = filelist.toString();							//获得用户上传的文件
	//    System.out.println(file);
	   
	//    System.out.println(map);
	    String realname = (String) map.get("realname");				//获得真实姓名
	    String card = (String) map.get("card");						//获得身份证号
	    String product = (String) map.get("product");				//获得借款产品
	    String city = (String) map.get("city");						//获得借款者所在城市
	    String graduate = (String) map.get("graduate");				//获得学历
	    String principal = (String) map.get("money");				//获得借款金额
	    String deadline = (String) map.get("day");					//获得借款期限
	    
	    
	    borrow b = new borrow();
	    b.setUsername(username);
	    b.setProductname(product);
	    b.setPrincipal(Integer.parseInt(principal));
	    b.setInterest(1.1);
	    b.setState("待审核");
	    b.setBorrowdate(borrowdate);
	    b.setRealname(realname);
	    b.setCard(card);
	    b.setCity(city);
	    b.setGraduate(graduate);
	    b.setDeadline(deadline);
	    b.setFile(file);
	        
	    borrowdao.insert(b);
		
	    request.getSession().setAttribute("money", principal);
	    request.getSession().setAttribute("deadline", deadline);
		return "redirect:/borrow2.do";
	}
	
	
	/**
	 * 用户选择四个不同的借款产品
	 * @param request
	 * @return
	 */
	@RequestMapping("/borrowapply1.do")
	public String borrowApply1(HttpServletRequest request){
		request.setAttribute("product", "零花钱");
		return "user/borrowapply";
	}
	@RequestMapping("/borrowapply2.do")
	public String borrowApply2(HttpServletRequest request){
		request.setAttribute("product", "急用贷");
		return "user/borrowapply";
	}
	@RequestMapping("/borrowapply3.do")
	public String borrowApply3(HttpServletRequest request){
		request.setAttribute("product", "家用贷");
		return "user/borrowapply";
	}
	@RequestMapping("/borrowapply4.do")
	public String borrowApply4(HttpServletRequest request){
		request.setAttribute("product", "商用贷");
		return "user/borrowapply";
	}
	
}
