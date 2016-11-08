package com.yqwan.pagecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.ICdkeyBannerDao;
import com.yqwan.dao.ICdkeyInfoDao;
import com.yqwan.dao.IGameInfoDao;
import com.yqwan.dao.IGiftInfoDao;
import com.yqwan.domain.CdkeyBanner;
import com.yqwan.domain.Cdkeyinfo;
import com.yqwan.domain.Gameinfo;
import com.yqwan.domain.Giftinfo;

@Controller("codecentrcontroller")
public class CodecentreController {
	@Resource
	private IGiftInfoDao giftinfodao;;
	@Resource
	private ICdkeyInfoDao cdkeyinfodao;
	@Resource
	private IGameInfoDao gameinfodao;
	@Resource 
	private ICdkeyBannerDao cdkeybannerdao;
	
	/**
	 *  根据id查询礼包信息 查询游戏图片信息
	 * @param request
	 * @return
	 */
	@RequestMapping("/giftDetail.do")
	public String giftdetail(HttpServletRequest request){
		String aid = request.getParameter("id");
		if(aid!=null && aid!=""){
			int id = Integer.parseInt(aid);
			Giftinfo giftinfo = giftinfodao.findbyid(id);						//通过游戏名查询
			Gameinfo gameinfo = gameinfodao.findbyname(giftinfo.getGamename());	//gameinfo条件查询
			Calendar calendar = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				if(giftinfo.getDate()!=null){
					date = sdf.parse(giftinfo.getDate());
				}
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			calendar.setTime(date);
			calendar.add(Calendar.DATE, giftinfo.getTimelimit());
			int count = cdkeyinfodao.countByGiftid(id);
			int restcount = cdkeyinfodao.restCount(id);
			
			request.setAttribute("activetime",sdf.format(calendar.getTime()));	//到期时间
			request.setAttribute("count",count);								//cdkey总数
			request.setAttribute("restcount",restcount);						//cdkey剩余数量
			request.setAttribute("giftinfo",giftinfo);							
			request.setAttribute("gameinfo",gameinfo);
		}
		return "giveDetail";
	}
	/**
	 *  根据id返回cdkey
	 * @param request
	 * @return
	 */
	@RequestMapping("/giftDetail1.do")
	public void giftcdkey1(HttpServletRequest request){
		String aid = request.getParameter("id");
		if(aid!=null && aid!=""){
			Integer.parseInt(aid);
			if(1==1){
				
			}
			//Cdkeyinfo randomcdkey = cdkeyinfodao.randomcdkey(id);
			
		}
	}
	/**
	 * 随机返回一条cdkey
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/giftcdkey.do")
	public void giftcdkey(HttpServletRequest request, HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String aid = request.getParameter("giftid");
		String userid = request.getParameter("userid");
		if(aid!=null && aid!=""){
			int giftid = Integer.parseInt(aid);
			Cdkeyinfo cdkey = cdkeyinfodao.randomcdkey(giftid);
			int count = cdkeyinfodao.isreceive(userid, giftid);
			if(count==0){
				Cdkeyinfo c = new Cdkeyinfo();
				c.setCdkey(cdkey.getCdkey());
				c.setReceiptor(userid);
				c.setGiftid(giftid);
				int ret = cdkeyinfodao.updatebyCdkey(c);
				if(ret==0){
					System.out.println("修改cdkey领取失败");
				}else{
					System.out.println("修改cdkey领取成功");
				}
				out.print(cdkey.getCdkey());
			}else{
				Cdkeyinfo cdk = cdkeyinfodao.findbyrepeitor(userid, giftid);
				out.print(cdk.getCdkey());
			}
		}else{
			System.out.println("系统错误");
		}
	}
	/**
	 * 分页查询礼包信息
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/codecentre.do")
	public String updatecdkeybanner(HttpServletRequest request) throws UnsupportedEncodingException{
		// TODO Auto-generated catch block
		String curpage = request.getParameter("page");			//当前页数
		String giftname1 = request.getParameter("giftname");	//礼包名
		String giftname="";
		if(giftname1!=null && giftname1!=""){
			giftname = URLDecoder.decode(giftname1,"UTF-8");
		}
		//分页条件查询
		if(curpage!=null && curpage!=""){
			int currentpage=Integer.parseInt(curpage);
			List<Giftinfo> giftinfo = giftinfodao.paging(giftname,(currentpage-1)*6,6);
			request.setAttribute("giftinfo", giftinfo);
		}else{
			List<Giftinfo> giftinfo = giftinfodao.paging(giftname,0,6);
			request.setAttribute("giftinfo", giftinfo);
		}
		List<CdkeyBanner> cdkeybanner = cdkeybannerdao.listAll();//首页banner图
		request.setAttribute("cdkeybanner", cdkeybanner);
		int count = giftinfodao.count(giftname);				//总页数
		List<Giftinfo> topnine = giftinfodao.topnine();			//最新发号
		List<Giftinfo> qiang = giftinfodao.qiang();				//大家都在抢
		request.setAttribute("count", count);
		request.setAttribute("qiang", qiang);
		request.setAttribute("giftname", giftname);
		request.setAttribute("topnine", topnine);
		return "codecentre";
	}
}
