package com.yqwan.gamefactory;

import java.util.LinkedHashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.alipay.util.UtilDate;
import com.yqwan.domain.Game;
import com.yqwan.service.Http;
import com.yqwan.service.Log;
import com.yqwan.service.MapToParam;

public class GameOperation extends Operation {
	private Game game;
	private static final int isAdult = 1;	
	
	public GameOperation(String userid, int serverid) {
		super(userid, serverid);
		// TODO Auto-generated constructor stub
	}
	public GameOperation(){}
	
	@Override
	public String buildRequest(String timestamp) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("ptime",timestamp);
		sParaTemp.put("isadult",isAdult+"");
		String prestr = MapToParam.createRequestParams(sParaTemp,"&"+game.getKey());
		return game.getLoginpath()+"&"+prestr;
	}

	@Override
	public String checkuser() {
		// TODO Auto-generated method stub
		try {
			Map<String,String> sParam = new LinkedHashMap<String,String>();
			sParam.put("userid", userid);
			sParam.put("serverid", serverid+"");
			Http hp = Http.getInstance();
			String result = hp.hp(game.getCheckpath(), sParam, "get");
			JSONObject jsonobject = JSONObject.fromObject(result);
			String lv = jsonobject.getString("lv");
			String battlevalue = jsonobject.getString("battlevalue");
			return "{\"status\":\"0\",\"battlevalue\":\""+battlevalue+"\",\"lv\":\""+lv+"\"}"; 		//test
		} catch (Exception e){
			// TODO Auto-generated catch block
			return "{\"status\":\"1\",\"battlevalue\":\"0\",\"lv\":\"0\"}"; 		//test
		}
	}

	@Override
	public String payresult(String timestamp, String tradeNo, String money,String ext) {
		// TODO Auto-generated method stub
		Map<String, String> sParaTemp = new LinkedHashMap<String, String>();
		sParaTemp.put("userid",userid);
		sParaTemp.put("serverid",serverid+"");
		sParaTemp.put("ptime", timestamp);
		sParaTemp.put("order",tradeNo);
		sParaTemp.put("money",money);
		sParaTemp = MapToParam.createKeyValueMysign(sParaTemp, "&"+game.getKey());	//map中加入sign键值对
        String SubmitResult;
		try {
			Http h = Http.getInstance();
			 SubmitResult = h.hp(game.getPaypath(),sParaTemp,"get");
Log.logResult(UtilDate.getDateFormatter()+";"+game.getGamename()+"充值"+money+"元:"+userid+";回调记录："+SubmitResult+"\r\n", "d:\\Logs\\PayLogs");
			 int a = SubmitResult.indexOf("{");
			 int b = SubmitResult.lastIndexOf("}");
			 SubmitResult =  SubmitResult.substring(a, b+1);
			 JSONObject jsonobject = JSONObject.fromObject(SubmitResult);
			 String status = jsonobject.getString("status");
			 String msg = jsonobject.getString("msg");
//System.out.println("充值状态1为成功:"+status);
			
			 if("1".equals(status)){
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
