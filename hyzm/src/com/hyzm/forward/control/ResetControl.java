package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.forward.service.user.UserService;


@Controller
@RequestMapping("/resets")
public class ResetControl {
	@Autowired
	private UserService userService;
	private String idString="";
	@RequestMapping("/resetpwd")
	public String gotoReset(HttpServletRequest request) {
		return "reset/resetpwd";
	}
	
	
	@RequestMapping("/resetPassword")
	public void resetPassword(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			String password = request.getParameter("password");
			String respassword = request.getParameter("repassword");
			
			//Map<String,Object> map = userService.verifyPwd(Long.parseLong(idString), oldpassword);
			/*if(!map.get("errorcode").equals("0000")){
				out.print(map.get("errorinfo"));
				return ;
			}*/
			Map<String,Object> map= userService.ChangePassword(Long.parseLong(idString), password, respassword);
			if(map.get("errorcode").equals("0000")){
				out.print("0000");
			}else{
				out.print(map.get("errorinfo"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/telUserName")
	public void telUserName(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{	
			out = response.getWriter();//获得输出对象
			String username = request.getParameter("username");
			Map<String,Object> map = userService.UserNameTel(username);
			if(map.get("errorcode").equals("0000")){
				String  code=map.get("content").toString();
				String str[]=code.split(",");
				idString= str[1];
				out.print(str[2]);
			}else{
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
