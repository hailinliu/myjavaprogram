package com.hyzm.admin.control;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.yc.ActionService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;

@Controller
@RequestMapping("/ycaction")
public class YcActionControl {
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private ActionService service;
	
	@RequestMapping("/getycactionlist")
	public void getActionList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String bdate = request.getParameter("begindate");
			String edate = request.getParameter("enddate");
			Date begindate = null;
			Date enddate = null;
			if(bdate == null || bdate.equals("")){
				begindate = DateUtil.getDateTime(DateUtil.getDate(-7)+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}else{
				begindate = DateUtil.getDateTime(bdate+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}
			if(edate == null || edate.equals("")){
				enddate = DateUtil.getDateTime(DateUtil.getDateTime(new Date(), "yyyy-MM-dd")+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}else{
				enddate = DateUtil.getDateTime(edate+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}
			
			String auctionname = request.getParameter("auctionname");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = service.getActionList(begindate, enddate, auctionname==null?"":auctionname, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotoaddycaction")
	public String gotoAddAction() {
		return "admin/yc/addycaction";
	}
	@RequestMapping("/addycaction")
	public void addAction(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String auctionname = request.getParameter("auctionname");
			String actiontime = request.getParameter("actiontime");
			long ins_id = Long.valueOf(request.getParameter("ins_id"));
			String place = request.getParameter("place");
			String specialnumber = request.getParameter("specialnumber");
			String totalnumber = request.getParameter("totalnumber");
			String state = request.getParameter("state");
			String previewtime = request.getParameter("previewtime");
			String previewaddress = request.getParameter("previewaddress");
			if (service.addAction(auctionname, actiontime, ins_id, place, specialnumber, totalnumber, Integer.parseInt(state), previewtime, previewaddress)){
				out.print("0000");
			} else {
				out.print("0001");
			}
		} catch (Exception e) {
			logService.addSyslog("添加拍卖会", "addaction", "添加拍卖会异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	@RequestMapping("/gotoeditycaction")
	public String gotoEditAction(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("action", service.getActionById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/yc/editaction";
	}
	
	@RequestMapping("/editaction")
	public void updaction(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String auctionname = request.getParameter("auctionname");
			String actiontime = request.getParameter("actiontime");
			long ins_id = Long.valueOf(request.getParameter("ins_id"));
			String place = request.getParameter("place");
			String specialnumber = request.getParameter("specialnumber");
			String totalnumber = request.getParameter("totalnumber");
			String state = request.getParameter("state");
			String previewtime = request.getParameter("previewtime");
			String previewaddress = request.getParameter("previewaddress");
			
			if (service.updAction(id, auctionname, actiontime, ins_id, place, specialnumber, totalnumber, Integer.parseInt(state), previewtime, previewaddress)) {
				out.print("0000");
				logService.addSyslog("修改拍卖会", "updateaction", "修改拍卖会名为：《"+auctionname+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改拍卖会", "updateaction", "修改拍卖会名为：《"+auctionname+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改拍卖会", "updateaction", "修改拍卖会异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getaction")
	public void getaction(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String ins_id=request.getParameter("ins_id");
			String result = service.getaction(ins_id);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("/getspeciallist")
	public void getspeciallist(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String specialname = request.getParameter("specialname");
			String actionid = request.getParameter("actionid");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = service.getSpecialList(null, null, specialname, actionid, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotoaddspecial")
	public String gotoaddspecial() {
		return "admin/yc/addycspecil";
	}
	@RequestMapping("/addycspecil")
	public void addycspecil(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String specialname = request.getParameter("specialname");
			String time = request.getParameter("time");
			int actionid = Integer.valueOf(request.getParameter("actionid"));
			String address = request.getParameter("address");
			String totalnum = request.getParameter("totalnum");
			if (service.addSpecial(specialname, time, actionid, address, totalnum)){
				out.print("0000");
			} else {
				out.print("0001");
			}
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	
	@RequestMapping("/getspecil")
	public void getspecil(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String actionid=request.getParameter("actionid");
			String result = service.getspecial(actionid);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	
	
}
