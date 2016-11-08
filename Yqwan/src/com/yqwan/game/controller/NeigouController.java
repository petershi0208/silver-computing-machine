package com.yqwan.game.controller;

import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alipay.util.UtilDate;
import com.yqwan.cplfactory.CPL;
import com.yqwan.cplfactory.CPLNameFactory;
import com.yqwan.dao.IGameDistrictDao;
import com.yqwan.dao.IGameListDao;
import com.yqwan.dao.IRegionDao;
import com.yqwan.domain.Gamedistrict;
import com.yqwan.domain.LatestRegion;
import com.yqwan.domain.User;
import com.yqwan.gamefactory.GamenameFactory;
import com.yqwan.gamefactory.Operation;
import com.yqwan.service.Log;
import com.yqwan.sign.MD5;


@Controller("neigou")
public class NeigouController {
	@Resource
	private IRegionDao regiondao;
	@Resource
	private IGameListDao gamelistdao;
	@Resource
	private IGameDistrictDao gamedistrictdao;
	
	/**
	 * 游戏开始统一入口
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/startgame.do")
	public String unionentrance(HttpServletRequest request, HttpServletResponse response){
		String originalpage = request.getParameter("originalpage");
		String gameid = request.getParameter("gameid");
		String serverid =request.getParameter("serverid");							//服务器ID
		User user = (User) request.getSession().getAttribute("user");	
		String gamename = gamelistdao.getgamenamebygameid(Integer.parseInt(gameid));
		request.setAttribute("gamename", gamename);
		request.setAttribute("gameid", gameid);
		if(user!=null){
			if(gamename!=null){
				Gamedistrict gd = new Gamedistrict();
				gd.setGamename(gamename);
				gd.setServerid(Integer.parseInt(serverid));
				String region = gamedistrictdao.getregionByserverid(gd);		//根据分区ID获得分区名字
				request.setAttribute("gameregion", region);
			
				String userid = user.getUserid();
				Log.logResult(UtilDate.getDateFormatter()+";玩家:"+userid+"进入"+gamename+",区服:"+serverid+"\r\n", "d:\\Logs\\LoginLogs");	//日志
				Operation oper;
				try {
					oper = GamenameFactory.createOperation(gamename, user.getOpenuserid(), Integer.parseInt(serverid));
					String url = oper.buildRequest(UtilDate.getTimeStamp());
					request.setAttribute("game_url", url);			//游戏真实地址
				} catch (Exception e) {
					e.printStackTrace();
					return "lookforward";			//实例化异常,无该游戏或者未开放
				}
				LatestRegion lregion = new LatestRegion(userid,user.getNickname(),gamename,region,Integer.parseInt(serverid),UtilDate.getDateFormatter());	
				LatestRegion regionor = regiondao.findregion(userid,gamename,serverid);
				if(regionor==null){
					lregion.setBattle("0");
					lregion.setLv("0");
					regiondao.insertregion(lregion);
				}else{
					String Result = oper.checkuser();
					JSONObject jsonobject = JSONObject.fromObject(Result);
					String status = jsonobject.getString("status");
					if("0".equals(status)){
						String battle = jsonobject.getString("battlevalue");
						String lv = jsonobject.getString("lv");
						lregion.setBattle(battle);
						lregion.setLv(lv);
						regiondao.updateregion(lregion);
					}
				}		
				return originalpage+"/gameStart";
			}else{
				return "lookforward";			//无该游戏或者未开放
			}						
		}else{
			request.setAttribute("game_url", "");			//玩家未登录状态，返回游戏页面提示登录
			return originalpage+"/gameStart";
		}			
	}
	
	
	/**
	 * 跳转至登录页,登录页统一入口
	 * @param request
	 * @return
	 */
	@RequestMapping("/toxsqstlogin.do")
	public String toxsqstlogin(HttpServletRequest request){
		String original = request.getParameter("original");
		String gameid = request.getParameter("gameid");
		String invitecode = request.getParameter("invitecode");			//推广码
		String tid = request.getParameter("tid");						//易瑞特码
		
		String recordID = request.getParameter("recordID");			//聚享游码
		String tokenID = request.getParameter("tokenID");			//聚享游(广告位码)
		
		String regid = request.getParameter("regid");				//天天钻用户唯一标识
		String project_id = request.getParameter("project_id");		//天天钻项目ID标识（广告码）
		String ttzcode = request.getParameter("ttzcode");			//天天钻生成每位用户的验证ttzcode
		
		String annalID = request.getParameter("annalID");		//蹦蹦网用户唯一标识
		String adID = request.getParameter("adID");				//蹦蹦网广告ID
		
		String uid = request.getParameter("uid");				//聚聚玩用户唯一标识
			
		if(tid!=null){
			User user = (User) request.getSession().getAttribute("user");
			if(user!=null){
				try {
					CPL yrtcpl = CPLNameFactory.createCPL(invitecode); 	//如果是推广
					yrtcpl.buildRequest(user.getOpenuserid(),tid,"","");
					request.getSession().removeAttribute("tid");
				} catch (Exception e) {
					System.out.println("邀请码Exception="+invitecode+";易瑞特码E="+tid);
					if("gameH5".equals(original)||"gameH5/phoneLogin".equals(original) && gameid!=null){
						return "redirect:startgame.do?gameid="+gameid+"&serverid=1&originalpage="+original;
					}else if(original!=null){
						return original+"/login";
					}else{
						return "gameXSQST/login";
					}
				}				
			}	
		}	
		if(regid!=null && project_id!=null && ttzcode!=null){
			String mysign = MD5.sign(project_id+regid,"4d11d05aff0c626d3edc6048f1c63eff", "utf-8");
			if(mysign.equals(ttzcode)){
				tid=regid;
				tokenID=project_id;
			}
		}
		if(recordID!=null) tid=recordID;
		
		if(annalID!=null && adID!=null){
			tid = annalID;
			tokenID = adID;
		}
		if(uid!=null) tid=uid;
		if(invitecode!=null){
			HttpSession session = request.getSession();
			session.setAttribute("invitecode",invitecode);
			session.setMaxInactiveInterval(3600);
		}
		if(tokenID!=null){
			HttpSession session = request.getSession();
			session.setAttribute("tokenID",tokenID);
			session.setMaxInactiveInterval(3600);
		}
		if(tid!=null){
			HttpSession session1 = request.getSession();
			session1.setAttribute("tid",tid);
			session1.setMaxInactiveInterval(3600);
		}
System.out.println("邀请码="+invitecode+";推广码="+tid);
		if("gameH5".equals(original)||"gameH5/phoneLogin".equals(original) && gameid!=null){			//H5游戏直接进到游戏页面
			return "redirect:startgame.do?gameid="+gameid+"&serverid=1&originalpage="+original;
		}else if("gameH5H".equals(original)&& gameid!=null){
			return "redirect:startgame.do?gameid="+gameid+"&serverid=1&originalpage="+original;
		}else if(original!=null){
			return original+"/login";
		}else{
			return "gameXSQST/login";
		}	
	}
	
	
	/**
	 * 获得最近登陆区
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/getrecentregion.do")
	public void getrecentregion(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("userid");
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"utf-8");		//游戏名字
		LatestRegion lastestregion = regiondao.findLatestRegion(userid,gamename);
		if(lastestregion==null){
			out.print("无");
		}else{
			out.print(lastestregion.getRegion()+","+lastestregion.getServerid());
		}
	}
	
	/**
	 * 根据游戏名字返回游戏ID
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/getgameidbygamename.do")
	public void getgameidbygamename(HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String gamename = URLDecoder.decode(request.getParameter("gamename"),"utf-8");		//游戏名字
		String callback = request.getParameter("jsoncallback");
		int gameid = gamelistdao.getgameidbygamename(gamename);
		String back = "{'code':0,\"gameid\":\""+gameid+"\"}";
		JSONObject jsonback = JSONObject.fromObject(back);
		out.print(callback + "(" + jsonback + ")");
	}
}
