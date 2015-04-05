package com.hyzm.admin.control;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.NumberFormats;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hyzm.admin.service.business.BusinessService;
import com.hyzm.admin.service.sys.SysService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.UserInfo;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateJsonValueProcessor;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/sys")
public class SysControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private SysService sysService;
	
	@Autowired
	private BusinessService busiService;
	
	@RequestMapping("/gologin")
	public String goLogin() {
		return "admin/login";
	}
	
	/**
	 * 页面跳转
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/redirect")
	public String redirect(HttpServletRequest request, HttpServletResponse response) {
		String p = request.getParameter("p");
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String paraname = (String) enu.nextElement();
			if (!paraname.equals("p")) {
				request.setAttribute(paraname, request.getParameter(paraname));
			}
		}
		return p;
	}
	
	@RequestMapping("/gomain")
	public String goMain(HttpServletRequest request, HttpServletResponse response) {
		return "admin/main";
	}
	
	/**
	 * 登录
	 * @param userinfo
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserInfo userinfo, HttpServletRequest request, HttpServletResponse response) {
		String result = sysService.login(request, userinfo);
		try {
			if (result.equals("success")) {
				logService.addSyslog("登陆", "login", "用户“"+userinfo.getUsername()+"”登陆", "成功", userinfo.getUsername(), request.getRemoteAddr(), 2);
				return "redirect:/sys/gomain";
			}
			logService.addSyslog("登陆", "login", "用户“"+userinfo.getUsername()+"”登陆", "失败", userinfo.getUsername(), request.getRemoteAddr(), 2);
		} catch (Exception e) {
			logService.addSyslog("登陆", "login", "用户“"+userinfo.getUsername()+"”登陆异常："+e.getMessage(), "异常", userinfo.getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
		return "admin/login";
	}
	
	/**
	 * 登出
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response){
		try {
			request.getSession().removeAttribute("CurrentSession");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/login";
	}
	
	/**
	 * 获得菜单
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getmenu")
	public void getMenu(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			String result = sysService.getMenu(currentsession.getUserinfo().getRoleid());
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 获得权限
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getpermissionbyroleid")
	public void getPermissionByRoleId(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Long roleid = Long.valueOf(request.getParameter("roleid"));
			String result = sysService.getPermissionByRoleid(roleid);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	@RequestMapping("/getUserById")
	public void getUserById(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Long id = Long.valueOf(request.getParameter("id"));			
			Map<String, Object> result = sysService.getUserById(id);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			System.out.println(JSONObject.fromObject(result, jsonConfig).toString());
			out.print(JSONObject.fromObject(result, jsonConfig).toString());
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/addrolepermission")
	public void insertRolePermission(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();// 获得输出对象
			Long roleid = Long.valueOf(request.getParameter("roleid"));
			String permissionid = request.getParameter("permissionid");
			if (sysService.insertRolePermission(roleid, permissionid)) {
				out.print("0000");
				logService.addSyslog("赋权", "addrolepermission", "为角色："+roleid+"赋权", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("分配权限失败");
				logService.addSyslog("赋权", "addrolepermission", "为角色："+roleid+"赋权", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("赋权", "addrolepermission", "赋权异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/validatecode")
	public void validateCode(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String validatecode = request.getParameter("validatecode");
			if(validatecode.equalsIgnoreCase(request.getSession().getAttribute(request.getSession().getId()).toString())){
				out.print("0000");
			}else{
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 验证登陆
	 * @param request
	 * @param response
	 */
	@RequestMapping("/checklogin")
	public void checkLogin(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			if(sysService.checkLogin(username, password)){
				out.print("0000");
			}else{
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 验证管理员是否存在
	 * @param request
	 * @param response
	 */
	@RequestMapping("/ifexistsadmin")
	public void ifExistsAdmin(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			String name = request.getParameter("name");
			out = response.getWriter();
			if(sysService.ifExistsAdmin(name.trim())){
				out.print("0000");
			}else{
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 验证用户是否存在
	 * @param request
	 * @param response
	 */
	@RequestMapping("/ifexistsuser")
	public void ifExistsUser(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			String name = request.getParameter("name");
			out = response.getWriter();
			if(sysService.ifExistsUser(name.trim())){
				out.print("0000");
			}else{
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 验证登陆密码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/validatepassword")
	public void validatePassword(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String currentPassword = request.getParameter("currentPassword");
			if(StringUtil.hash(currentPassword).equals(currentsession.getUserinfo().getPassword())){
				out.print("0000");
			}else{
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 浏览用户
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getuserinfo")
	public void getUserinfo(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String id = request.getParameter("id");
			String username = request.getParameter("username");
			String mobile = request.getParameter("mobile");
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			String adminName= request.getParameter("adminName");
			String state = request.getParameter("state");
			String baibaoshopstate = request.getParameter("baibaoshopstate");
			String money = request.getParameter("money");
			String level = request.getParameter("level");
			String result = sysService.getUserinfoList(id==null?"":id, username==null?"":username, mobile==null?"":mobile, realname==null?"":realname, idcard==null?"":idcard, adminName==null?"":adminName,state==null||"0".equals(state)?"":state,baibaoshopstate==null ?"":baibaoshopstate,money==null||"0".equals(money)?"":money,level==null||"0".equals(level)?"":level, pageSize, currentPage);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 查询用户自动补全
	 * @param request
	 * @param response
	 */
	@RequestMapping("/autouser")
	public void autoUser(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = sysService.autoUser();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 自动补全手机号码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/automobile")
	public void autoMobile(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = sysService.autoMobile();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 自动补全真实姓名
	 * @param request
	 * @param response
	 */
	@RequestMapping("/autorealname")
	public void autoRealname(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = sysService.autoRealname();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 自动补全身份证
	 * @param request
	 * @param response
	 */
	@RequestMapping("/autoidcard")
	public void autoIdcard(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = sysService.autoIdcard();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	/**
	 * 自动补全商务专员
	 * @param request
	 * @param response
	 */
	@RequestMapping("/autoadminName")
	public void autoAdminName (HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = sysService.autoAdminName();
			out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 添加用户信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/adduser")
	public void addUser(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			int sex = Integer.valueOf(request.getParameter("sex"));
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			String job = request.getParameter("job");
			String address = request.getParameter("address");
			String weixin = request.getParameter("weixin");
			int isgroup = Integer.valueOf(request.getParameter("isgroup"));
			String recommend = request.getParameter("recommend");
			if (sysService.addUser(username, StringUtil.hash(password), sex, mobile, email, realname, idcard, job==null||"".equals(job)?0:Integer.valueOf(job), address, weixin, isgroup, recommend)) {
				out.print("0000");
				logService.addSyslog("添加用户", "addUser", "用户名为："+username, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加用户信息失败！！！");
				logService.addSyslog("添加用户", "addUser", "用户名为："+username, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("添加用户", "addUser", "添加用户信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改用户信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/upduser")
	public void updUser(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			int sex = Integer.valueOf(request.getParameter("sex"));
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			String job = request.getParameter("job");
			String address = request.getParameter("address");
			String adminName=request.getParameter("adminName");
			String desction =request.getParameter("desction");
			String weixin = request.getParameter("weixin");
			int isgroup = Integer.valueOf(request.getParameter("isgroup"));
			String recommend = request.getParameter("recommend");
			long id = Long.valueOf(request.getParameter("id"));
			if (sysService.updUser(sex, mobile, email, realname, idcard, job==null||"".equals(job)?0:Integer.valueOf(job), address,adminName,desction,weixin, isgroup, recommend, id)) {
				out.print("0000");
				logService.addSyslog("修改用户", "updUser", "用户编号为："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改用户信息失败！！！");
				logService.addSyslog("修改用户", "updUser", "用户编号为："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改用户", "updUser", "修改用户信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 冻结/解冻用户
	 * @param request
	 * @param response
	 */
	@RequestMapping("/freezeuser")
	public void freezeUser(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String state = request.getParameter("state");
			if (sysService.freezeUser(id, state)) {
				out.print("0000");
				logService.addSyslog("2".equals(state)?"冻结用户":"解冻用户", "freezeUser", "用户序列号为："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("2".equals(state)?"冻结用户失败！！！":"解冻用户失败！！！");
				logService.addSyslog("2".equals(state)?"冻结用户":"解冻用户", "freezeUser", "用户序列号为："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("冻结/解冻用户", "freezeUser", "冻结/解冻异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除管理用户
	 * @param request
	 * @param response
	 */
	@RequestMapping("/deluser")
	public void delUser(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (sysService.deleteUser(id)) {
				out.print("0000");
				logService.addSyslog("删除用户", "delAdmin", "删除编号为："+id+"的用户", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除用户信息失败！！！");
				logService.addSyslog("删除用户", "delAdmin", "删除编号为："+id+"的用户", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除用户", "delAdmin", "删除用户信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 浏览管理员
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getadminlist")
	public void getAdminList(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String fullname = request.getParameter("username");
			String state = request.getParameter("state");
			String result = sysService.getAdminList(fullname==null?"":fullname, state==null||"0".equals(state)?"":state, pageSize, currentPage);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 查询管理员自动补全
	 * @param request
	 * @param response
	 */
	@RequestMapping("/autoadmin")
	public void autoAdmin(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = sysService.autoAdmin();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 添加管理人员
	 * @param request
	 * @param response
	 */
	@RequestMapping("/addadmin")
	public void addAdmin(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			int sex = Integer.valueOf(request.getParameter("sex"));
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			long roleid = Long.valueOf(request.getParameter("roleid"));
			if (sysService.insertAdmin(username, StringUtil.hash(password), sex, mobile, email, realname, idcard, roleid)) {
				out.print("0000");
				logService.addSyslog("添加管理人员", "addAdmin", "管理人员登录名为：“"+username+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加管理人员信息失败！！！");
				logService.addSyslog("添加管理人员", "addAdmin", "管理人员登录名为：“"+username+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("添加管理人员", "addAdmin", "添加管理人员异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除管理人员信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/deladmin")
	public void delAdmin(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (sysService.deleteUser(id)) {
				out.print("0000");
				logService.addSyslog("删除管理人员", "delAdmin", "删除编号为："+id+"的管理人员", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除管理人员信息失败！！！");
				logService.addSyslog("删除管理人员", "delAdmin", "删除编号为："+id+"的管理人员", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除管理人员", "delAdmin", "删除管理人员信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改管理人员信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updadmin")
	public void updAdmin(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int sex = Integer.valueOf(request.getParameter("sex"));
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			long roleid = Long.valueOf(request.getParameter("roleid"));
			if (sysService.updateAdmin(sex, mobile, email, realname, idcard, roleid, id)) {
				out.print("0000");
				logService.addSyslog("修改管理人员信息", "updAdmin", "修改管理人员信息，手机号为：“"+mobile+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改管理人员信息失败！！！");
				logService.addSyslog("修改管理人员信息", "updAdmin", "修改管理人员信息，手机号为：“"+mobile+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改管理人员信息", "updAdmin", "修改管理人员信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 浏览角色列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getrolelist")
	public void getRoleList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String rolename = request.getParameter("rolename");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = sysService.getRoleinfoList(rolename==null?"":rolename, state==null||"0".equals(state)?"":state, pageSize, currentPage);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 添加角色
	 * @param request
	 * @param response
	 */
	@RequestMapping("/addrole")
	public void addRole(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String rolename = request.getParameter("rolename");
			String note = request.getParameter("note");
			if (sysService.insertRole(rolename, note)) {
				out.print("0000");
				logService.addSyslog("添加角色", "addRole", "添加角色名为：“"+rolename+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加角色失败！！！");
				logService.addSyslog("添加角色", "addRole", "添加角色名为：“"+rolename+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("添加角色", "addRole", "添加角色异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 删除角色
	 * @param request
	 * @param response
	 */
	@RequestMapping("/delrole")
	public void delRole(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (sysService.deleteRole(id)) {
				out.print("0000");
				logService.addSyslog("删除角色", "delRole", "删除编号为："+id+"的角色", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除角色失败！！！");
				logService.addSyslog("删除角色", "delRole", "删除编号为："+id+"的角色", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除角色", "delRole", "删除角色异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改角色
	 * @param request
	 * @param response
	 */
	@RequestMapping("/updrole")
	public void updRole(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String rolename = request.getParameter("rolename");
			String note = request.getParameter("note");
			if (sysService.updateRole(id, rolename, note)) {
				out.print("0000");
				logService.addSyslog("修改角色", "updRole", "角色名为："+rolename, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改角色失败！！！");
				logService.addSyslog("修改角色", "updRole", "角色名为："+rolename, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改角色", "updRole", "修改角色异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取角色下拉菜单
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getrolecombox")
	public void getRoleCombox(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		try {
			out = response.getWriter();//获得输出对象
			String result = sysService.getRoleCombox();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 自动补全角色
	 * @param request
	 * @param response
	 */
	@RequestMapping("/autorole")
	public void autoRole(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		try {
			out = response.getWriter();// 获得输出对象
			String result = sysService.autoRole();
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 验证角色名是否重复
	 * @param request
	 * @param response
	 */
	@RequestMapping("/isrepeatrole")
	public void isRepeatRole(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		try {
			out = response.getWriter();// 获得输出对象
			String rolename = request.getParameter("rolename");
			if(sysService.isRepeatRole(rolename)){
				out.print("0000");
			}else{
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 验证手机号是否重复
	 * @param request
	 * @param response
	 */
	@RequestMapping("/isrepeatmobile")
	public void isRepeatMobile(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		try {
			out = response.getWriter();// 获得输出对象
			String mobile = request.getParameter("mobile");
			if(sysService.isRepeatMobile(mobile)){
				out.print("0000");
			}else{
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	/**
	 * 验证身份证号
	 * @param request
	 * @param response
	 */
	@RequestMapping("/isrepeatcardid")
	public void isRepeatCardid(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		try {
			out = response.getWriter();// 获得输出对象
			String cardid = request.getParameter("cardid");
			int ismanager = Integer.valueOf(request.getParameter("ismanager"));
			if(sysService.isRepeatCardid(ismanager, cardid))
				out.print("0000");
			else
				out.print("0001");
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/getjoblist")
	public void getJobList(HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		try {
			out = response.getWriter();
			int currentPage = Integer.valueOf(request.getParameter("page"));
			int pageSize = Integer.valueOf(request.getParameter("rows"));
			String result = sysService.getJobList(currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/addjob")
	public void addJob(HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String name = request.getParameter("name");
			if (sysService.addJob(name)) {
				out.print("0000");
				logService.addSyslog("添加职业", "addJob", "职业名为："+name, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加职业失败！！！");
				logService.addSyslog("添加职业", "addJob", "职业名为："+name, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("添加职业", "addJob", "添加职业异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/deljob")
	public void delJob(HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			int id = Integer.valueOf(request.getParameter("id"));
			if (sysService.delJob(id)) {
				out.print("0000");
				logService.addSyslog("删除职业", "delJob", "职业序列为："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除职业失败！！！");
				logService.addSyslog("删除职业", "delJob", "职业序列为："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除职业", "delJob", "删除职业异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updjob")
	public void updJob(HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			int id = Integer.valueOf(request.getParameter("id"));
			String name = request.getParameter("name");
			if (sysService.updJob(id, name)) {
				out.print("0000");
				logService.addSyslog("修改职业", "updJob", "职业名为："+name, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改职业失败！！！");
				logService.addSyslog("修改职业", "updJob", "职业名为："+name, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改职业", "updJob", "修改职业异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getjobcombobox")
	public void getJobCombobox(HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		try {
			out = response.getWriter();
			String result = sysService.getJobCombobox();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/moneyControl")
	public void moneyControl(HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, Object> user = sysService.getUserById(id);
			double money = Double.valueOf(request.getParameter("money"));
			int model = Integer.valueOf(request.getParameter("model"));
			if (model == 2) {
				money = (-money);
			}
			if (sysService.moneyControl(id, money)) {
				if (money >= 0) {
					busiService.addMoney(id, money,2,1, "为用户添加"+money+"的金额", StringUtil.converDouble(user.get("money"))+money);
				} else {
					busiService.addMoney(id, Math.abs(money),1,2, "为用户扣除"+Math.abs(money)+"的金额", StringUtil.converDouble(user.get("money"))+money);
				}
				logService.addSyslog("用户余额控制", "moneyControl", "为序号为："+id+"的用户增加"+money+"元的金额", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				out.print("0000");
			} else {
				out.print("为用户增加余额失败");
				logService.addSyslog("用户余额控制", "moneyControl", "为序号为："+id+"的用户增加"+money+"元的金额", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("用户余额控制", "moneyControl", "用户余额控制异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/pointControl")
	public void pointControl(HttpServletRequest request,HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, Object> user = sysService.getUserById(id);
			int point = Integer.valueOf(request.getParameter("point"));
			int model = Integer.valueOf(request.getParameter("model"));
			if (model == 2) {
				point = (-point);
			}
			if (sysService.pointControl(id, point)) {
				if (point >= 0) {
					busiService.addPoints(id, point,2,1, "为用户添加"+point+"的积分", StringUtil.converInteger(user.get("point"))+point);
				} else {
					busiService.addPoints(id, Math.abs(point),1,2, "为用户扣除"+Math.abs(point)+"的积分", StringUtil.converInteger(user.get("point"))+point);
				}
				logService.addSyslog("用户积分控制", "pointControl", "为序号为："+id+"的用户增加"+point+"积分", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				out.print("0000");
			} else {
				out.print("为用户增加积分失败");
				logService.addSyslog("用户积分控制", "pointControl", "为序号为："+id+"的用户增加"+point+"积分", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("用户积分控制", "pointControl", "用户积分控制异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/modifypassword")
	public void modifypassword(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();// 获得输出对象
			String newPassword = request.getParameter("newPassword");
			if(sysService.modifyPassword(currentsession.getUserinfo().getId(), newPassword)){
				currentsession.getUserinfo().setPassword(newPassword);
				request.getSession().setAttribute("CurrentSession", currentsession);
				out.print("0000");
				logService.addSyslog("修改密码", "modifypassword", currentsession.getUserinfo().getUsername()+"修改密码", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}else{
				out.print("0001");
				logService.addSyslog("修改密码", "modifypassword", currentsession.getUserinfo().getUsername()+"修改密码", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			try {
				logService.addSyslog("修改密码", "modifypassword", "修改密码异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/levelControl")
	public void levelControl(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int level = Integer.valueOf(request.getParameter("level"));
			if (sysService.levelControl(id, level)) {
				out.print("0000");
				logService.addSyslog("等级控制", "levelControl", "修改用户id为“"+id+"”，修改等级为"+level, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改会员等级失败！");
				logService.addSyslog("等级控制", "levelControl", "修改用户id为“"+id+"”，修改等级为"+level, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logService.addSyslog("等级控制", "levelControl", "修改会员等级异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常！");
		}
	}
	@RequestMapping("/sateControl")
	public void sateControl(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int baibaoshopstate = Integer.valueOf(request.getParameter("baibaoshopstate"));
			if (sysService.stateControl(id, baibaoshopstate)) {
				out.print("0000");
				logService.addSyslog("状态控制", "levelControl", "修改用户id为“"+id+"”，修改状态为"+baibaoshopstate, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改会员状态失败！");
				logService.addSyslog("状态控制", "levelControl", "修改用户id为“"+id+"”，修改状态为"+baibaoshopstate, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logService.addSyslog("状态控制", "levelControl", "修改会员状态异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/rePassword")
	public void rePassword(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;// 获得输出对象
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.parseLong(request.getParameter("id"));
			if (sysService.modifyPassword(id, "123456")) {
				out.print("0000");
				logService.addSyslog("重置密码", "rePassword", "为id为“"+id+"”的用户重置密码", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("重置密码失败！");
				logService.addSyslog("重置密码", "rePassword", "为id为“"+id+"”的用户重置密码", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			e.printStackTrace();
			logService.addSyslog("重置密码", "rePassword", "重置密码异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常！");
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int currentPage = 1;
			int pageSize = 99999;
			String id = request.getParameter("id");
			String username = request.getParameter("username");
			String mobile = request.getParameter("mobile");
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			String adminName=request.getParameter("adminName");
			String state = request.getParameter("state");
			String baibaoshopstate = request.getParameter("baibaoshopstate");
			String money = request.getParameter("money");
			String level = request.getParameter("level");
			//String result = sysService.getUserinfoList(id==null?"":id, username==null?"":username, mobile==null?"":mobile, realname==null?"":realname, idcard==null?"":idcard, state==null||"0".equals(state)?"":state,money==null||"0".equals(money)?"":money,level==null||"0".equals(level)?"":level, pageSize, currentPage);
			//Map<String, Object> map = enService.exportCSV(begindate, enddate, enrollid, username==null?"":username);
			Map<String, Object> map=sysService.exportCSV(id==null?"":id, username==null?"":username, mobile==null?"":mobile, realname==null?"":realname, idcard==null?"":idcard,adminName==null?"":adminName, state==null||"0".equals(state)?"":state,baibaoshopstate==null ?"":baibaoshopstate,money==null||"0".equals(money)?"":money,level==null||"0".equals(level)?"":level, pageSize, currentPage);
			
			if(map == null || map.size() == 0){
				PrintWriter out = response.getWriter();
				response.setContentType("text/html; charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				out.print("无数据");
				return ;
			}
			OutputStream os =  null;
			response.reset();//清空输出流
			try {
				os = response.getOutputStream();//取得输出流
			//	Map<String, Object> enroll = (Map<String, Object>) map.get("enroll");
			//	response.setHeader("Content-disposition", "attachment;filename="+enroll.get("cycle")+".xls");
				response.setHeader("Content-disposition", "attachment;filename=t_user.xls");
				response.setContentType("application/msexcel");
				WritableWorkbook wwb = Workbook.createWorkbook(os);//创建Excel文件
				WritableSheet ws = wwb.createSheet("Sheet1", 10);//创建一个工作表
				WritableFont hd = new WritableFont(WritableFont.createFont("微软雅黑"),
						16, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE);
				WritableCellFormat headerFormat = new WritableCellFormat(NumberFormats.TEXT);
				headerFormat.setFont(hd);  
				headerFormat.setBackground(Colour.BLUE);  
				headerFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);  
				headerFormat.setAlignment(Alignment.CENTRE);
				ws.addCell(new Label(0, 0, "华豫之门用户信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"ID号",wcf));
				ws.addCell(new Label(1,1,"登录名",wcf));
				ws.addCell(new Label(2,1,"性别",wcf));
				ws.addCell(new Label(3,1,"手机号",wcf));
				ws.addCell(new Label(4,1,"创建时间",wcf));
				ws.addCell(new Label(5,1,"电子邮箱",wcf));
				ws.addCell(new Label(6,1,"真实姓名",wcf));
				ws.addCell(new Label(7,1,"身份证号",wcf));
				ws.addCell(new Label(8,1,"职业",wcf));
				ws.addCell(new Label(9,1,"地址",wcf));
				ws.addCell(new Label(10,1,"积分",wcf));
				ws.addCell(new Label(11,1,"余额",wcf));
				ws.addCell(new Label(12,1,"会员等级",wcf));
				ws.addCell(new Label(13,1,"操作方式",wcf));
				ws.addCell(new Label(14,1,"状态",wcf));
				ws.addCell(new Label(15,1,"商务专员",wcf));
				ws.addCell(new Label(16,1,"描述",wcf));
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("useList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("id").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("username").toString(),wcf));	
						if(enMap.get("sex").toString().equals("1")){
							ws.addCell(new Label(2,i,"男",wcf));
						}else if(enMap.get("sex").toString().equals("2")){
							ws.addCell(new Label(2,i,"女",wcf));
					}else{
							ws.addCell(new Label(2,i,"保密",wcf));
						}
					ws.addCell(new Label(3,i,enMap.get("mobile").toString(),wcf));
					ws.addCell(new Label(4,i,enMap.get("createdate").toString(),wcf));
					ws.addCell(new Label(5,i,enMap.get("email").toString(),wcf));
				    ws.addCell(new Label(6,i,enMap.get("realname").toString(),wcf));
					ws.addCell(new Label(7,i,enMap.get("idcard").toString(),wcf));					
					ws.addCell(new Label(8,i,enMap.get("jobname").toString(),wcf));
					ws.addCell(new Label(9,i,enMap.get("address").toString(),wcf));
					ws.addCell(new Label(10,i,enMap.get("point").toString(),wcf));
					ws.addCell(new Label(11,i,enMap.get("money").toString(),wcf));
					if(enMap.get("level").toString().equals("1")){
						ws.addCell(new Label(12,i,"星级会员",wcf));
					}else if(enMap.get("level").toString().equals("2")){
						ws.addCell(new Label(12,i,"贵宾会员",wcf));
					}else if(enMap.get("level").toString().equals("3")){
					    ws.addCell(new Label(12,i,"高级会员",wcf));
					}else if(enMap.get("level").toString().equals("4")){
						ws.addCell(new Label(12,i,"超级会员",wcf));
					}else{
						ws.addCell(new Label(12,i,"免费会员",wcf));
					}

					if(enMap.get("model").toString().equals("1")){
						ws.addCell(new Label(13,i,"后台操作",wcf));
					}else if(enMap.get("model").toString().equals("2")){
						ws.addCell(new Label(13,i,"用户操作",wcf));
					}else{
						ws.addCell(new Label(13,i,"其他操作",wcf));
					}
					
					if(enMap.get("state").toString().equals("1")){
						ws.addCell(new Label(14,i,"正常",wcf));
					}else if(enMap.get("state").toString().equals("2")){
						ws.addCell(new Label(14,i,"冻结",wcf));
					}else{
						ws.addCell(new Label(14,i,"删除",wcf));
					}
				    ws.addCell(new Label(15,i,enMap.get("adminName").toString(),wcf));
					ws.addCell(new Label(16,i,enMap.get("desction").toString(),wcf));
					i++;
				}
				ws.getSettings().setVerticalFreeze(2);
				wwb.write();
				wwb.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 用户综合信息查询
	 * @param request
	 * @return
	 */
	@RequestMapping("/gotourl")
	public String gotourl(HttpServletRequest request) {
		String url="";
		try {
			long comprehensiveid = Long.valueOf(request.getParameter("comprehensiveid"));
			url=request.getParameter("url");
			request.setAttribute("comprehensiveid",comprehensiveid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return url;
	}

}
