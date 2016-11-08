package com.daqian.dao;

import com.daqian.entity.phonecode;

/**
 * 用于验证手机短信验证码
 * @author Administrator
 *
 */
public interface PhoneCodeDao {
	public void add(String phone,String code);
	public void delete(String phone);
	public phonecode findByphone(String phone);
}
