package com.yqwan.ht.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.IRegionDao;
import com.yqwan.dao.ITradeDao;
import com.yqwan.domain.LatestRegion;
import com.yqwan.domain.Trade;

@Controller
public class playerController {
	@Resource
	private ITradeDao tradedao;
	@Resource
	private IRegionDao regiondao;
	/**
	 * 游戏注册人数及消费
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("administrator/playerdata.do")
	public String playerdata(HttpServletRequest request) throws UnsupportedEncodingException{
		String date = request.getParameter("date");
		String gamename = request.getParameter("gamename");
		if(gamename!=null){
			gamename = URLDecoder.decode(gamename,"UTF-8");
		}
		Trade trade = new Trade();
		trade.setDate(date);
		trade.setGamename(gamename);
		List<Trade> listtrade = tradedao.gamemoney(trade);
		LatestRegion region = new LatestRegion();
		region.setDate(date);
		region.setGamename(gamename);
		List<LatestRegion> listregion = regiondao.gameregister(region);
//		List<Statistics> liststat = new ArrayList<Statistics>();
//		for (Trade listt : listtrade) {
//			int tcount = listt.getCount();
//			String tname = listt.getGamename();
//			for (LatestRegion listr : listregion) {
//				int rcount = listr.getCount();
//				String rname = listr.getGamename();
//				if(rname.equals(tname)){
//					Statistics stat= new Statistics(tcount, rcount, rname);
//					
//					continue;
//				}else{
//					
//				}
//			}
//		}
		request.setAttribute("listtrade", listtrade);
		request.setAttribute("listregion", listregion);
		request.setAttribute("gamename", gamename);
		request.setAttribute("date", date);
		return "administratorht/template/data/playerdata";
	}
	
	@RequestMapping("administrator/player.do")
	public String player(HttpServletRequest request) throws UnsupportedEncodingException{
		String userid = request.getParameter("userid");
		String curpage = request.getParameter("page");		//获取当前页
		if(userid!=null && userid!=""){
			userid = URLDecoder.decode(userid,"UTF-8");
		}
		List<LatestRegion> region = new ArrayList<LatestRegion>();
		List<Trade> trade = tradedao.regionmoney(userid);
		if(curpage==null || curpage==""){
			region = regiondao.paging(userid,0,10);
			
		}else{
			int currentpage=Integer.parseInt(curpage);
			region = regiondao.paging(userid,(currentpage-1)*10,10);//分页查询
		}
		int count = regiondao.count(userid);
		request.setAttribute("count", count);
		request.setAttribute("region", region);
		request.setAttribute("trade", trade);
		request.setAttribute("userid", userid);
		return "administratorht/template/data/player";
	}
}
