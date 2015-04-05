package com.hyzm.admin.control;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.enroll.EnrollService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;

@Controller
@RequestMapping("/enroll")
public class EnrollControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private EnrollService enService;
	
	@RequestMapping("/getEnrollList")
	public void getEnrollList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String bdate = request.getParameter("begindate");
			String edate = request.getParameter("enddate");
			Date begindate = null;
			Date enddate = null;
			if (bdate == null || bdate.equals("")) {
				begindate = DateUtil.getDateTime(DateUtil.getDate(-7)+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}else{
				begindate = DateUtil.getDateTime(bdate+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}
			if(edate == null || edate.equals("")){
				enddate = DateUtil.getDateTime(DateUtil.getDateTime(new Date(), "yyyy-MM-dd")+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}else{
				enddate = DateUtil.getDateTime(edate+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = enService.getEnrollList(begindate, enddate, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoEnrollInfoList")
	public String gotoEnrollInfoList(HttpServletRequest request) {
		String id = request.getParameter("id");
		request.setAttribute("enrollid", id);
		return "admin/enroll/enrollInfoManage";
	}
	
	@RequestMapping("/getEnrollInfoList")
	public void getEnrollInfoList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String bdate = request.getParameter("begindate");
			String edate = request.getParameter("enddate");
			Date begindate = null;
			Date enddate = null;
			if (bdate == null || bdate.equals("")) {
				begindate = DateUtil.getDateTime(DateUtil.getDate(-7)+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}else{
				begindate = DateUtil.getDateTime(bdate+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}
			if(edate == null || edate.equals("")){
				enddate = DateUtil.getDateTime(DateUtil.getDateTime(new Date(), "yyyy-MM-dd")+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}else{
				enddate = DateUtil.getDateTime(edate+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}
			long enrollid = Long.valueOf(request.getParameter("enrollid"));
			String username = request.getParameter("username");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = enService.getEnrollInfoList(begindate, enddate, enrollid, username==null?"":username, currentPage, pageSize);
			
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getCollectionsByBmid")
	public void getCollectionsByBmid(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long bmid = Long.valueOf(request.getParameter("bmid"));
			String result = enService.getCollectionsByBmid(bmid);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/addEnroll")
	public void addEnroll(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long cycle = Long.valueOf(request.getParameter("cycle"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Date begindate = DateUtil.getDateTime(request.getParameter("begindate"), "yyyy-MM-dd hh:mm:ss");
			Date enddate = DateUtil.getDateTime(request.getParameter("enddate"), "yyyy-MM-dd hh:mm:ss");
			Date validdate = DateUtil.getDateTime(request.getParameter("validdate"), "yyyy-MM-dd hh:mm:ss");
			if (enService.addEnroll(cycle, title, content, begindate, enddate, validdate)) {
				out.print("0000");
				logService.addSyslog("添加报名活动", "addEnroll", "报名期数：“"+cycle+"”，报名期名称：《"+title+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加报名活动失败！");
				logService.addSyslog("添加报名活动", "addEnroll", "报名期数：“"+cycle+"”，报名期名称：《"+title+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("添加报名活动", "addEnroll", "添加报名活动异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/onOrOffEnroll")
	public void onOrOffEnroll(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int state = Integer.valueOf(request.getParameter("state"));
			if (enService.onOrOffEnroll(id, state)) {
				out.print("0000");
				logService.addSyslog("开启/关闭报名活动", "onOrOffEnroll", (state==1?"开启":"关闭")+"序列号为“"+id+"”的报名活动", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除报名活动失败！");
				logService.addSyslog("开启/关闭报名活动", "onOrOffEnroll", (state==1?"开启":"关闭")+"序列号为“"+id+"”的报名活动", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("开启/关闭报名活动", "onOrOffEnroll", "开启/关闭报名活动异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/editEnroll")
	public void editEnroll(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			long cycle = Long.valueOf(request.getParameter("cycle"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Date begindate = DateUtil.getDateTime(request.getParameter("begindate"), "yyyy-MM-dd hh:mm:ss");
			Date enddate = DateUtil.getDateTime(request.getParameter("enddate"), "yyyy-MM-dd hh:mm:ss");
			Date validdate = DateUtil.getDateTime(request.getParameter("validdate"), "yyyy-MM-dd hh:mm:ss");
			if (enService.editEnroll(cycle, title, content, begindate, enddate, validdate, id)) {
				out.print("0000");
				logService.addSyslog("修改报名活动", "editEnroll", "报名期数修改为：“"+cycle+"”，报名期名称修改为：《"+title+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改报名活动失败！");
				logService.addSyslog("修改报名活动", "editEnroll", "报名期数修改为：“"+cycle+"”，报名期名称修改为：《"+title+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("修改报名活动", "editEnroll", "修改报名活动异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		try {
			String bdate = request.getParameter("begindate");
			String edate = request.getParameter("enddate");
			Date begindate = null;
			Date enddate = null;
			if (bdate == null || bdate.equals("")) {
				begindate = DateUtil.getDateTime(DateUtil.getDate(-7)+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}else{
				begindate = DateUtil.getDateTime(bdate+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}
			if(edate == null || edate.equals("")){
				enddate = DateUtil.getDateTime(DateUtil.getDateTime(new Date(), "yyyy-MM-dd")+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}else{
				enddate = DateUtil.getDateTime(edate+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}
			long enrollid = Long.valueOf(request.getParameter("enrollid"));
			String username = request.getParameter("username");
			Map<String, Object> map = enService.exportCSV(begindate, enddate, enrollid, username==null?"":username);
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
				Map<String, Object> enroll = (Map<String, Object>) map.get("enroll");
				response.setHeader("Content-disposition", "attachment;filename="+enroll.get("cycle")+".xls");
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
				ws.addCell(new Label(0, 0, "华豫之门“"+enroll.get("cycle")+"”期《"+enroll.get("title")+"》报名信息", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"用户名",wcf));
				ws.addCell(new Label(1,1,"会员级别",wcf));
				ws.addCell(new Label(2,1,"电话号码",wcf));
				ws.addCell(new Label(3,1,"报名藏品数",wcf));
				ws.addCell(new Label(4,1,"报名编号",wcf));
				ws.addCell(new Label(5,1,"报名时间",wcf));
				ws.addCell(new Label(6,1,"鉴定日期",wcf));
				
				List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("enrollInfoList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("username").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("level").toString(),wcf));
					ws.addCell(new Label(2,i,enMap.get("mobile").toString(),wcf));
					ws.addCell(new Label(3,i,enMap.get("collectionnum").toString(),wcf));
					ws.addCell(new Label(4,i,enMap.get("code").toString(),wcf));
					ws.addCell(new Label(5,i,enMap.get("createdate").toString(),wcf));
					ws.addCell(new Label(6,i,enMap.get("validdate").toString(),wcf));
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

}
