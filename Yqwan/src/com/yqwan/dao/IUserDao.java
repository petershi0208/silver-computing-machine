package com.yqwan.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yqwan.domain.User;

@Repository("user")
public interface IUserDao {
	public User findByTelephone(String telephone);		//通过手机号查询
	public User findByUsername(String username);		//通过用户名查询（也用于判断登录）
	public void regist(User user);						//注册
	public void updateLogindate(User user);				//修改登录时间
	public void updatePassword(User user);				//修改密码
	public void updateRealname(User user);				//实名认证
	public void updateTelephone(User user);				//绑定手机
	public void updatephone(String userid);				//解绑手机
	public void updateemail(User user);					//绑定或修改邮箱
	public void updateGb(User user);					//修改Gb
	public void updateHead(User user);					//修改Gb
	
	public List<User> paging(String userid,int currentpage,int pagesize);
	public int count(String userid);
	public User findByNickname(String nickname);			//查找昵称
	public void addInformation(User user);						//添加更多信息
	
	
	public List<User> findByCode(String spreadcode,String registdate);
	
	/**
	 * 更新密码提示问题
	 * @param user
	 */
	public void updatePwdproblem(User user);
	
}
