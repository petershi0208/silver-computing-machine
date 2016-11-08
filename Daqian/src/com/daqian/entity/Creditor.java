package com.daqian.entity;

public class Creditor {
//	private int id;
//	private String userid;
//	private String uname;
//	private String idcard;
//	private String phone;
//	private String address;
//	private String date;
//	
//	public String getDate() {
//		return date;
//	}
//	public void setDate(String date) {
//		this.date = date;
//	}
//	public int getId() {
//		return id;
//	}
//	public void setId(int id) {
//		this.id = id;
//	}
//	public String getUserid() {
//		return userid;
//	}
//	public void setUserid(String userid) {
//		this.userid = userid;
//	}
//	
//	public String getUname() {
//		return uname;
//	}
//	public void setUname(String uname) {
//		this.uname = uname;
//	}
//	public String getIdcard() {
//		return idcard;
//	}
//	public void setIdcard(String idcard) {
//		this.idcard = idcard;
//	}
//	public String getPhone() {
//		return phone;
//	}
//	public void setPhone(String phone) {
//		this.phone = phone;
//	}
//	public String getAddress() {
//		return address;
//	}
//	public void setAddress(String address) {
//		this.address = address;
//	}
	//基本信息
	private int id;//
	private String userid;//
	private String uname;	// 姓名
	private String sex;		// 性别
	private String marital;	// 婚姻
	private String idcard;	// 身份证号
	private String age;		// 年龄
	private String phone;	// 手机
	private String telephone;	// 固定电话
	private int money;			// 申请金额
	private String localhouse;	// 本地房产
	private String live;		// 居住状况
	private String sociensure;	// 社保
	private String commpf;		// 公基金
	//单位信息
	private String unit_name;	// 单位名称
	private String unit_site;	// 单位地址
	private String unit_nature;	// 单位性质
	private String unit_phone;	// 单位电话
	private String position;	// 职位
	private String education;	// 学历
	private String wages;		// 工资收入
	//家庭情况1
	private String home_number;		// 家庭人数
	private String home_registry;	// 户籍地地址
	private String home_registryid;	// 户号
	private String address;		// 居住地
	private String wechat;		// 微信
	private String rela1;		// 关系人1
	private String rela1_name;	// 关系人1姓名
	private String rela1_phone;	// 关系人1电话
	private String rela2;		// 关系人2
	private String rela2_name;	// 关系人2姓名
	private String rela2_phone;	// 关系人2电话
	private String rela3;		// 关系人3
	private String rela3_name;	// 关系人3姓名
	private String rela3_phone;	// 关系人3电话
	//联系人
	private String contact1_name;	// 联系人名
	private String contact1_phone;	// 联系人电话
	private String contact2_name;	// 联系人名
	private String contact2_phone;	// 联系人电话
	
	private String date; //发布时间
	
	
	public Creditor() {
		super();
	}
	
	

	public Creditor(int id, String uname, String sex, String marital,
			String idcard, String age, String phone, String telephone,
			int money, String localhouse, String live, String sociensure,
			String commpf, String unitName, String unitSite, String unitNature,
			String unitPhone, String position, String education, String wages,
			String homeNumber, String homeRegistry, String homeRegistryid,
			String address, String wechat, String rela1, String rela1Name,
			String rela1Phone, String rela2, String rela2Name,
			String rela2Phone, String rela3, String rela3Name,
			String rela3Phone, String contact1Name, String contact1Phone,
			String contact2Name, String contact2Phone) {
		super();
		this.id = id;
		this.uname = uname;
		this.sex = sex;
		this.marital = marital;
		this.idcard = idcard;
		this.age = age;
		this.phone = phone;
		this.telephone = telephone;
		this.money = money;
		this.localhouse = localhouse;
		this.live = live;
		this.sociensure = sociensure;
		this.commpf = commpf;
		unit_name = unitName;
		unit_site = unitSite;
		unit_nature = unitNature;
		unit_phone = unitPhone;
		this.position = position;
		this.education = education;
		this.wages = wages;
		home_number = homeNumber;
		home_registry = homeRegistry;
		home_registryid = homeRegistryid;
		this.address = address;
		this.wechat = wechat;
		this.rela1 = rela1;
		rela1_name = rela1Name;
		rela1_phone = rela1Phone;
		this.rela2 = rela2;
		rela2_name = rela2Name;
		rela2_phone = rela2Phone;
		this.rela3 = rela3;
		rela3_name = rela3Name;
		rela3_phone = rela3Phone;
		contact1_name = contact1Name;
		contact1_phone = contact1Phone;
		contact2_name = contact2Name;
		contact2_phone = contact2Phone;
	}



	public Creditor(String uname, String sex, String marital, String idcard,
			String age, String phone, String telephone, int money,
			String localhouse, String live, String sociensure, String commpf,
			String unitName, String unitSite, String unitNature,
			String unitPhone, String position, String education, String wages,
			String homeNumber, String homeRegistry, String homeRegistryid,
			String address, String wechat, String rela1, String rela1Name,
			String rela1Phone, String rela2, String rela2Name,
			String rela2Phone, String rela3, String rela3Name,
			String rela3Phone, String contact1Name, String contact1Phone,
			String contact2Name, String contact2Phone, String date) {
		super();
		this.uname = uname;
		this.sex = sex;
		this.marital = marital;
		this.idcard = idcard;
		this.age = age;
		this.phone = phone;
		this.telephone = telephone;
		this.money = money;
		this.localhouse = localhouse;
		this.live = live;
		this.sociensure = sociensure;
		this.commpf = commpf;
		unit_name = unitName;
		unit_site = unitSite;
		unit_nature = unitNature;
		unit_phone = unitPhone;
		this.position = position;
		this.education = education;
		this.wages = wages;
		home_number = homeNumber;
		home_registry = homeRegistry;
		home_registryid = homeRegistryid;
		this.address = address;
		this.wechat = wechat;
		this.rela1 = rela1;
		rela1_name = rela1Name;
		rela1_phone = rela1Phone;
		this.rela2 = rela2;
		rela2_name = rela2Name;
		rela2_phone = rela2Phone;
		this.rela3 = rela3;
		rela3_name = rela3Name;
		rela3_phone = rela3Phone;
		contact1_name = contact1Name;
		contact1_phone = contact1Phone;
		contact2_name = contact2Name;
		contact2_phone = contact2Phone;
		this.date = date;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getMarital() {
		return marital;
	}

	public void setMarital(String marital) {
		this.marital = marital;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public String getLocalhouse() {
		return localhouse;
	}

	public void setLocalhouse(String localhouse) {
		this.localhouse = localhouse;
	}

	public String getLive() {
		return live;
	}

	public void setLive(String live) {
		this.live = live;
	}

	public String getSociensure() {
		return sociensure;
	}

	public void setSociensure(String sociensure) {
		this.sociensure = sociensure;
	}

	public String getCommpf() {
		return commpf;
	}

	public void setCommpf(String commpf) {
		this.commpf = commpf;
	}

	public String getUnit_name() {
		return unit_name;
	}

	public void setUnit_name(String unitName) {
		unit_name = unitName;
	}

	public String getUnit_site() {
		return unit_site;
	}

	public void setUnit_site(String unitSite) {
		unit_site = unitSite;
	}

	public String getUnit_nature() {
		return unit_nature;
	}

	public void setUnit_nature(String unitNature) {
		unit_nature = unitNature;
	}

	public String getUnit_phone() {
		return unit_phone;
	}

	public void setUnit_phone(String unitPhone) {
		unit_phone = unitPhone;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getWages() {
		return wages;
	}

	public void setWages(String wages) {
		this.wages = wages;
	}

	public String getHome_number() {
		return home_number;
	}

	public void setHome_number(String homeNumber) {
		home_number = homeNumber;
	}

	public String getHome_registry() {
		return home_registry;
	}

	public void setHome_registry(String homeRegistry) {
		home_registry = homeRegistry;
	}

	public String getHome_registryid() {
		return home_registryid;
	}

	public void setHome_registryid(String homeRegistryid) {
		home_registryid = homeRegistryid;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWechat() {
		return wechat;
	}

	public void setWechat(String wechat) {
		this.wechat = wechat;
	}

	public String getRela1() {
		return rela1;
	}

	public void setRela1(String rela1) {
		this.rela1 = rela1;
	}

	public String getRela1_name() {
		return rela1_name;
	}

	public void setRela1_name(String rela1Name) {
		rela1_name = rela1Name;
	}

	public String getRela1_phone() {
		return rela1_phone;
	}

	public void setRela1_phone(String rela1Phone) {
		rela1_phone = rela1Phone;
	}

	public String getRela2() {
		return rela2;
	}

	public void setRela2(String rela2) {
		this.rela2 = rela2;
	}

	public String getRela2_name() {
		return rela2_name;
	}

	public void setRela2_name(String rela2Name) {
		rela2_name = rela2Name;
	}

	public String getRela2_phone() {
		return rela2_phone;
	}

	public void setRela2_phone(String rela2Phone) {
		rela2_phone = rela2Phone;
	}

	public String getRela3() {
		return rela3;
	}

	public void setRela3(String rela3) {
		this.rela3 = rela3;
	}

	public String getRela3_name() {
		return rela3_name;
	}

	public void setRela3_name(String rela3Name) {
		rela3_name = rela3Name;
	}

	public String getRela3_phone() {
		return rela3_phone;
	}

	public void setRela3_phone(String rela3Phone) {
		rela3_phone = rela3Phone;
	}

	public String getContact1_name() {
		return contact1_name;
	}

	public void setContact1_name(String contact1Name) {
		contact1_name = contact1Name;
	}

	public String getContact1_phone() {
		return contact1_phone;
	}

	public void setContact1_phone(String contact1Phone) {
		contact1_phone = contact1Phone;
	}

	public String getContact2_name() {
		return contact2_name;
	}

	public void setContact2_name(String contact2Name) {
		contact2_name = contact2Name;
	}

	public String getContact2_phone() {
		return contact2_phone;
	}

	public void setContact2_phone(String contact2Phone) {
		contact2_phone = contact2Phone;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
