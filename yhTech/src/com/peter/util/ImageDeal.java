package com.peter.util;
	import java.awt.Color;
	import java.awt.Graphics;
	import java.awt.Graphics2D;
	import java.awt.Image;
import java.awt.Rectangle;
	import java.awt.geom.AffineTransform;
	import java.awt.image.AffineTransformOp;
	import java.awt.image.BufferedImage;
	import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.imageio.stream.ImageOutputStream;

/* *
 *类名：ImageDeal
 *功能：图像处理类
 *详细：对图片做处理
 *版本：1.0
 *日期：2016-07-11
 *author:TYShi
 */
	public class ImageDeal {

	    String openUrl; // 原始图片打开路径
	    String saveUrl; // 新图保存路径
	    String saveName; // 新图名称
	    String suffix; // 新图类型 只支持gif,jpg,png

	    public ImageDeal(String openUrl, String saveUrl, String saveName,
	            String suffix) {
	        this.openUrl = openUrl;
	        this.saveName = saveName;
	        this.saveUrl = saveUrl;
	        this.suffix = suffix;
	    }

	    /**
	     * 图片截图
	     * @param file
	     * @param newName
	     * @param path
	     * @param x
	     * @param y
	     * @param width 宽度
	     * @param height 高度
	     * @return
	     */
	    public void cutting(int x,int y, int width, int height) throws Exception{ 
	    		ImageOutputStream out = null; 
	    		InputStream is = null; 
	    		ImageInputStream iis = null;  
	    			File file = new File(openUrl);
		    		String endName = file.getName(); 
		    		endName = endName.substring(endName.lastIndexOf(".") + 1); 
		    		Iterator<ImageReader> readers = ImageIO.getImageReadersByFormatName(endName); 
		    		ImageReader reader = (ImageReader) readers.next(); 
		    		is = new FileInputStream(file); 
		    		iis = ImageIO.createImageInputStream(is); 
		    		reader.setInput(iis, true); 
	
		    		ImageReadParam param = reader.getDefaultReadParam(); 
		    		Rectangle rect = new Rectangle(x, y, width, height); 
		    		param.setSourceRegion(rect); 
		    		BufferedImage bi = reader.read(0, param); 
		    		File newFile = new File(saveUrl); 

		    		if (!newFile.exists()) 
		    		newFile.mkdirs(); 
		    		newFile = new File(saveUrl, saveName+"."+suffix); 
		    		out = ImageIO.createImageOutputStream(new FileOutputStream(newFile)); 
		    		ImageIO.write(bi, endName, out); 
		    		file = newFile;     			
				    iis.close(); 
				    is.close(); 
				    out.close(); 		    	
	    		} 
	    
	    /**
	     * 图片缩放.
	     * 
	     * @param width
	     *            需要的宽度
	     * @param height
	     *            需要的高度
	     * @throws Exception
	     */
	    public void zoom(int width, int height) throws Exception {
	        double sx = 0.0;
	        double sy = 0.0;

	        File file = new File(openUrl);
	        if (!file.isFile()) {
	            throw new Exception("ImageDeal>>>" + file + " 不是一个图片文件!");
	        }
	        BufferedImage bi = ImageIO.read(file); // 读取该图片
	        // 计算x轴y轴缩放比例--如需等比例缩放，在调用之前确保参数width和height是等比例变化的
	        sx = (double) width / bi.getWidth();
	        sy = (double) height / bi.getHeight();

	        AffineTransformOp op = new AffineTransformOp(
	                AffineTransform.getScaleInstance(sx, sy), null);
	        File sf = new File(saveUrl, saveName + "." + suffix);
	        Image zoomImage = op.filter(bi, null);
	        try {
	            ImageIO.write((BufferedImage) zoomImage, suffix, sf); // 保存图片
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	    }

	    /**
	     * 旋转
	     * 
	     * @param degree
	     *            旋转角度
	     * @throws Exception
	     */
	    public void spin(int degree) throws Exception {
	        int swidth = 0; // 旋转后的宽度
	        int sheight = 0; // 旋转后的高度
	        int x; // 原点横坐标
	        int y; // 原点纵坐标

	        File file = new File(openUrl);
	        if (!file.isFile()) {
	            throw new Exception("ImageDeal>>>" + file + " 不是一个图片文件!");
	        }
	        BufferedImage bi = ImageIO.read(file); // 读取该图片
	        // 处理角度--确定旋转弧度
	        degree = degree % 360;
	        if (degree < 0)
	            degree = 360 + degree;// 将角度转换到0-360度之间
	        double theta = Math.toRadians(degree);// 将角度转为弧度

	        // 确定旋转后的宽和高
	        if (degree == 180 || degree == 0 || degree == 360) {
	            swidth = bi.getWidth();
	            sheight = bi.getHeight();
	        } else if (degree == 90 || degree == 270) {
	            sheight = bi.getWidth();
	            swidth = bi.getHeight();
	        } else {
	            swidth = (int) (Math.sqrt(bi.getWidth() * bi.getWidth()
	                    + bi.getHeight() * bi.getHeight()));
	            sheight = (int) (Math.sqrt(bi.getWidth() * bi.getWidth()
	                    + bi.getHeight() * bi.getHeight()));
	        }

	        x = (swidth / 2) - (bi.getWidth() / 2);// 确定原点坐标
	        y = (sheight / 2) - (bi.getHeight() / 2);

	        BufferedImage spinImage = new BufferedImage(swidth, sheight,
	                bi.getType());
	        // 设置图片背景颜色
	        Graphics2D gs = (Graphics2D) spinImage.getGraphics();
	        gs.setColor(Color.white);
	        gs.fillRect(0, 0, swidth, sheight);// 以给定颜色绘制旋转后图片的背景

	        AffineTransform at = new AffineTransform();
	        at.rotate(theta, swidth / 2, sheight / 2);// 旋转图象
	        at.translate(x, y);
	        AffineTransformOp op = new AffineTransformOp(at,
	                AffineTransformOp.TYPE_BICUBIC);
	        spinImage = op.filter(bi, spinImage);
	        File sf = new File(saveUrl, saveName + "." + suffix);
	        ImageIO.write(spinImage, suffix, sf); // 保存图片
	    }
	    
	    /**
	     * 马赛克化.
	     * @param size  马赛克尺寸，即每个矩形的长宽
	     * @return
	     * @throws Exception
	     */
	    public boolean mosaic(int size) throws Exception {
	        File file = new File(openUrl);
	        if (!file.isFile()) {
	            throw new Exception("ImageDeal>>>" + file + " 不是一个图片文件!");
	        }
	        BufferedImage bi = ImageIO.read(file); // 读取该图片
	        BufferedImage spinImage = new BufferedImage(bi.getWidth(),
	                bi.getHeight(), bi.TYPE_INT_RGB);
	        if (bi.getWidth() < size || bi.getHeight() < size || size <= 0) { // 马赛克格尺寸太大或太小
	            return false;
	        }

	        int xcount = 0; // 方向绘制个数
	        int ycount = 0; // y方向绘制个数
	        if (bi.getWidth() % size == 0) {
	            xcount = bi.getWidth() / size;
	        } else {
	            xcount = bi.getWidth() / size + 1;
	        }
	        if (bi.getHeight() % size == 0) {
	            ycount = bi.getHeight() / size;
	        } else {
	            ycount = bi.getHeight() / size + 1;
	        }
	        int x = 0;   //坐标
	        int y = 0;
	        // 绘制马赛克(绘制矩形并填充颜色)
	        Graphics gs = spinImage.getGraphics();
	        for (int i = 0; i < xcount; i++) {
	            for (int j = 0; j < ycount; j++) {
	                //马赛克矩形格大小
	                 int mwidth = size;
	                 int mheight = size;
	                 if(i==xcount-1){   //横向最后一个比较特殊，可能不够一个size
	                     mwidth = bi.getWidth()-x;
	                 }
	                 if(j == ycount-1){  //同理
	                     mheight =bi.getHeight()-y;
	                 }
	              // 矩形颜色取中心像素点RGB值
	                int centerX = x;
	                int centerY = y;
	                if (mwidth % 2 == 0) {
	                    centerX += mwidth / 2;
	                } else {
	                    centerX += (mwidth - 1) / 2;
	                }
	                if (mheight % 2 == 0) {
	                    centerY += mheight / 2;
	                } else {
	                    centerY += (mheight - 1) / 2;
	                }
	                Color color = new Color(bi.getRGB(centerX, centerY));
	                gs.setColor(color);
	                gs.fillRect(x, y, mwidth, mheight);
	                y = y + size;// 计算下一个矩形的y坐标
	            }
	            y = 0;// 还原y坐标
	            x = x + size;// 计算x坐标
	        }
	        gs.dispose();
	        File sf = new File(saveUrl, saveName + "." + suffix);
	        ImageIO.write(spinImage, suffix, sf); // 保存图片
	        return true;
	    }

	    public static void main(String[] args) throws Exception {
	        ImageDeal imageDeal = new ImageDeal("e://1.jpg", "e://", "2", "jpg");
	        // 测试缩放
	        /* imageDeal.zoom(200, 300); */
	        // 测试旋转
	        /* imageDeal.spin(90); */
	        //测试马赛克
	        /*imageDeal.mosaic(4);*/
	    }
}
