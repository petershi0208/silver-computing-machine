package com.yqwan.cplfactory;

public class CPLNameFactory {
	
	/**
	 * CPL工厂管理
	 * @param spreadcode推广码
	 * @return广告商
	 */
	public static CPL createCPL(String spreadcode){
		CPL cpl = null;
		if("yrt199y".equals(spreadcode)){
			cpl = new YrtCPL();			
		}else if("jxy199y".equals(spreadcode)){
			cpl = new JxyCPL();			
		}else if("ttz199y".equals(spreadcode)){
			cpl = new TtzCPL();			
		}else if("bbw199y".equals(spreadcode)){
			cpl = new BbwCPL();			
		}else if("jjw199y".equals(spreadcode)){
			cpl = new JjwCPL();			
		}
		return cpl;
	}
}
