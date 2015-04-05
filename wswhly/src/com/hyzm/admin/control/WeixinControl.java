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
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.hyzm.admin.service.business.BusinessService;
import com.hyzm.admin.service.weixin.WeixinService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateJsonValueProcessor;


@Controller
@RequestMapping("/weixin")
public class WeixinControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private WeixinService weixinService;
	
	@Autowired
	private BusinessService busiService;

	@RequestMapping("/getUserById")
	public void getUserById(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Long id = Long.valueOf(request.getParameter("id"));			
			Map<String, Object> result = weixinService.getUserById(id);
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
	@RequestMapping("/getuserinfo")
	public void getUserinfo(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim()); 
			String onesearch = request.getParameter("onesearch");
			String search = request.getParameter("search");
			String state = request.getParameter("state");
			String level = request.getParameter("level");
			String type = request.getParameter("type");
			String duibi = request.getParameter("duibi");			
			String result = weixinService.getUserinfoList(search==null||"0".equals(search)?"":search, onesearch==null?"":onesearch,state==null||"0".equals(state)?"":state,level==null||"0".equals(level)?"":level,duibi==null||"0".equals(duibi)?"":duibi,type==null||"0".equals(type)?"":type, pageSize, currentPage);
			out.print(result);
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
			int sex = Integer.valueOf(request.getParameter("sex"));
			String mobile = request.getParameter("mobile");
			String email = request.getParameter("email");
			String realname = request.getParameter("realname");
			String idcard = request.getParameter("idcard");
			String address = request.getParameter("address");
			String weixin = request.getParameter("weixin");
			String recommend = request.getParameter("recommend");
			if (weixinService.addUser(username, sex, mobile, email, realname, idcard, address, weixin,recommend)) {
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
			String adminName = request.getParameter("adminName");
			String address = request.getParameter("address");
			String desction =request.getParameter("desction");
			long id = Long.valueOf(request.getParameter("id"));
			if (weixinService.updUser(sex, mobile, email, realname, idcard, address,adminName,desction, id)) {
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
			if (weixinService.deleteUser(id)) {
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

	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int currentPage = 1;
			int pageSize = 99999;
			String onesearch = request.getParameter("onesearch");
			String search = request.getParameter("search");
			String state = request.getParameter("state");
			String level = request.getParameter("level");
			String type = request.getParameter("type");
			String duibi = request.getParameter("duibi");			
			//String result = weixinService.getUserinfoList(id==null?"":id, username==null?"":username, mobile==null?"":mobile, realname==null?"":realname, idcard==null?"":idcard, state==null||"0".equals(state)?"":state,money==null||"0".equals(money)?"":money,level==null||"0".equals(level)?"":level, pageSize, currentPage);
			//Map<String, Object> map = enService.exportCSV(begindate, enddate, enrollid, username==null?"":username);
			Map<String, Object> map=weixinService.exportCSV(search==null||"0".equals(search)?"":search, onesearch==null?"":onesearch,state==null||"0".equals(state)?"":state,level==null||"0".equals(level)?"":level,duibi==null||"0".equals(duibi)?"":duibi,type==null||"0".equals(type)?"":type, pageSize, currentPage);
			
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
