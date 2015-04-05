package com.hyzm.admin.control;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
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
import com.hyzm.admin.service.daigou.DaigouService;
import com.hyzm.admin.service.sys.SysService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.UserInfo;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateJsonValueProcessor;
import com.hyzm.util.DateUtil;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/daigou")
public class DaigouControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private DaigouService daiService;
	
	@RequestMapping("/getUserById")
	public void getUserById(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Long id = Long.valueOf(request.getParameter("id"));			
			Map<String, Object> result = daiService.getDaigouById(id);
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(Timestamp.class, new DateJsonValueProcessor("yyyy-MM-dd HH:mm:ss"));
			System.out.println(JSONObject.fromObject(result, jsonConfig).toString());
			out.print(JSONObject.fromObject(result, jsonConfig).toString());
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
	@RequestMapping("/getdaigouinfo")
	public void getDaigouinfo(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());		
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
			String name = request.getParameter("name");
			String mobile = request.getParameter("mobile");			
			String state = request.getParameter("state");
			String result = daiService.getDaigouinfoList(begindate, enddate, name==null?"":name, mobile==null?"":mobile, state==null||"0".equals(state)?"":state, pageSize, currentPage);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	
	/**
	 * 修改用户信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/upddaigou")
	public void updDaigou(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			int sex = Integer.valueOf(request.getParameter("sex"));
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");		
			String address = request.getParameter("address");
			String weixin = request.getParameter("weixin");
			int state = Integer.valueOf(request.getParameter("state"));
			long id = Long.valueOf(request.getParameter("id"));
			if (daiService.updDaigou(sex, mobile, email, address, weixin, state, id)){
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


}
