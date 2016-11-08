package com.yqwan.gamefactory;

import java.util.ArrayList;

import com.yqwan.domain.Game;
import com.yqwan.service.BeanListHandler;
import com.yqwan.service.FirstLetter;

public class GamenameFactory {
	/**
	 * 游戏工厂管理
	 * @param gamename	游戏名字
	 * @param userid	用户ID
	 * @param serverid	分区ID
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Operation createOperation(String gamename,String userid,int serverid){      
		String classpath = "d://AllPicture/yqwan/xml/";
		ArrayList list;
		Game game;
        try {     	
        	list = BeanListHandler.XmlToList(classpath+"games.xml");			//laya游戏
        	
    		for(int i = 0; i < list.size(); i++) {			//查看游戏是否在xml配置过（laya游戏）
    			game = (Game) list.get(i);
    			if(gamename.equals(game.getGamename())){
    				Class clazz = Class.forName("com.yqwan.gamefactory.GameOperation");
    				GameOperation oper = (GameOperation) clazz.newInstance();
    				oper.setServerid(serverid);
    				oper.setUserid(userid);
    				oper.setGame(game);
    				return oper;
    			}
    		}
		} catch (Exception e) {
			e.printStackTrace();
				System.out.println("gamesxml解析失败or实例化类异常!!!");
		}finally{
			list=null;
			game=null;
		}
		
		try {
        	list = BeanListHandler.XmlToList(classpath+"egretgames.xml");			//egret游戏
    		for(int i = 0; i < list.size(); i++){			//查看游戏是否在xml配置过（egret游戏）
    			game = (Game) list.get(i);
    			if(gamename.equals(game.getGamename())){
    				Class clazz = Class.forName("com.yqwan.gamefactory.EgretGamesOperation");
    				EgretGamesOperation oper = (EgretGamesOperation) clazz.newInstance();
    				oper.setServerid(serverid);
    				oper.setUserid(userid);
    				oper.setGame(game);
    				return oper;
    			}
    		}
		} catch (Exception e) {
			e.printStackTrace();
				System.out.println("egretxml解析失败or实例化类异常!!!");
		}finally{
			list=null;
			game=null;
		}
		
        	
        	
    	try {
    		 //通过反射获取实例,通过给定的类的 字符串名称获取该类,类的全名
			Class clazz = Class.forName("com.yqwan.gamefactory."+FirstLetter.cn2py(gamename).toUpperCase()+"Operation");
			try {
				Operation oper = (Operation) clazz.newInstance();
				oper.setServerid(serverid);
				oper.setUserid(userid);
				return oper;
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				System.out.println(gamename+"实例化异常");
				e.printStackTrace();
				return null;
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println(gamename+"这个实体类不存在");
			e.printStackTrace();
			return null;
		}
    }

	
}
