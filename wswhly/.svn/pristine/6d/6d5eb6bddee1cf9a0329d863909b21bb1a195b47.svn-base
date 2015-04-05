package com.hyzm.admin.control;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.serve.ServeService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/serve")
public class ServeControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private ServeService service;
	
	@RequestMapping("/getServeList")
	public void getServeList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String name = request.getParameter("name");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = service.getServeList(name==null?"":name, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getServeLookList")
	public void getServeLookList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String username = request.getParameter("username");
			String usermobile = request.getParameter("usermobile");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = service.getServeLookList(username==null?"":username, usermobile==null||"0".equals(usermobile)?"":usermobile, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("/addServe")
	public void addServe(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String name = request.getParameter("name");
			double price = Double.valueOf(request.getParameter("price"));
			String period = request.getParameter("period");
			String memo = request.getParameter("memo");
			if (service.addServe(name, price, period, memo)) {
				out.print("0000");
				logService.addSyslog("添加服务", "addServe", "服务名：“"+name+"”，价格：￥"+price, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加服务失败！");
				logService.addSyslog("添加服务", "addServe", "服务名：“"+name+"”，价格：￥"+price, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("添加服务", "addServe", "添加服务异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/onOrOffServe")
	public void delServe (HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int state = Integer.valueOf(request.getParameter("state"));
			if (service.delServe(id, state)) {
				out.print("0000");
				logService.addSyslog("开启/关闭服务", "onOrOffServe", (state==1?"开启":"关闭")+"序列号为“"+id+"”的服务", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("开启/关闭服务失败");
				logService.addSyslog("开启/关闭服务", "onOrOffServe", (state==1?"开启":"关闭")+"序列号为“"+id+"”的服务", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("开启/关闭服务", "onOrOffServe", "开启/关闭服务异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/editServe")
	public void editServe(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String name = request.getParameter("name");
			double price = Double.valueOf(request.getParameter("price"));
			String period = request.getParameter("period");
			String memo = request.getParameter("memo");
			if (service.updServe(id, name, price, period, memo)) {
				out.print("0000");
				logService.addSyslog("修改服务", "editServe", "服务名：“"+name+"”，价格：￥"+price, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改服务失败！");
				logService.addSyslog("修改服务", "editServe", "服务名：“"+name+"”，价格：￥"+price, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("修改服务", "editServe", "修改服务异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoserveInfoList")
	public String gotoServeInfoList(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("serveid", id);
		return "admin/serve/serveInfoManage";
	}
	
	@RequestMapping("/getServeInfoList")
	public void getServeInfoList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long serveid = Long.valueOf(request.getParameter("serveid"));
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = service.getUserServeList(serveid, username==null?"":username, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/addServeUser")
	public void addServeUser(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String username = request.getParameter("username");
			Map<String, Object> user = service.getUsernameByName(username);
			long serviceid = Long.valueOf(request.getParameter("serveid"));
			if (service.addServeUser(StringUtil.converLong(user.get("id")), serviceid)) {
				out.print("0000");
				logService.addSyslog("添加购买服务的用户信息", "addServeUser", "用户名为：“"+user.get("username")+"”，服务id为：“"+user.get("id")+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加购买服务的用户信息失败！");
				logService.addSyslog("添加购买服务的用户信息", "addServeUser", "用户名为：“"+user.get("username")+"”，服务id为：“"+user.get("id")+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("添加购买服务的用户信息", "addServeUser", "添加购买服务的用户信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delServeUser")
	public void delServeUser(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("suid"));
			if (service.delServeUser(id)) {
				out.print("0000");
				logService.addSyslog("删除购买服务的用户信息", "delServeUser", "删除序列号为“"+id+"”的购买信息", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除购买服务的用户信息失败！");
				logService.addSyslog("删除购买服务的用户信息", "delServeUser", "删除序列号为“"+id+"”的购买信息", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("删除购买服务的用户信息", "delServeUser", "删除购买信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updServeUser")
	public void updServeUser(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("suid"));
			int state = Integer.valueOf(request.getParameter("state"));
			if (service.updServeUser(id, state)) {
				out.print("0000");
				logService.addSyslog("修改购买状态", "updServeUser", "修改序列号为“"+id+"”的状态为 “"+state+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改购买状态失败！");
				logService.addSyslog("修改购买状态", "updServeUser", "修改序列号为“"+id+"”的状态为 “"+state+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("修改购买状态", "updServeUser", "修改购买状态异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}

}
