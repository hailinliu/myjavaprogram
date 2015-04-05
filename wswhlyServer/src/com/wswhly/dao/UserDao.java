package com.wswhly.dao;

import java.sql.SQLException;
import java.util.Map;

import com.wswhly.bean.user.LoginRespBean;

public interface UserDao {

	public LoginRespBean.User queryUserByName(String username) throws SQLException;
	public Map<String,Object> Login(String openId) throws Exception;
	public int addUser(final String username, final String password, final String mobile,final String openId) throws SQLException;
	
	public boolean verifyUserName(String username) throws SQLException;

	public boolean verifyMobile(String mobile) throws SQLException;
	
	public boolean verifyMobileCode(String mobile, String verifycode) throws SQLException;
	
	public boolean modifyEmail(long id,String email) throws SQLException;
	
	public boolean modifyMobile(long id,String mobile) throws SQLException;
	
	public boolean modifyRealname(long id,String realname) throws SQLException;
	
	public boolean modifyIdcard(long id,String idcard) throws SQLException;
	
	public boolean modifyIdcardimg(long id,String idcardimg) throws SQLException;
	
	public boolean modifyJob(long id,int job) throws SQLException;
	
	public boolean modifyAddress(long id,String address) throws SQLException;
	
	public boolean modifyPassword(long id,String password) throws SQLException;
	
	public boolean modifyBaibaoshopstate(long id) throws SQLException;
	
	public boolean modifyPasswordByMobile(String mobile,String password) throws SQLException;
	
	public boolean modifyMoney(long id,double money) throws SQLException;
	
	public boolean modifyPoints(long id,int points) throws SQLException;
	
	public boolean verifyPwd(long userid,String password) throws SQLException;
	
	public boolean modifyLevel(long userid,String level,String date) throws SQLException;
	
	public boolean upOpenIdBymobile(String mobile,String openId) throws SQLException;
	
}
