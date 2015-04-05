package com.hyzm.admin.control;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.proficient.ProficientService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;

@Controller
@RequestMapping("/proficient")
public class ProficientControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private ProficientService proService;
	
	@RequestMapping("/getproficientlist")
	public void getProficientList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String name = request.getParameter("name");
			String speciality = request.getParameter("speciality");
			String appellation = request.getParameter("appellation");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = proService.getProficientList(name==null?"":name, speciality==null?"":speciality, appellation==null?"":appellation, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoaddproficient")
	public String gotoAddProficient() {
		return "admin/proficient/addproficient";
	}
	
	@RequestMapping("/gotoeditproficient")
	public String gotoEditProficient(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("pro", proService.getProficientById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/proficient/editproficient";
	}
	
	@RequestMapping("/addproficient")
	public void addProficient(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String name = request.getParameter("name");
			String speciality = request.getParameter("speciality");
			String appellation = request.getParameter("appellation");
			String imgurl = request.getParameter("imgurl");
			String note = request.getParameter("note");
			String hxqh = request.getParameter("hxqh");
			String orderc = request.getParameter("orderc");
			String isbqhx = request.getParameter("isbqhx");
			if (proService.addProficient(name, imgurl, speciality, appellation, note, orderc, isbqhx, hxqh)) {
				out.print("0000");
				logService.addSyslog("添加专家信息", "addProficient", "添加专家信息，专家名称为：“"+name+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加专家信息失败！！！");
				logService.addSyslog("添加专家信息", "addProficient", "添加专家信息，专家名称为：“"+name+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("添加专家信息", "addProficient", "添加专家信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delproficient")
	public void delProficient(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		//String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "proficient/";//获取文件绝对路径
		PrintWriter out = null;
		try {
			out = response.getWriter();//获得输出流
			long delid = Long.valueOf(request.getParameter("delid"));
			Map<String, Object> map = proService.getProficientById(delid);
			if (proService.delProficient(delid)) {
				/*File delfile = new File(saveFilePath + map.get("imgurl"));
				File delsmalfile = new File(saveFilePath + "/small/" + map.get("imgurl"));
				if (delfile.exists()) {
					delfile.delete();
				}
				if (delsmalfile.exists()) {
					delsmalfile.delete();
				}*/
				out.print("0000");
				logService.addSyslog("删除专家信息", "delProficient", "删除专家信息，专家名称为：“"+map.get("name")+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除专家信息失败！！！");
				logService.addSyslog("删除专家信息", "delProficient", "删除专家信息，专家名称为：“"+map.get("name")+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("删除专家信息", "delProficient", "删除专家信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/editproficient")
	public void updProficient(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String name = request.getParameter("name");
			String speciality = request.getParameter("speciality");
			String appellation = request.getParameter("appellation");
			String imgurl = request.getParameter("imgurl");
			String note = request.getParameter("note");
			String hxqh = request.getParameter("hxqh");
			String orderc = request.getParameter("orderc");
			String isbqhx = request.getParameter("isbqhx");
			if (proService.updProficient(id, name, imgurl, speciality, appellation, note, orderc, isbqhx, hxqh)) {
				out.print("0000");
				logService.addSyslog("修改专家信息", "updProficient", "修改专家信息，专家名称为：“"+name+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改专家信息失败！！！");
				logService.addSyslog("修改专家信息", "updProficient", "修改专家信息，专家名称为：“"+name+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("修改专家信息", "updProficient", "修改专家信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/autoname")
	public void autoName(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = proService.autoName();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/autoappellation")
	public void autoAppellation(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = proService.autoAppellation();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/autospeciality")
	public void autoSpeciality(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = proService.autoSpeciality();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}

}
