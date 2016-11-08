package com.yqwan.gamefactory;

import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.domain.Game;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;
import com.yqwan.sign.MD5;

public class EgretGamesOperation extends Operation {
	private Game game;
	private static final String appId="21539";
	
	public EgretGamesOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public EgretGamesOperation(){}
	
	@Override
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("userId",userid);
		sParaTemp.put("userName",userid);
		sParaTemp.put("userImg","");
		sParaTemp.put("userSex","");
		sParaTemp.put("time",timestamp);
		sParaTemp.put("channelExt", "Egret199Y");
		sParaTemp.put("sign", MD5.sign("appId="+appId+"time="+timestamp+"userId="+userid, game.getKey(),"utf-8"));
		String prestr = MapToParam.createKeyValue(sParaTemp);
		return game.getLoginpath()+"?"+prestr;
	}

	
	@Override
	public String checkuser() {
		// TODO Auto-generated method stub	
		return "{\"status\":\"0\",\"battlevalue\":\"egret游戏\",\"lv\":\"0\"}"; 		//test		
	}

	@Override
	public String payresult(String timestamp, String tradeNo, String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("orderId",tradeNo);
		sParaTemp.put("userId",userid+""); 
		sParaTemp.put("money", money);
		sParaTemp.put("ext",ext);
		sParaTemp.put("time",timestamp);
		sParaTemp.put("sign", MD5.sign("ext="+ext+"money="+money+"orderId="+tradeNo+"time="+timestamp+"userId="+userid, game.getKey(), "utf-8"));
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(game.getPaypath(),sParaTemp,"get");
			 Log.logResult(UtilDate.getDateFormatter()+";请求参数:"+sParaTemp+";"+game.getGamename()+"充值："+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");
			 int a = SubmitResult.indexOf("{");
			 int b = SubmitResult.lastIndexOf("}");
			 SubmitResult =  SubmitResult.substring(a, b+1);
			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
			 int code = jsonobject.getInt("code");
			 String msg = jsonobject.getString("msg");
			
			 if(0==code){
				 return "充值成功";
			 }else{
				 return msg;
			 }      
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "网络出错!";
		}	
	}	
	
	public Game getGame() {
		return game;
	}
	public void setGame(Game game) {
		this.game = game;
	}	
}
