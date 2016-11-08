package com.daqian.adminController;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.CreditorDao;
import com.daqian.dao.ProductinfosDAO;
import com.daqian.entity.Creditor;
import com.daqian.entity.Productinfos;
import com.daqian.entity.purchase;

@Controller
public class CreditorController {
	@Resource
	private CreditorDao cdao;
	@Resource
	private ProductinfosDAO pdao;
	
	@RequestMapping("ht/reditor-add")
	public String creditoradd(HttpServletRequest request){
		return "Administrator/template/register/creditor-add";
	}
	@RequestMapping("ht/creditor-add1")
	public String creditoradd1(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");					
		String uname = request.getParameter("uname");				//姓名
		String sex = request.getParameter("sex");					//性别
		String marital = request.getParameter("marital");			//婚姻
		String idcard = request.getParameter("idcard");				//身份证
		String age = request.getParameter("age");					//年龄
		String phone = request.getParameter("phone");				//电话
		String telephone = request.getParameter("telephone");		//固定电话
		int money = Integer.parseInt(request.getParameter("money"));				//申请金额
		String localhouse = request.getParameter("localhouse");		//本地房产
		String live = request.getParameter("live");					//居住状况
		String sociensure = request.getParameter("sociensure");		//社保
		String commpf = request.getParameter("commpf");				//公积金
		String unitName = request.getParameter("unit_name");		//单位名称
		String unitSite = request.getParameter("unit_site");		//单位地址
		String unitNature = request.getParameter("unit_nature");	//单位性质
		String unitPhone = request.getParameter("unit_phone");		//电话
		String position = request.getParameter("position");			//职位
		String education = request.getParameter("education");		//学历
		String wages = request.getParameter("wages");				//收入
		String homeNumber = request.getParameter("home_number");			//家庭人数
		String homeRegistry = request.getParameter("home_registry");		//户籍地
		String homeRegistryid = request.getParameter("home_registryid");	//户籍号
		String address = request.getParameter("address");					//现居住地
		String wechat = request.getParameter("wechat");				//微信
		String rela1 = request.getParameter("rela1");				//关系人1
		String rela1Name = request.getParameter("rela1_name");		//关系人1姓名
		String rela1Phone = request.getParameter("rela1_phone");	//关系人1电话
		String rela2 = request.getParameter("rela2");				//关系人2
		String rela2Name = request.getParameter("rela2_name");		//关系人2姓名
		String rela2Phone = request.getParameter("rela2_phone");	//关系人2电话
		String rela3 = request.getParameter("rela3");				//关系人3
		String rela3Name = request.getParameter("rela3_name");		//关系人3姓名
		String rela3Phone = request.getParameter("rela3_phone");	//关系人3电话
		String contact1Name = request.getParameter("contact1_name");	//联系人1姓名
		String contact1Phone = request.getParameter("contact1_phone");	//联系人1电话
		String contact2Name = request.getParameter("contact2_name");	//联系人2姓名
		String contact2Phone = request.getParameter("contact2_phone");	//联系人2电话
		
		Date now = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = format.format(now);
		Creditor c = new Creditor(uname, sex, marital, idcard, age, phone, telephone, money, localhouse, live, sociensure, commpf, unitName, unitSite, unitNature, unitPhone, position, education, wages, homeNumber, homeRegistry, homeRegistryid, address, wechat, rela1, rela1Name, rela1Phone, rela2, rela2Name, rela2Phone, rela3, rela3Name, rela3Phone, contact1Name, contact1Phone, contact2Name, contact2Phone, date);
		cdao.add(c);
		return "redirect:reditor-add.do";
	}
	
	@RequestMapping("ht/creditor-update1")
	public String creditorupdate1(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");					
		int id = Integer.parseInt(request.getParameter("id"));		//编号
		String uname = request.getParameter("uname");				//姓名
		String sex = request.getParameter("sex");					//性别
		String marital = request.getParameter("marital");			//婚姻
		String idcard = request.getParameter("idcard");				//身份证
		String age = request.getParameter("age");					//年龄
		String phone = request.getParameter("phone");				//电话
		String telephone = request.getParameter("telephone");		//固定电话
		int money = Integer.parseInt(request.getParameter("money"));				//申请金额
		String localhouse = request.getParameter("localhouse");		//本地房产
		String live = request.getParameter("live");					//居住状况
		String sociensure = request.getParameter("sociensure");		//社保
		String commpf = request.getParameter("commpf");				//公积金
		String unitName = request.getParameter("unit_name");		//单位名称
		String unitSite = request.getParameter("unit_site");		//单位地址
		String unitNature = request.getParameter("unit_nature");	//单位性质
		String unitPhone = request.getParameter("unit_phone");		//电话
		String position = request.getParameter("position");			//职位
		String education = request.getParameter("education");		//学历
		String wages = request.getParameter("wages");				//收入
		String homeNumber = request.getParameter("home_number");			//家庭人数
		String homeRegistry = request.getParameter("home_registry");		//户籍地
		String homeRegistryid = request.getParameter("home_registryid");	//户籍号
		String address = request.getParameter("address");					//现居住地
		String wechat = request.getParameter("wechat");				//微信
		String rela1 = request.getParameter("rela1");				//关系人1
		String rela1Name = request.getParameter("rela1_name");		//关系人1姓名
		String rela1Phone = request.getParameter("rela1_phone");	//关系人1电话
		String rela2 = request.getParameter("rela2");				//关系人2
		String rela2Name = request.getParameter("rela2_name");		//关系人2姓名
		String rela2Phone = request.getParameter("rela2_phone");	//关系人2电话
		String rela3 = request.getParameter("rela3");				//关系人3
		String rela3Name = request.getParameter("rela3_name");		//关系人3姓名
		String rela3Phone = request.getParameter("rela3_phone");	//关系人3电话
		String contact1Name = request.getParameter("contact1_name");	//联系人1姓名
		String contact1Phone = request.getParameter("contact1_phone");	//联系人1电话
		String contact2Name = request.getParameter("contact2_name");	//联系人2姓名
		String contact2Phone = request.getParameter("contact2_phone");	//联系人2电话
		
		Creditor c = new Creditor(id, uname, sex, marital, idcard, age, phone, telephone, money, localhouse, live, sociensure, commpf, unitName, unitSite, unitNature, unitPhone, position, education, wages, homeNumber, homeRegistry, homeRegistryid, address, wechat, rela1, rela1Name, rela1Phone, rela2, rela2Name, rela2Phone, rela3, rela3Name, rela3Phone, contact1Name, contact1Phone, contact2Name, contact2Phone);
		int res = cdao.update(c);
		return "redirect:creditor-single.do?id="+id+"&res="+res;
	}
	
	@RequestMapping("ht/creditor-single")
	public String creditorupdate(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));		//编号
		String res = request.getParameter("res");
		Creditor creditor = cdao.findById(id);
		request.setAttribute("creditor", creditor);
		request.setAttribute("res", res);
		return "Administrator/template/register/creditor-update";
	}
	
	@RequestMapping("creditorinfo")
	public String creditorinfo(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));		//编号
		Creditor creditor = cdao.findById(id);
		List<Productinfos> p = pdao.findBySperson(id+"");
		HttpSession session44 = request.getSession();
		List<purchase> pur = (List<purchase>) session44.getAttribute("purcha");
		String a = "";
		if(pur!=null && p!=null){
			flag:for (int i = 0; i < pur.size(); i++) {
				for (int j = 0; j < p.size(); j++) {
					System.out.println(pur.get(i).getProductname()+"--"+p.get(j).getProductname());
					if(pur.get(i).getProductname().equals(p.get(j).getProductname())){
						a = "suc";
						break flag;
					}else{
						a = "err";
					}
				}
				
			}
		}
		System.out.println(a);
		request.setAttribute("a", a);
		request.setAttribute("r", creditor);
		return "user/creditorinfo";
	}
	/**
	 * 产品发布
	 * @param request
	 * @return
	 */
	@RequestMapping("ht/producadd")
	public String producadd(HttpServletRequest request){
		List<Creditor> creditor = cdao.all();
		request.setAttribute("creditor", creditor);
		return "Administrator/template/register/products-add";
	}
	
	@RequestMapping("ht/creditor")
	public String creditor(HttpServletRequest request){
		List<Creditor> creditor = cdao.all();
		request.setAttribute("creditor", creditor);
		return "Administrator/template/register/creditor";
	}
	
	@RequestMapping("ht/creditor-del")
	public String creditordel(HttpServletRequest request){
		int id = Integer.parseInt(request.getParameter("id"));		//编号
		int a = cdao.delete(id);
		return "redirect:creditor.do";
	}
}
