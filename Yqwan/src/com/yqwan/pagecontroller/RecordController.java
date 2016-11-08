package com.yqwan.pagecontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.sf.json.JSONArray;

import com.yqwan.dao.IGameInfoDao;
import com.yqwan.dao.IRecordDao;
import com.yqwan.domain.Gameinfo;
import com.yqwan.domain.Record;

@Controller("recordcontroller")
public class RecordController {
	@Resource
	private IRecordDao recorddao;
	@Resource
	private IGameInfoDao gameinfodao;
	
	/**
	 * 游戏专辑
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/gamerecord.do")
	public void record(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String num = request.getParameter("n");
		List<Record> record = recorddao.listRecordnum(8*Integer.parseInt(num));
		JSONArray obj = JSONArray.fromObject(record);
		String list = obj.toString();
		out.print(list);	
	}
	/**
	 * 进入专辑游戏
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@RequestMapping("/recordgame.do")
	public String recordgame(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String recordid = request.getParameter("recordid");
		Record record = recorddao.getrecordbyid(Integer.parseInt(recordid));
		
		int click = record.getClick();
		Record recordclick = new Record();
		recordclick.setClick(click+1);
		recordclick.setId(record.getId());
		recorddao.update(recordclick);
		
		String gameids = record.getGameid();
		String[] game = gameids.split(",");
		List<Gameinfo> list =new ArrayList<Gameinfo>();
		for(int i=0;i<game.length;i++){
			Gameinfo gameinfo = gameinfodao.findBynameid(game[i].trim());
			list.add(gameinfo);
		}
		
		request.setAttribute("record", record);
		request.setAttribute("games", list);
		return "recordinfo";
	}
	
}
