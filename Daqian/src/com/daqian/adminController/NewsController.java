package com.daqian.adminController;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.LoginfosDAO;
import com.daqian.dao.NewsDAO;
import com.daqian.entity.Loginfoss;
import com.daqian.entity.News;

@Controller
public class NewsController {
	@Resource
	private NewsDAO ndao;
	@Resource
	private LoginfosDAO ldao;
	
	@RequestMapping("/news-add.do")
	public void newsadd(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String title = URLDecoder.decode(request.getParameter("title"),"UTF-8");
		String content =  URLDecoder.decode(request.getParameter("content"),"UTF-8");
		String image = request.getParameter("image");
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(now);
		News n = new News();
		n.setTitle(title);
		n.setDate(date);
		n.setState("启用");
		n.setContent(content);
		n.setImage(image);
		if(title==null || title==""){
			out.print("请添加标题");
		}else if(content==null || content==""){
			out.print("请添加文章内容");
		}else{
			ndao.add(n);
			//加入日志
			Date now1 = new Date();
			SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
			String date1 = df1.format(now1);
			Loginfoss log = new Loginfoss();
			log.setAdminname("张三");
			log.setTablename("news");
			log.setDate(date1);
			log.setContent("添加");
			log.setType("成功");
			ldao.add(log);
			
			out.print("已添加");
		}
		
	}
	
	@RequestMapping("/news-list.do")
	public String newslist(HttpServletRequest request){
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		if(date1!="" && date2!="" && date1!=null && date2!=null){
			List<News> nlist = ndao.findByDate(date1, date2);
			request.setAttribute("nlist", nlist);
		}else{
			List<News> nlist = ndao.all();
			request.setAttribute("nlist", nlist);	
		}
		
		return "Administrator/template/news/news-list";
	}  
	
	@RequestMapping("/fileload.do")
	public void fileload(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String fileName =null;		//用于存放上传的文件
		Map<String,Object> map = new HashMap<String,Object>();	//存放普通输入框内容
//		Date now = new Date();
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		String date = df.format(now);
		try{  
	        if(ServletFileUpload.isMultipartContent(request)){  
	          DiskFileItemFactory dff = new DiskFileItemFactory();//创建该对象  
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
	                fileName = fis.getName().substring(fis.getName().lastIndexOf("//")+1);//获得上传文件的文件名  
	          
	                BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流  
	                BufferedOutputStream out1 = new BufferedOutputStream(new FileOutputStream(new File("d://apache-tomcat-6.0.44//webapps//Daqian//news-image//"+fileName)));//获得文件输出流  
	                System.out.println(request.getSession().getServletContext().getRealPath("/"));
	                
	                Streams.copy(in, out1, true);//开始把文件写到你指定的上传文件夹  
	                in.close();
	                out1.close();
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
	}

	@RequestMapping("/dynamic.do")
	public String dynamic(HttpServletRequest request){
		int page=1;
		String page1 = request.getParameter("page");
		if(page1!="" && page1!=null){
			page = Integer.parseInt(page1);
		}
		List<News> list = ndao.all();
		int count = list.size();
		count = (int) Math.ceil((count+0.0)/15);
		String state="启用";
		List<News> nlist = ndao.findByState1(state, (page-1)*15);
		for (int i = 0; i < nlist.size(); i++) {
			String d=nlist.get(i).getDate();
			String a[] = d.split("-");
			String date=a[0]+"年"+a[1]+"月"+a[2]+"日";
			nlist.get(i).setDate(date);
		}
		request.setAttribute("nlist", nlist);	
		request.setAttribute("page", page);	
		request.setAttribute("count", count);
		return "user/dynamic";
	}
	
	@RequestMapping("/news-update1.do")
	public void newsupdate1(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String state="启用";
		ndao.updateState(state,id);
		//加入日志
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(now);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("news");
		log.setDate(date);
		log.setContent("修改状态为启用");
		log.setType("成功");
		ldao.add(log);
		
		out.print("已启用");
	}
	
	@RequestMapping("/news-update2.do")
	public void newsupdate2(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String state="停用";
		ndao.updateState(state,id);
		//加入日志
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(now);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("news");
		log.setDate(date);
		log.setContent("修改状态为停用");
		log.setType("成功");
		ldao.add(log);
		
		out.print("已停用");
	}
	@RequestMapping("/news-info1.do")
	public String newsinfo1(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		News news = ndao.findById(id);
		request.setAttribute("news", news);		
		return "user/news-info";
	}
	@RequestMapping("/news-update.do")
	public void newsupdate(HttpServletRequest request, HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int id = Integer.parseInt(request.getParameter("id"));
		String title = URLDecoder.decode(request.getParameter("title"),"UTF-8");
		String content =  URLDecoder.decode(request.getParameter("content"),"UTF-8");
		String image = request.getParameter("file");
		News news1 = ndao.findById(id);
		News news = new News();
		System.out.println(id);
		if(image==null || image==""){
			news.setImage(news1.getImage());
		}else{
			news.setImage(image);
		}
		news.setId(id);
		news.setTitle(title);
		news.setContent(content);
		ndao.updateById(news);
		//加入日志
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String date = df.format(now);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("news");
		log.setDate(date);
		log.setContent("修改");
		log.setType("成功");
		ldao.add(log);
		
		out.print("修改成功");
	}
	
	@RequestMapping("/news-info.do")
	public String newsinfo(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));
		News news = ndao.findById(id);
		request.setAttribute("news", news);		
		return "Administrator/template/news/news-update";
	}

}
