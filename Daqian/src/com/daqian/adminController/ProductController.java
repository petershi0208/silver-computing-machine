package com.daqian.adminController;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daqian.dao.CreditorDao;
import com.daqian.dao.LoginfosDAO;
import com.daqian.dao.ProductinfosDAO;
import com.daqian.dao.SubproductDAO;
import com.daqian.entity.Creditor;
import com.daqian.entity.Loginfoss;
import com.daqian.entity.Productinfos;
import com.daqian.entity.Subproduct;

@Controller
public class ProductController {
	@Resource
	private ProductinfosDAO pdao;
	@Resource
	private SubproductDAO sdao;
	@Resource
	private LoginfosDAO ldao;
	@Resource
	private CreditorDao cdao;
	/**
	 * 
	 * 理财产品信息
	 * 查询所有
	 */
	@RequestMapping("/products-info.do")
	public String productsinfo(HttpServletRequest request){
		String date1 = request.getParameter("date1");
		String date2 = request.getParameter("date2");
		if(date1!="" && date2!="" && date1!=null && date2!=null){
			List<Productinfos> plist = pdao.findBydate(date1,date2);
			request.setAttribute("aaa", plist);	
		}else{
			List<Productinfos> list = pdao.all();
			request.setAttribute("aaa", list);	
		}
		return "Administrator/template/product/products-info";
	}
	/**
	 * 
	 * 理财产品信息
	 * 根据id查询
	 */
	@RequestMapping("/products-update.do")
	public String productsupdate(HttpServletRequest request){
		int pid=Integer.parseInt(request.getParameter("id"));				//产品id
		Productinfos p = pdao.findById(pid);
		request.setAttribute("p", p);	
		return "Administrator/template/product/products-update";	
	}
	/**
	 * 理财产品信息
	 * 根据时间查询
	 * 
	 */
//	@RequestMapping("/products-info1.do")
//	public String productsinfo1(HttpServletRequest request){
//		String date1 = request.getParameter("date1");
//		String date2 = request.getParameter("date2");
//		System.out.println(date1+date2);
//		if(date1!="" && date2!=""){
//			List<Productinfos> plist = pdao.findBydate(date1,date2);
//			request.setAttribute("aaa", plist);	
//		}else{
//			List<Productinfos> list = pdao.all();
//			request.setAttribute("aaa", list);	
//		}
//		return "Administrator/template/product/products-info";
//			
//	}
	/**
	 * 验证产品是否重复
	 */
	@RequestMapping("/isproducts.do")
	public void isproducts(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String productname=URLDecoder.decode(request.getParameter("productname"),"UTF-8");				//产品
		Productinfos p = pdao.findByPname(productname);
		System.out.println(productname);
		System.out.println(p);
		if(p!=null){
			out.print("产品已存在");
		}
	}
	/**
	 * 产品单查
	 */
	@RequestMapping("/productsig.do")
	public String productsig(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int pid = Integer.parseInt(request.getParameter("pid"));
		int sid = Integer.parseInt(request.getParameter("sid"));
		Subproduct s = sdao.findById(sid);
		Productinfos p = pdao.findById(pid);
		Creditor cc = cdao.findById(Integer.parseInt(s.getSperson()));
		request.setAttribute("cc", cc);
		request.setAttribute("s", s);
		request.setAttribute("p", p);
		List<Creditor> creditor = cdao.all();
		request.setAttribute("creditor", creditor);
		return "Administrator/template/register/products-update";
	}
	/**
	 * 
	 * 理财产品信息
	 * 添加数据
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/addproducts.do")
	public String addproducts(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String productname=URLDecoder.decode(request.getParameter("productname"),"UTF-8");				//产品
		int cycle=Integer.parseInt(request.getParameter("cycle"));			//周期
		int money=Integer.parseInt(request.getParameter("money"));		//投资金额
		
		String sperson = request.getParameter("sperson");
		
	
		int yearreturn=Integer.parseInt(request.getParameter("yearreturn"));	//年利率
		int duereturn=Integer.parseInt(request.getParameter("duereturn"));		//到期利率
//		int monthoryear=Integer.parseInt(request.getParameter("monthoryear"));	//年付月付
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");			//日期
		String pdate = df.format(now);
		
		Productinfos p = new Productinfos();
		p.setProductname(productname);
		p.setCycle(cycle);
		p.setMinmoney(money);
		p.setMaxmoney(money);
		p.setLastmoney(money);
		p.setPerson("张三");													//发布人
		p.setPdate(pdate);
		int res1 = pdao.add(p);
		if(res1!=-1){
			Productinfos product = pdao.findByPname(productname);
			int pid = product.getPid();							//产品id
			Subproduct s=new Subproduct();
			s.setPid(pid);
			s.setMinamount(money);
			s.setMaxamount(money);
			s.setYearreturn(yearreturn);
			s.setDuereturn(duereturn);
			s.setMonthoryear(2);
			s.setSperson(sperson);
			s.setSdate(pdate);
			int res2 = sdao.add(s);
			if(res2==-1){
				pdao.delete(productname);
			}
		}
		return "redirect:ht/producadd.do";
	}
	
	/**
	 * 
	 * 理财产品信息
	 * 修改数据
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/products-update2.do")
	public String productsupdate2(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String productname=URLDecoder.decode(request.getParameter("productname"),"UTF-8");				//产品
		int cycle=Integer.parseInt(request.getParameter("cycle"));			//周期
		int money=Integer.parseInt(request.getParameter("money"));		//投资金额
		int pid=Integer.parseInt(request.getParameter("pid"));				//id
		String sperson = request.getParameter("sperson");
		
		int sid=Integer.parseInt(request.getParameter("sid"));					//子产品id
		double yearreturn=Double.parseDouble(request.getParameter("yearreturn"));	//年利率
		double duereturn=Double.parseDouble(request.getParameter("duereturn"));		//到期利率
//		int monthoryear=Integer.parseInt(request.getParameter("monthoryear"));	//年付月付
		
		Productinfos p = new Productinfos();
		p.setPid(pid);
		p.setProductname(productname);
		p.setCycle(cycle);
		p.setMinmoney(money);
		p.setMaxmoney(money);
		p.setLastmoney(money);
		p.setPerson("张三");													//发布人
		pdao.updateById(p);
		
		
		
		Productinfos product = pdao.findByPname(productname);
		int id = product.getPid();							//产品id
		Subproduct s=new Subproduct();
		s.setSid(sid);
		s.setPid(id);
		s.setMinamount(money);
		s.setMaxamount(money);
		s.setYearreturn(yearreturn);
		s.setDuereturn(duereturn);
		s.setMonthoryear(2);
		s.setSperson(sperson);
		sdao.updateById(s);
		
		
		//加入日志
		Date now1 = new Date();
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = df1.format(now1);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("product");
		log.setDate(date1);
		log.setContent("修改");
		log.setType("成功");
		ldao.add(log);
		return "redirect:subproduct.do";
		//return "redirect:productsig.do?pid="+pid+"&sid="+sid;	
	}
	/**
	 * 
	 * 理财产品信息
	 * 添加数据
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/products-add1.do")
	public String productsadd1(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String productname=request.getParameter("productname");				//产品
		int cycle=Integer.parseInt(request.getParameter("cycle"));			//周期
		int minmoney=Integer.parseInt(request.getParameter("minmoney"));	//起投金额
		int maxmoney=Integer.parseInt(request.getParameter("maxmoney"));	//最大金额
		int lastmoney=Integer.parseInt(request.getParameter("lastmoney"));	//剩余金额
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");			//日期
		String pdate = df.format(now);
		Productinfos p = new Productinfos();
		p.setProductname(productname);
		p.setCycle(cycle);
		p.setMinmoney(minmoney);
		p.setMaxmoney(maxmoney);
		p.setLastmoney(lastmoney);
		p.setPerson("张三");													//发布人
		p.setPdate(pdate);
		pdao.add(p);
		
		//加入日志
		Date now1 = new Date();
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = df1.format(now1);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("product");
		log.setDate(date1);
		log.setContent("添加");
		log.setType("成功");
		ldao.add(log);
		
		return "redirect:Administrator/template/product/products-add";
	}
	
	/**
	 * 
	 * 理财产品信息
	 * 修改数据
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/products-update1.do")
	public String productsupdate1(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String productname=request.getParameter("productname");				//产品
		int cycle=Integer.parseInt(request.getParameter("cycle"));			//周期
		int minmoney=Integer.parseInt(request.getParameter("minmoney"));	//起投金额
		int maxmoney=Integer.parseInt(request.getParameter("maxmoney"));	//最大金额
		int lastmoney=Integer.parseInt(request.getParameter("lastmoney"));	//剩余金额
		int pid=Integer.parseInt(request.getParameter("pid"));				//id
		Productinfos p = new Productinfos();
		p.setProductname(productname);
		p.setCycle(cycle);
		p.setMinmoney(minmoney);
		p.setMaxmoney(maxmoney);
		p.setLastmoney(lastmoney);
		p.setPid(pid);
		pdao.updateById(p);
		
		//加入日志
		Date now1 = new Date();
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = df1.format(now1);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("product");
		log.setDate(date1);
		log.setContent("修改");
		log.setType("成功");
		ldao.add(log);
		return "redirect:products-update.do";	
	}
	/**
	 * 
	 * 理财产品信息
	 * 查询所有
	 */
	@RequestMapping("/subproduct-add.do")
	public String productsadd(HttpServletRequest request){
		List<Productinfos> plist = pdao.all();
		request.setAttribute("plist", plist);
		return "Administrator/template/product/subproduct-add";
	}
	/**
	 * 
	 * 产品利率信息
	 * 查询数据
	 */
	@RequestMapping("/subproduct-info.do")
	public String subproductinfo(HttpServletRequest request){
		List<Productinfos> plist = pdao.pall();
		request.setAttribute("plist", plist);	
		return "Administrator/template/product/subproduct-info";	
	}
	/**
	 * 
	 * 产品利率信息
	 * 查询数据
	 */
	@RequestMapping("/subproduct.do")
	public String subproduct(HttpServletRequest request){
		List<Creditor> creditor = cdao.all();
		request.setAttribute("creditor", creditor);
		List<Productinfos> plist = pdao.pall();
		request.setAttribute("plist", plist);	
		return "Administrator/template/register/subproduct-info";	
	}
	/**
	 * 
	 * 产品利率信息
	 * 根据id查询
	 */
	@RequestMapping("/subproduct-update.do")
	public String subproductupdate(HttpServletRequest request){
		int sid = Integer.parseInt(request.getParameter("id"));
		List<Productinfos> plist = pdao.all();
		request.setAttribute("plist", plist);
		Subproduct s = sdao.findById(sid);
		request.setAttribute("s",s);
		return "Administrator/template/product/subproduct-update";	
	}
	/**
	 * 
	 * 产品利率信息
	 * 添加数据
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/subproduct-add1.do")
	public void subproductadd1(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int pid=Integer.parseInt(request.getParameter("pid"));					//产品id
		int minamount=Integer.parseInt(request.getParameter("minamount"));		//最小投资金额
		int maxamount=Integer.parseInt(request.getParameter("maxamount"));		//最大投资金额
		int yearreturn=Integer.parseInt(request.getParameter("yearreturn"));	//年利率
		int duereturn=Integer.parseInt(request.getParameter("duereturn"));		//到期利率
		int monthoryear=Integer.parseInt(request.getParameter("monthoryear"));	//年付月付
		Date now = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");				//日期
		String sdate = df.format(now);
		Subproduct s=new Subproduct();
		s.setPid(pid);
		s.setMinamount(minamount);
		s.setMaxamount(maxamount);
		s.setYearreturn(yearreturn);
		s.setDuereturn(duereturn);
		s.setMonthoryear(monthoryear);
		s.setSperson("张三");
		s.setSdate(sdate);
		sdao.add(s);
		
		//加入日志
		Date now1 = new Date();
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = df1.format(now1);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("subproduct");
		log.setDate(date1);
		log.setContent("添加");
		log.setType("成功");
		ldao.add(log);
		
	}
	/**
	 * 
	 * 产品利率信息
	 * 修改数据
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/subproduct-update1.do")
	public String subproductupdate1(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int sid=Integer.parseInt(request.getParameter("sid"));					//子产品id
		int minamount=Integer.parseInt(request.getParameter("minamount"));		//最小投资金额
		int maxamount=Integer.parseInt(request.getParameter("maxamount"));		//最大投资金额
		int yearreturn=Integer.parseInt(request.getParameter("yearreturn"));	//年利率
		int duereturn=Integer.parseInt(request.getParameter("duereturn"));		//到期利率
		int monthoryear=Integer.parseInt(request.getParameter("monthoryear"));	//年付月付
		Subproduct s=new Subproduct();
		s.setSid(sid);
		s.setMinamount(minamount);
		s.setMaxamount(maxamount);
		s.setYearreturn(yearreturn);
		s.setDuereturn(duereturn);
		s.setMonthoryear(monthoryear);
		sdao.updateById(s);
		
		//加入日志
		Date now1 = new Date();
		SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		String date1 = df1.format(now1);
		Loginfoss log = new Loginfoss();
		log.setAdminname("张三");
		log.setTablename("subproduct");
		log.setDate(date1);
		log.setContent("修改");
		log.setType("成功");
		ldao.add(log);
		return "redirect:subproduct-update.do";
	}
}
