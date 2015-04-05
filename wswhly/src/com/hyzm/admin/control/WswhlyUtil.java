package com.hyzm.admin.control;

import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.ad.AdService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.SendMail;

@Controller
@RequestMapping("/wswhlyutil")
public class WswhlyUtil {
	private AdService  appsevice;
	private String dg_kfemail[]=new String[]{"529887775@qq.com","372901428@qq.com","3158656058@qq.com","1062108470@qq.com","18790282811@139.com"};
	/**
	 * 邮件发送
	 * @param request
	 * @param response
	 */
	@RequestMapping("/Dg_sendEmail")
	public void Dg_sendEmail(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String mobile=request.getParameter("mobile");
			String con="手机号:"+mobile+"于"+DateUtil.getDateTime(new Date(), "MM-dd HH:mm:ss");
			 for(int i=0;i<dg_kfemail.length;i++){
				 SendMail.doSendHtmlEmail(con, con,"529887775@qq.com", null);
			 }
			out.print("发送成功");
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	/**
	 * 接受联逾短信回复记录
	 */
	
	@RequestMapping("/smsReply_Ly")
	public void smsReply_Ly(HttpServletRequest request, HttpServletResponse response) {
		try {
			String username=request.getParameter("username");
			String reply=request.getParameter("reply");
			reply=new String(reply.getBytes("GBK"),"iso8859-1");
			SendMail.doSendHtmlEmail("浏览拍品预展手机号："+reply, reply, "529887775@qq.com", null);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 添加android安装信息
	 */
	
	@RequestMapping("/app_baseInfo")
	public void app_baseInfo(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			//设备编号
			String code=request.getParameter("code");
			//手机类型
			String type=request.getParameter("type");
			//版本
			String vs=request.getParameter("vs");
			//时间
			String time=request.getParameter("time");
			
			//添加信息
			Map<String, String> map=new HashMap<String, String>();
			map.put("code",code);
			map.put("type",type);
			map.put("vs",vs);
			appsevice.addAPP(map);
			
			//发回信息
			SendMail.doSendHtmlEmail("code:"+code+" type:"+type+" vs:"+vs+" time:"+time, "code:"+code+" type:"+type+" vs:"+vs+" time:"+time, "1115488904@qq.com", null);	
			out.print("1");
			
		} catch (Exception e) {
			e.printStackTrace();
			out.print("0");
		}
	}
	
	
	
	
	
	public static void main(String[] args) throws UnsupportedEncodingException {
		String reply="13261356132{||} ظ Ի {||}2015-03-03 14:22:59{$$$}";
		reply=new String(reply.getBytes("GBK"),"iso8859-1");
		System.out.println(reply);
	}
}
