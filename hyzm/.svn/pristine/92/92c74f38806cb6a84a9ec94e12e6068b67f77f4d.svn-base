package com.hyzm.forward.service.user;

import java.sql.SQLException;
import java.util.Map;


public interface UserService {

	/**
	 * 登录
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> Login(String username,String password) throws Exception;
	/**
	 * 登录
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> Login(String openId) throws Exception;
	
	
	/**
	 * 注册
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> Register(String username,String password,String repassword,String mobile,String openId) throws Exception;

	/**
	 * 修改密码
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> ChangePassword(long userid,String oldpassword,String password) throws Exception;

	public Map<String,Object> verifyUserName(String username) throws SQLException;
	
	public Map<String,Object> verifyMobile(String mobile) throws SQLException;
	
	public Map<String,Object> verifyMobileCode(String mobile, String verifycode) throws SQLException;
	
	public Map<String,Object> sendSms(String mobile, int type) throws SQLException;
	
	public Map<String,Object> CurrentEnroll() throws SQLException;
	
	public Map<String,Object> EnrollCollection(long userid,long enrollid) throws SQLException;
	
	public Map<String,Object> ModifyUser(long userid,String newmobile,String newemail,String realname,String idcard,String idcardimg,String job,String address) throws Exception;

	public Map<String,Object> ModifyBaibao(long userid)throws Exception;
	
	public Map<String,Object> GetJobs() throws SQLException;
	
	public Map<String,Object> CurrentMoney(long userid) throws SQLException;
	
	public Map<String,Object> verifyPwd(long userid,String password) throws SQLException;
	
	public Map<String,Object> UserNameTel(String username) throws SQLException;
	
	public Map<String,Object> upOpenIdBymobile(String mobile,String openId)throws SQLException;
}
