package com.hyzm.forward.service.user.impl;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.enroll.CurrentEnrollReqBean;
import com.hyzm.bean.enroll.CurrentEnrollRespBean;
import com.hyzm.bean.enroll.EnrollCollectionReqBean;
import com.hyzm.bean.enroll.EnrollCollectionRespBean;
import com.hyzm.bean.tool.GetJobsRespBean;
import com.hyzm.bean.tool.SendMsgReqBean;
import com.hyzm.bean.trade.CurrentMoneyReqBean;
import com.hyzm.bean.trade.CurrentMoneyRespBean;
import com.hyzm.bean.user.LoginReqBean;
import com.hyzm.bean.user.LoginRespBean;
import com.hyzm.bean.user.ModifyUserReqBean;
import com.hyzm.bean.user.RegisterReqBean;
import com.hyzm.bean.user.VerifyMobileCodeReqBean;
import com.hyzm.bean.user.VerifyMobileReqBean;
import com.hyzm.bean.user.VerifyPwdReqBean;
import com.hyzm.bean.user.VerifyUserNameReqBean;
import com.hyzm.forward.service.MessageResponse;
import com.hyzm.forward.service.user.UserService;

@Service
public class UserServiceImpl extends MessageResponse implements UserService{

	private final Logger log = Logger.getLogger(this.getClass());
	
	public Map<String,Object> Login(String username,String password) throws Exception{
		log.info("用户登录");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			LoginReqBean login = new LoginReqBean();
			login.setUsername(username);
			login.setPassword(password);
			MessageRespBean respBean = getMessageResponse(login, "Login");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
				LoginRespBean loginresp = new Gson().fromJson(respBean.getContent(), LoginRespBean.class);
				map.put("user", loginresp.getUser());
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("用户登录异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> Register(String username,String password,String repassword,String mobile,String openId) throws Exception{
		log.info("用户注册");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			RegisterReqBean register = new RegisterReqBean();
			register.setUsername(username);
			register.setPassword(password);
			register.setRepassword(repassword);
			register.setMobile(mobile);
			register.setOpenId(openId);
			MessageRespBean respBean = getMessageResponse(register, "Register");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
				LoginRespBean loginresp = new Gson().fromJson(respBean.getContent(), LoginRespBean.class);
				map.put("user", loginresp.getUser());
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("用户注册异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}

	public Map<String,Object> ChangePassword(long userid,String oldpassword,String password) throws Exception{
		log.info("用户修改密码");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			
			
			ModifyUserReqBean user = new ModifyUserReqBean();
			user.setId(userid);
			user.setPassword(password);
			MessageRespBean respBean = getMessageResponse(user, "ModifyUser");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("用户修改密码异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> verifyUserName(String username) throws SQLException{
		log.info("验证用户名");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			VerifyUserNameReqBean verify = new VerifyUserNameReqBean();
			verify.setUsername(username);
			MessageRespBean respBean = getMessageResponse(verify, "VerifyUserName");
			
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
				
			}
		} catch (Exception e) {
			log.error("验证用户名异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	
	public Map<String,Object> UserNameTel(String username) throws SQLException{
		log.info("验证用户名");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			VerifyUserNameReqBean verify = new VerifyUserNameReqBean();
			verify.setUsername(username);
			MessageRespBean respBean = getMessageResponse(verify, "UserNameTel");
			
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
				map.put("content", respBean.getContent());
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
				map.put("content", respBean.getContent());
			}
		} catch (Exception e) {
			log.error("验证用户名异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	
	
	
	
	
	public Map<String,Object> verifyMobile(String mobile) throws SQLException{
		log.info("验证手机号");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			VerifyMobileReqBean verify = new VerifyMobileReqBean();
			verify.setMobile(mobile);
			MessageRespBean respBean = getMessageResponse(verify, "VerifyMobile");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("验证手机号异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> verifyMobileCode(String mobile, String verifycode) throws SQLException{
		log.info("验证手机验证码");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			VerifyMobileCodeReqBean verify = new VerifyMobileCodeReqBean();
			verify.setMobile(mobile);
			verify.setVerifycode(verifycode);
			MessageRespBean respBean = getMessageResponse(verify, "VerifyMobileCode");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("验证手机验证码异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> sendSms(String mobile, int type) throws SQLException{
		log.info("发送手机验证码");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			SendMsgReqBean sendmsg = new SendMsgReqBean();
			sendmsg.setMobile(mobile);
			sendmsg.setType(type);
			MessageRespBean respBean = getMessageResponse(sendmsg, "SendSms");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("发送手机验证码异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> CurrentEnroll() throws SQLException{
		log.info("获取当前报名期数");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			MessageRespBean respBean = getMessageResponse("", "CurrentEnroll");
			if (!"".equals(respBean.getContent())) {
				map.put("errorcode", "0000");
				CurrentEnrollRespBean enrollresp = new Gson().fromJson(respBean.getContent(), CurrentEnrollRespBean.class);
				map.put("enroll", enrollresp.getEnroll());
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("获取当前报名期数："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> EnrollCollection(long userid,long enrollid) throws SQLException{
		log.info("获取报名藏品");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			EnrollCollectionReqBean enrollreq = new EnrollCollectionReqBean();
			enrollreq.setUserid(userid);
			enrollreq.setEnrollid(enrollid);
			MessageRespBean respBean = getMessageResponse(enrollreq, "EnrollCollection");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
				EnrollCollectionRespBean enrollresp = new Gson().fromJson(respBean.getContent(), EnrollCollectionRespBean.class);
				map.put("list", enrollresp.getList());
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("获取报名藏品："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	public Map<String,Object> ModifyUser(long userid,String newmobile,String newemail,String realname,String idcard,String idcardimg,String job,String address) throws Exception{
		log.info("用户修改");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			ModifyUserReqBean user = new ModifyUserReqBean();
			user.setId(userid);
			user.setMobile(newmobile);
			user.setEmail(newemail);
			user.setRealname(realname);
			user.setIdcard(idcard);
			user.setIdcardimg(idcardimg);
			user.setJob(job);
			user.setAddress(address);
			MessageRespBean respBean = getMessageResponse(user, "ModifyUser");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("用户修改密码异常："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	public Map<String,Object> ModifyBaibao(long userid)throws Exception{
		log.info("获取id");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			ModifyUserReqBean current = new ModifyUserReqBean();
			current.setId(userid);
			MessageRespBean respBean = getMessageResponse(current, "ModifyBaibao");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("获取id："+e.getMessage());
			e.printStackTrace();
		}
		return map;		
	}
	public Map<String,Object> GetJobs() throws SQLException{
		log.info("获取职业");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			MessageRespBean respBean = getMessageResponse("", "GetJobs");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
				GetJobsRespBean jobsresp = new Gson().fromJson(respBean.getContent(), GetJobsRespBean.class);
				map.put("list", jobsresp.getList());
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("获取职业："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> CurrentMoney(long userid) throws SQLException{
		log.info("获取金额积分");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			CurrentMoneyReqBean current = new CurrentMoneyReqBean();
			current.setUserid(userid);
			MessageRespBean respBean = getMessageResponse(current, "CurrentMoney");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
				CurrentMoneyRespBean currentresp = new Gson().fromJson(respBean.getContent(), CurrentMoneyRespBean.class);
				map.put("money", currentresp.getMoney());
				map.put("points", currentresp.getPoints());
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("获取金额积分："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	
	public Map<String,Object> verifyPwd(long userid,String password) throws SQLException{
		log.info("验证密码");
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			VerifyPwdReqBean verify = new VerifyPwdReqBean();
			verify.setUserid(userid);
			verify.setPassword(password);
			MessageRespBean respBean = getMessageResponse(verify, "VerifyPwd");
			if ("0000".equals(respBean.getErrorcode())) {
				map.put("errorcode", "0000");
			}else{
				map.put("errorcode", "0001");
				map.put("errorinfo", respBean.getErrorinfo());
			}
		} catch (Exception e) {
			log.error("验证密码："+e.getMessage());
			e.printStackTrace();
		}
		return map;
	}
	public Map<String, Object> Login(String openId) throws Exception {
		log.info("用户登录");
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		try {
				where.put("openId", openId);
				try {
					data = (Map<String, Object>) getMessageResponsetoMap(where,"LoginByOpenId");
				} catch (Exception e) {
					log.error("报名异常："+e.getMessage());
					e.printStackTrace();
				}
				return data;
		} catch (Exception e) {
			log.error("用户登录异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
	public Map<String, Object> upOpenIdBymobile(String mobile, String openId) throws SQLException {
		log.info("修改openid");
		Map<String,String> where =new HashMap<String, String>();
		Map<String,Object> data =new HashMap<String, Object>();
		try {
				where.put("mobile", mobile);
				where.put("openId", openId);
				try {
					MessageRespBean respBean = getMessageResponse(where, "upOpenIdBymobile");
					if ("0000".equals(respBean.getErrorcode())) {
						data.put("errorcode", "0000");
					}else{
						data.put("errorcode", "0001");
						data.put("errorinfo", respBean.getErrorinfo());
					}
				} catch (Exception e) {
					log.error("修改openid异常："+e.getMessage());
					e.printStackTrace();
				}
				return data;
		} catch (Exception e) {
			log.error("修改openid异常："+e.getMessage());
			e.printStackTrace();
		}
		return data;
	}
}
