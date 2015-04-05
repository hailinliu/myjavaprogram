package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.enroll.CurrentEnrollRespBean.Enroll;
import com.hyzm.bean.tool.GetJobsRespBean.Job;
import com.hyzm.bean.user.LoginRespBean.User;
import com.hyzm.forward.service.mine.MineService;
import com.hyzm.forward.service.user.UserService;

@Controller
@RequestMapping("/user")
public class UserControl {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MineService service;
	
	@RequestMapping("/Login")
	public void Login(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String verifycode = request.getParameter("verifycode");
			String auto = request.getParameter("auto");
			Object obj = request.getSession().getAttribute("errorcount");
			int errorcount;
			if(obj != null)
				errorcount = Integer.valueOf(obj.toString());
			else
				errorcount = 0;
			if(errorcount > 3){
				if (!verifycode.equalsIgnoreCase(request.getSession().getAttribute(request.getSession().getId()).toString())) {
					out.print("验证码错误");
					return ;
				}
			}
			Map<String,Object> map = userService.Login(username, password);
			if(map.get("errorcode").equals("0000")){
				User user = (User)map.get("user");
				CurrentSession currentSession = new CurrentSession();
				currentSession.setId(user.getId());
				currentSession.setUsername(user.getUsername());
				currentSession.setRealname(user.getRealname());
				currentSession.setIdcard(user.getIdcard());
				currentSession.setAddress(user.getAddress());
				currentSession.setEmail(user.getEmail());
				if(user.getJob() != null)
					currentSession.setJob(Integer.valueOf(user.getJob()));
				currentSession.setJobname(user.getJobname());
				currentSession.setMobile(user.getMobile());
				currentSession.setMoney(user.getMoney());
				currentSession.setPoint(user.getPoint());
				currentSession.setCreatedate(user.getCreatedate());
				currentSession.setLevel(user.getLevel());
				currentSession.setLeveltime(user.getLeveltime());
				currentSession.setIdcardimg(user.getIdcardimg());
				currentSession.setOpenId(user.getOpenId());
				currentSession.setWeixin(user.getWeixin());
				currentSession.setBaibaoshopstate(user.getBaibaoshopstate());
				request.getSession().setAttribute("CurrentSession", currentSession);
				request.getSession().setAttribute("errorcount","0");
				if(auto != null && auto.equals("1")){
					Cookie cookie = new Cookie("username", URLEncoder.encode(username,"utf-8")); 
			        Cookie cookie0 = new Cookie("password", URLEncoder.encode(password,"utf-8")); 
			        cookie.setMaxAge(999999999);
			        cookie0.setMaxAge(999999999);
			        cookie.setPath("/");
			        cookie0.setPath("/");
			        response.addCookie(cookie);
			        response.addCookie(cookie0);
				}
				out.print("0000");
			}else{
				errorcount++;
				request.getSession().setAttribute("errorcount",errorcount);
				out.print(map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 登录
	 */
	@RequestMapping("/LoginByOpenId")
	public void LoginByOpenId(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		//所设置
		try{
			out = response.getWriter();//获得输出对象
			String openId = request.getParameter("openId");
			Map<String,Object> mapopenId = userService.Login(openId);
			if(mapopenId==null){
				out.print("9999");
			}else{
				String username=mapopenId.get("username").toString();
				String password=mapopenId.get("password").toString();
				Map<String,Object> map = userService.Login(username, password);
				if(map.get("errorcode").equals("0000")){
					User user = (User)map.get("user");
					CurrentSession currentSession = new CurrentSession();
					currentSession.setId(user.getId());
					currentSession.setUsername(user.getUsername());
					currentSession.setRealname(user.getRealname());
					currentSession.setIdcard(user.getIdcard());
					currentSession.setAddress(user.getAddress());
					currentSession.setEmail(user.getEmail());
					if(user.getJob() != null)
						currentSession.setJob(Integer.valueOf(user.getJob()));
					currentSession.setJobname(user.getJobname());
					currentSession.setMobile(user.getMobile());
					currentSession.setMoney(user.getMoney());
					currentSession.setPoint(user.getPoint());
					currentSession.setCreatedate(user.getCreatedate());
					currentSession.setLevel(user.getLevel());
					currentSession.setLeveltime(user.getLeveltime());
					currentSession.setIdcardimg(user.getIdcardimg());
					currentSession.setOpenId(user.getOpenId());
					currentSession.setWeixin(user.getWeixin());
					currentSession.setBaibaoshopstate(user.getBaibaoshopstate());
					request.getSession().setAttribute("CurrentSession", currentSession);
					out.print("0000");
				}else{
					out.print("9999");
				}
			}
		} catch (Exception e) {
			out.print("9999");
			e.printStackTrace();
		}
	}
	/**
	 * 修改openId
	 */
	@RequestMapping("/Login_upOpenIdBymobile")
	public void upOpenIdBymobile(HttpServletRequest request,HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		//所设置
		try{
			out = response.getWriter();//获得输出对象
			//获取验证码
			String openId = request.getParameter("openId");
			String mobile = request.getParameter("mobile");
			String verifycode = request.getParameter("verifycode");
			Map<String,Object> map = userService.verifyMobileCode(mobile, verifycode);
			if(map.get("errorcode").equals("0000")){
				//修改openId
				Map<String,Object> mapopenId = userService.upOpenIdBymobile(mobile, openId);
				if(mapopenId.get("errorcode").equals("0000")){
					out.print("0000");
				}
			}
			 
		} catch (Exception e) {
			out.print("9999");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/Register")
	public String Register(HttpServletRequest request, HttpServletResponse response) {
		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String repassword = request.getParameter("repassword");
			String mobile = request.getParameter("mobile");
			String openId=request.getParameter("openId");
			if(openId==null){openId="";};
			Map<String,Object> map = userService.Register(username, password, repassword, mobile,openId);
			if(map.get("errorcode").equals("0000")){
				User user = (User)map.get("user");
				CurrentSession currentSession = new CurrentSession();
				currentSession.setId(user.getId());
				currentSession.setUsername(user.getUsername());
				currentSession.setRealname(user.getRealname());
				currentSession.setIdcard(user.getIdcard());
				currentSession.setAddress(user.getAddress());
				currentSession.setEmail(user.getEmail());
				if(user.getJob() != null)
					currentSession.setJob(Integer.valueOf(user.getJob()));
				currentSession.setJobname(user.getJobname());
				currentSession.setMobile(user.getMobile());
				currentSession.setMoney(user.getMoney());
				currentSession.setPoint(user.getPoint());
				currentSession.setLevel(user.getLevel());
				currentSession.setLeveltime(user.getLeveltime());
				currentSession.setCreatedate(user.getCreatedate());
				request.getSession().setAttribute("CurrentSession", currentSession);
			}else{
				request.setAttribute("errorinfo", map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/UserCenter";
	}
	
	@RequestMapping("/ChangePassword")
	public void ChangePassword(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象6
		try{
			out = response.getWriter();//获得输出对象
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			String oldpassword = request.getParameter("oldpassword");
			String password = request.getParameter("password");
			
			//Map<String,Object> map = userService.verifyPwd(currentSession.getId(), oldpassword);
			//if(!map.get("errorcode").equals("0000")){
			//	out.print(map.get("errorinfo"));
			//	return ;
			//}
			Map<String,Object> map = userService.ChangePassword(currentSession.getId(), oldpassword, password);
			if(map.get("errorcode").equals("0000")){
				out.print("0000");
			}else{
				out.print(map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/verifyUserName")
	public void verifyUserName(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			String username = request.getParameter("username");
			Map<String,Object> map = userService.verifyUserName(username);
			if(map.get("errorcode").equals("0000")){
				out.print("0000");
			}else{
				out.print(map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/verifyMobile")
	public void verifyMobile(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			String mobile = request.getParameter("mobile");
			Map<String,Object> map = userService.verifyMobile(mobile);
			if(map.get("errorcode").equals("0000")){
				out.print("0000");
			}else{
				out.print(map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/verifyMobileCode")
	public void verifyMobileCode(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			String mobile = request.getParameter("mobile");
			String verifycode = request.getParameter("verifycode");
			Map<String,Object> map = userService.verifyMobileCode(mobile, verifycode);
			if(map.get("errorcode").equals("0000")){
				out.print("0000");
			}else{
				out.print(map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/SendSms")
	public void SendSms(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			String mobile = request.getParameter("mobile");
			String type = request.getParameter("type");
			Map<String,Object> map = userService.sendSms(mobile, Integer.valueOf(type));
			if(map.get("errorcode").equals("0000")){
				out.print("0000");
			}else{
				out.print(map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/UserCenter")
	public String UserCenter(HttpServletRequest request, HttpServletResponse response) {
		try{
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			Map<String,Object> map = service.getMyCollection("3", String.valueOf(currentSession.getId()), 1, 1);
			request.setAttribute("mycount", map.get("count"));	
			map = userService.CurrentEnroll();
			Enroll enroll = null;
			if(map.get("errorcode").equals("0000")){
				enroll = (Enroll)map.get("enroll");
				request.setAttribute("enroll", enroll);
			}else{
				request.setAttribute("errorinfo", map.get("errorinfo"));
			}
			if(enroll != null){
				map = userService.EnrollCollection(currentSession.getId(), enroll.getId());
				if(map.get("errorcode").equals("0000")){
					List<Long> list = (List<Long>)map.get("list");
					request.setAttribute("enrollcollection", list.size());
				}else{
					request.setAttribute("errorinfo", map.get("errorinfo"));
				}
			}
			map = userService.CurrentMoney(currentSession.getId());
			if(map.get("errorcode").equals("0000")){
				request.setAttribute("money", map.get("money"));
				request.setAttribute("points", map.get("points"));
			}
			map = userService.GetJobs();
			if(map.get("errorcode").equals("0000")){
				List<Job> list = (List<Job>)map.get("list");
				request.setAttribute("jobs", list);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/mine/userCenter";
	}
	
	@RequestMapping("/ModifyUser")
	public void ModifyUser(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			String newmobile = request.getParameter("newmobile");
			String newemail = request.getParameter("newemail");
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			String idcardimg = request.getParameter("idcardimg");
			String job = request.getParameter("job");
			String jobname = request.getParameter("jobname");
			String address = request.getParameter("address");
			Map<String,Object> map = userService.ModifyUser(currentSession.getId(), newmobile, newemail, realname, idcard,idcardimg, job, address);
			if(map.get("errorcode").equals("0000")){
				if(newmobile != null){
					currentSession.setMobile(newmobile);
				}
				if(newemail != null){
					currentSession.setEmail(newemail);
				}
				if(realname != null){
					currentSession.setRealname(realname);
				}
				if(idcard != null){
					currentSession.setIdcard(idcard);
				}
				if(idcardimg != null){
					currentSession.setIdcard(idcardimg);
				}
				if(job != null){
					currentSession.setJob(Integer.valueOf(job));
					currentSession.setJobname(jobname);
				}
				if(address != null){
					currentSession.setAddress(address);
				}
				request.getSession().setAttribute("CurrentSession",currentSession);
				out.print("0000");
			}else{
				out.print(map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/ModifyBaibao")
	public void ModifyBaibao(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			Map<String,Object> map = userService.ModifyBaibao(currentSession.getId());
			userService.ModifyUser(currentSession.getId(), null, null, null, null,request.getParameter("idcardimg"), null, null);
			currentSession.setBaibaoshopstate("2");
			currentSession.setIdcardimg(request.getParameter("idcardimg"));
			request.getSession().setAttribute("CurrentSession",currentSession);
			out.print("0000");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("/Logout")
	public void Logout(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			Cookie cookie = new Cookie("username", null); 
	        Cookie cookie0 = new Cookie("password", null); 
	        cookie.setMaxAge(999999999);
	        cookie0.setMaxAge(999999999);
	        cookie.setPath("/");
	        cookie0.setPath("/");
	        response.addCookie(cookie);
	        response.addCookie(cookie0);
			request.getSession().removeAttribute("CurrentSession");
			out.print("0000");
		} catch (Exception e) {
			out.print("9999");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getMoney")
	public void getMoney(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			Map<String,Object> map = userService.CurrentMoney(currentSession.getId());
			if(map.get("errorcode").equals("0000")){
				out.print(map.get("money"));
			}else{
				out.print(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
