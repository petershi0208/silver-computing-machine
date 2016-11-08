package com.yqwan.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;

import com.alipay.util.UtilDate;

public class PictureUpload {
	public void pictureupload(HttpServletRequest request,String path,Map<String,Object> map,List<String> filelist){
		Date now = new Date();
		SimpleDateFormat form1 = new SimpleDateFormat("yyyyMMddHHmmss");
		String date1 = form1.format(now);
	//将上传的文件写入到本地
		try{  
	//		 File tmpDir = null;//初始化上传文件的临时存放目录  
			 File saveDir = new File(path+"\\"+UtilDate.getMonth());//初始化上传文件后的保存目录 
			 if(!saveDir.exists()){
				 saveDir.mkdir();
			 }
			 path=path+"\\"+UtilDate.getMonth();
	         if(ServletFileUpload.isMultipartContent(request)){  
	         DiskFileItemFactory dff = new DiskFileItemFactory();//创建该对象  
	        // dff.setRepository();//指定上传文件的临时目录  
	         dff.setSizeThreshold(1024000);//指定在内存中缓存数据大小,单位为byte 
	         ServletFileUpload sfu = new ServletFileUpload(dff);//创建该对象  
	         sfu.setSizeMax(5000000);//指定单个上传文件的最大尺寸  
	         sfu.setSizeMax(15000000);//指定一次上传多个文件的总尺寸  
	         FileItemIterator fii = sfu.getItemIterator(request);//解析request 请求,并返回FileItemIterator集合  
	         while(fii.hasNext()){
	            FileItemStream fis = fii.next();//从集合中获得一个文件流  
                String name = fis.getFieldName();  	//得到表单域的名称     
                InputStream stream = fis.openStream();	//得到表单域的值（这是一个输入流）  
                Random r = new Random();
                int a = r.nextInt(100);  
	            if(!fis.isFormField() && fis.getName().length()>0){//过滤掉表单中非文件域  
	                //获得上传文件的文件名  
	            	String fileName = fis.getName().substring(fis.getName().lastIndexOf("//")+1);//获得上传文件的文件名 
//System.out.println(fileName);
	            	fileName = date1+a+fileName;
	                BufferedInputStream in = new BufferedInputStream(fis.openStream());//获得文件输入流  
	                BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(new File(path+"//"+fileName)));//获得文件输出流  
	                Streams.copy(in, out, true);//开始把文件写到你指定的上传文件夹 
	                if(name.equals("picture") && filelist!=null){
	                	 filelist.add(UtilDate.getMonth()+'/'+fileName);
	                }
	            	System.out.println("图片上传成功...");
	            	map.put(name,UtilDate.getMonth()+'/'+fileName);
	                in.close();
	                out.close();
	                stream.close();
	            }else{
	            	 String value = Streams.asString(stream,request.getCharacterEncoding());
	            	 map.put(name, value);
//System.out.println(value);
	            }
	          }
	        }  
	    }catch(Exception e){  
	    	System.out.println("图片上传失败...");
	        e.printStackTrace();  
	    }		
	}
}
