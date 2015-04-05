package com.wswhly.control;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;
import com.wswhly.bean.user.LoginReqBean;
import com.wswhly.bean.user.LoginRespBean;
import com.wswhly.bean.user.ModifyUserReqBean;
import com.wswhly.bean.user.RegisterReqBean;
import com.wswhly.bean.user.RegisterRespBean;
import com.wswhly.bean.user.ResetPwdReqBean;
import com.wswhly.bean.user.VerifyMobileCodeReqBean;
import com.wswhly.bean.user.VerifyMobileReqBean;
import com.wswhly.bean.user.VerifyPwdReqBean;
import com.wswhly.bean.user.VerifyUserNameReqBean;
import com.wswhly.dao.UserDao;
import com.wswhly.util.CommonUtil;
import com.wswhly.util.DateUtil;
import com.wswhly.util.StringUtil;

@Controller
public class UserControl {

	private static final Logger logger = Logger.getLogger(UserControl.class);
	
	@Autowired
	private UserDao userDao;
	
	/**
	 * 登录
	 */
	@RequestMapping("/Login")
	public void Login(HttpServletRequest request,HttpServletResponse response){
		LoginReqBean loginreq = (new Gson()).fromJson(request.getAttribute("data").toString(), LoginReqBean.class);
		if(loginreq.getUsername() == null || loginreq.getUsername().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "用户名不能为空"));
			return;
		}
		if(loginreq.getPassword() == null || loginreq.getPassword().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "密码不能为空并且需6位以上"));
			return;
		}
		LoginRespBean loginresp = new LoginRespBean();
		try{
			LoginRespBean.User user = userDao.queryUserByName(loginreq.getUsername());
			if(user == null){
				request.setAttribute("resultjson",StringUtil.Error("0001", "用户不存在"));
				return;
			}
			if(!user.getState().equals("1")){
				request.setAttribute("resultjson",StringUtil.Error("0001", "用户已冻结，请联系客服"));
				return;
			}
			if(!CommonUtil.hash(loginreq.getPassword()).equals(StringUtil.converString(user.getPassword()))&&!loginreq.getPassword().endsWith(user.getPassword())){
				request.setAttribute("resultjson",StringUtil.Error("0001", "密码错误"));
				return;
			}
			user.setPassword("");
			loginresp.setUser(user);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(loginresp)));
		}catch (Exception e) {
			logger.error("Login Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 登录
	 */
	@RequestMapping("/LoginByOpenId")
	public void LoginByOpenId(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		Map<String,Object> data= new HashMap<String, Object>();
		try {
			data=userDao.Login(where.get("openId").toString());
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(data)));
		} catch (Exception e) {
			logger.error("LoginByOpenId Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 修改openid
	 */
	@RequestMapping("/upOpenIdBymobile")
	public void upOpenIdBymobile(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> where =(new Gson()).fromJson(request.getAttribute("data").toString(),HashMap.class);
		try {
			if(userDao.upOpenIdBymobile(where.get("mobile").toString(),where.get("openId").toString())){
				request.setAttribute("resultjson",StringUtil.Success(""));
				return ;
			}
		} catch (Exception e) {
			logger.error("upOpenIdBymobile Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 注册
	 */
	@RequestMapping("/Register")
	public void Register(HttpServletRequest request,HttpServletResponse response){
		RegisterReqBean registerreq = (new Gson()).fromJson(request.getAttribute("data").toString(), RegisterReqBean.class);
		if(registerreq.getUsername() == null || registerreq.getUsername().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "用户名不能为空"));
			return;
		}
		if(registerreq.getPassword() == null || registerreq.getPassword().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "密码不能为空并且需6位以上"));
			return;
		}
		if(registerreq.getMobile() == null || registerreq.getMobile().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "手机号不能为空"));
			return;
		}
		RegisterRespBean registerresp = new RegisterRespBean();
		try{
			//TODO 验证手机验证码
			int id = userDao.addUser(registerreq.getUsername(), CommonUtil.hash(registerreq.getPassword()), registerreq.getMobile(),registerreq.getOpenId());
			LoginRespBean.User user = new LoginRespBean().new User();
			user.setId(id);
			user.setUsername(registerreq.getUsername());
			user.setPassword(registerreq.getPassword());
			user.setMobile(registerreq.getMobile());
			user.setMoney(0);
			user.setPoint(0);
			user.setLevel("0");
			user.setCreatedate(DateUtil.FormatSimpleDate(new Date()));
			user.setOpenId(registerreq.getOpenId());
			registerresp.setUser(user);
			request.setAttribute("resultjson",StringUtil.Success((new Gson()).toJson(registerresp)));
		}catch (Exception e) {
			logger.error("Register Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 修改用户信息
	 */
	@RequestMapping("/ModifyUser")
	public void ModifyUser(HttpServletRequest request,HttpServletResponse response){
		ModifyUserReqBean modifyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), ModifyUserReqBean.class);
		try{
			//TODO 验证手机验证码（若第一次修改，无手机验证码）
			long userid = modifyreq.getId();
			if(modifyreq.getEmail() != null && !modifyreq.getEmail().equals("")){
				if(userDao.modifyEmail(userid, modifyreq.getEmail())){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			}
			if(modifyreq.getMobile() != null && !modifyreq.getMobile().equals("")){
				if(userDao.modifyMobile(userid, modifyreq.getMobile())){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			}
			if(modifyreq.getPassword() != null && !modifyreq.getPassword().equals("")){
				if(userDao.modifyPassword(userid, CommonUtil.hash(modifyreq.getPassword()))){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			}
			if(modifyreq.getRealname() != null && !modifyreq.getRealname().equals("")){
				if(userDao.modifyRealname(userid, modifyreq.getRealname())){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			}
			if(modifyreq.getIdcard() != null && !modifyreq.getIdcard().equals("")){
				if(userDao.modifyIdcard(userid, modifyreq.getIdcard())){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			}
			if(modifyreq.getIdcardimg() != null && !modifyreq.getIdcardimg().equals("")){
				if(userDao.modifyIdcardimg(userid, modifyreq.getIdcardimg())){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			}
			if(modifyreq.getAddress() != null && !modifyreq.getAddress().equals("")){
				if(userDao.modifyAddress(userid, modifyreq.getAddress())){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			}
			if(modifyreq.getJob() != null && !modifyreq.getJob().equals("")){
				if(userDao.modifyJob(userid, Integer.valueOf(modifyreq.getJob()))){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			}
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}catch (Exception e) {
			logger.error("ModifyUser Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	/**
	 * 修改百宝街状态
	 */
	@RequestMapping("/ModifyBaibao")
	public void ModifyBaibao(HttpServletRequest request,HttpServletResponse response){
		ModifyUserReqBean modifyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), ModifyUserReqBean.class);
		try{			
			long userid = modifyreq.getId();
				if(userDao.modifyBaibaoshopstate(userid)){
					request.setAttribute("resultjson",StringUtil.Success(""));
					return ;
				}
			    request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
			}catch (Exception e) {
				logger.error("ModifyUser Exception"+e.getMessage());
				request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
			}
	}
	/**
	 * 验证手机号唯一
	 */
	@RequestMapping("/VerifyMobile")
	public void VerifyMobile(HttpServletRequest request,HttpServletResponse response){
		VerifyMobileReqBean verifyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VerifyMobileReqBean.class);
		if(verifyreq.getMobile() == null || verifyreq.getMobile().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "手机号不能为空"));
			return;
		}
		try{
			if(userDao.verifyMobile(verifyreq.getMobile())){
				request.setAttribute("resultjson",StringUtil.Error("0001", "手机号已存在"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("VerifyMobile Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 验证用户名唯一
	 */
	@RequestMapping("/VerifyUserName")
	public void VerifyUserName(HttpServletRequest request,HttpServletResponse response){
		VerifyUserNameReqBean verifyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VerifyUserNameReqBean.class);
		if(verifyreq.getUsername() == null || verifyreq.getUsername().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "用户名不能为空"));
			return;
		}
		try{
			if(userDao.verifyUserName(verifyreq.getUsername())){	  
			request.setAttribute("resultjson",StringUtil.Error("0001", "用户名已存在"));
			return;
			}
			
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("VerifyMobile Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 验证用户名唯一
	 */
	@RequestMapping("/UserNameTel")
	public void UserNameTel(HttpServletRequest request,HttpServletResponse response){
		VerifyUserNameReqBean verifyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VerifyUserNameReqBean.class);
		if(verifyreq.getUsername() == null || verifyreq.getUsername().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "用户名不能为空"));
			return;
		}
		try{
			
			LoginRespBean.User user = userDao.queryUserByName(verifyreq.getUsername()); 
			
			if(userDao.verifyUserName(verifyreq.getUsername())){
				String code=user.getUsername()+","+user.getId()+","+user.getMobile();
			request.setAttribute("resultjson",StringUtil.Success(code));
			return;
			}
			request.setAttribute("resultjson",StringUtil.Error("0001", "用户名不存在!"));
		}catch (Exception e) {
			logger.error("VerifyMobile Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	
	
	/**
	 * 忘记密码
	 */
	@RequestMapping("/ResetPwd")
	public void ResetPwd(HttpServletRequest request,HttpServletResponse response){
		ResetPwdReqBean resetreq = (new Gson()).fromJson(request.getAttribute("data").toString(), ResetPwdReqBean.class);
		if(resetreq.getMobile() == null || resetreq.getMobile().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "手机号名不能为空"));
			return;
		}
		if(resetreq.getPassword() == null || resetreq.getPassword().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "密码不能为空"));
			return;
		}
		if(resetreq.getVerifycode() == null || resetreq.getVerifycode().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "手机验证码不能为空"));
			return;
		}
		try{
			if(userDao.modifyPasswordByMobile(resetreq.getMobile(), resetreq.getPassword())){
				request.setAttribute("resultjson",StringUtil.Success(""));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Error("9999", "修改失败"));
		}catch (Exception e) {
			logger.error("VerifyMobile Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 验证手机号验证码
	 */
	@RequestMapping("/VerifyMobileCode")
	public void VerifyMobileCode(HttpServletRequest request,HttpServletResponse response){
		VerifyMobileCodeReqBean verifyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VerifyMobileCodeReqBean.class);
		if(verifyreq.getMobile() == null || verifyreq.getMobile().equals("")){
			request.setAttribute("resultjson",StringUtil.Error("0001", "手机号不能为空"));
			return;
		}
		try{
			if(!userDao.verifyMobileCode(verifyreq.getMobile(), verifyreq.getVerifycode())){
				request.setAttribute("resultjson",StringUtil.Error("0001", "验证码错误"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("VerifyMobile Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
	
	/**
	 * 验证密码
	 */
	@RequestMapping("/VerifyPwd")
	public void VerifyPwd(HttpServletRequest request,HttpServletResponse response){
		VerifyPwdReqBean verifyreq = (new Gson()).fromJson(request.getAttribute("data").toString(), VerifyPwdReqBean.class);
		try{
			if(!userDao.verifyPwd(verifyreq.getUserid(), CommonUtil.hash(verifyreq.getPassword()))){
				request.setAttribute("resultjson",StringUtil.Error("0001", "密码错误"));
				return;
			}
			request.setAttribute("resultjson",StringUtil.Success(""));
		}catch (Exception e) {
			logger.error("VerifyMobile Exception"+e.getMessage());
			request.setAttribute("resultjson",StringUtil.Error("9999", "未知错误"));
		}
	}
}
