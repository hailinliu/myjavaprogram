package com.hyzm.admin.control;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyzm.admin.service.message.MessageService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.SendSMS;
import com.hyzm.util.SendSmsL;
import com.hyzm.util.SendSmsV;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/message")
public class MessageControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private MessageService service;
	
	@RequestMapping("/getMessageList")
	public void getMessageList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String mobile = request.getParameter("mobile");
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
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page"));
			int pageSize = Integer.valueOf(request.getParameter("rows"));
			String result = service.getMessageList(mobile==null?"":mobile, begindate, enddate, state==null||"-2".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploadMobile")
	public void uploadMobile(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "mobile/";//获取文件绝对路径
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
			fileDir.mkdirs();
		}
		String fileNameLong = file.getOriginalFilename();//获取上传的文件名称
		String extensionName = fileNameLong.substring(fileNameLong.lastIndexOf(".") + 1);//获取文件扩展名
		String filename = UUID.randomUUID().toString();//重命名文件
		PrintWriter out = null;
		try {
			out = response.getWriter();
			FileOutputStream fileout = new FileOutputStream(saveFilePath + filename + "." + extensionName);
			fileout.write(file.getBytes());//写入文件
			fileout.close();
			out.print(filename + "." + extensionName);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoaddmessage")
	public String gotoAddMessage() {
		return "admin/message/addmessage";
	}
	
	@RequestMapping("/sendMessage")
	public void sendMessage(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "mobile/";//获取文件绝对路径
		PrintWriter out = null;
		BufferedReader reader = null;
		String tempString = null;
		String mobile = "";
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String filename = request.getParameter("message");
			String content = request.getParameter("content");
			String type=request.getParameter("type");
			File readfile=new File(saveFilePath + filename);
			if(readfile.isFile() && readfile.exists()){
				reader = new BufferedReader(new FileReader(readfile));
				int line =1;
				while ((tempString = reader.readLine()) != null) {
					mobile += tempString;
		            line ++ ;
		        }
				reader.close();
				if (!"".equals(mobile)) {
					String[] mobiles = mobile.split(",");
					if(type=="lianyu"||type.equals("lianyu")){
						Map<String, String> map=new HashMap<String, String>();
						map=  SendSmsL.SendSMS(mobile, content);
						for (String str : mobiles) {
							addMessage(str, content, StringUtil.converString(map.get("errorcode")), 0, StringUtil.converString(map.get("time")), StringUtil.converString(map.get("msgcount")), currentsession.getUserinfo().getUsername(), request.getRemoteAddr());
						}
					}else{
						for (String str : mobiles) {
							Map<String, String> map=new HashMap<String, String>();
							if(type=="86"||type.equals("86")){
								map= SendSMS.SendSMS(str, content);
							}else if(type=="huyi"||type.equals("huyi")){
								map=SendSmsV.SendSMS(str, content);
							}else{
								map= SendSMS.SendSMS(str, content);
							}
							addMessage(str, content, StringUtil.converString(map.get("errorcode")), 0, StringUtil.converString(map.get("time")), StringUtil.converString(map.get("msgcount")), currentsession.getUserinfo().getUsername(), request.getRemoteAddr());
						}
					}
					out.print("0000");
				} else {
					out.print("短信发送失败");
				}
			}
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}

	public boolean addMessage(String mobile, String content, String state, int times, String backtime, String accountcount, String username, String ip) {
		try {
			if (service.addSmsSend(mobile, content, state, times, backtime, accountcount) > 0) {
				logService.addSyslog("后台发送短信", "sendMessage", "为手机号为“"+mobile+"”的用户发送短信："+content, "成功", username, ip, 2);
				return true;
			} else {
				logService.addSyslog("后台发送短信", "sendMessage", "为手机号为“"+mobile+"”的用户发送短信："+content, "失败", username, ip, 2);
				return false;
			}
		} catch (Exception e) {
			logService.addSyslog("后台发送短信", "sendMessage", "发送短信异常："+e.getMessage(), "异常", username, ip, 2);
			e.printStackTrace();
		}
		return false;
	}
	
	@RequestMapping("/gotovipmessage")
	public String gotoVipMessage() {
		return "admin/message/vipMessageManage";
	}
	
	@RequestMapping("/getVipMessageList")
	public void getVipMessageList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = service.getVipMessageList();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/editVipMessage")
	public void editVipMessage(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String content = request.getParameter("content");
			if (service.editVipMessage(id, content)) {
				out.print("0000");
				logService.addSyslog("修改收费会员的通知短信", "editVipMessage", "修改短信内容为："+content, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改收费会员的通知短信失败！");
				logService.addSyslog("修改收费会员的通知短信", "editVipMessage", "修改短信内容为："+content, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改收费会员的通知短信", "editVipMessage", "修改短信异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	@RequestMapping("/gethfMessageList")
	public void getLylotsList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html"); 
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, String> map=new HashMap<String, String>();
			map.put("mobile", request.getParameter("mobile"));
			map.put("ishuif", request.getParameter("ishuif"));
			map.put("currentPage", request.getParameter("page"));
			map.put("pageSize", request.getParameter("rows"));
			String result = service.gethfMessageList(map);
			System.out.println(result);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/addhfMessage")
	public void addhfMessage(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, String> map=new HashMap<String, String>();
			map.put("mobile",request.getParameter("name")); 
			map.put("content",request.getParameter("content"));
			map.put("createtime",request.getParameter("createtime"));
			map.put("ishuif",request.getParameter("ishuif"));	
			if(request.getParameter("id")!=""){
				map.put("id",request.getParameter("id"));
				if (service.editIshuif(map)){
					out.print("0000");
				} else {
					out.print("0001");
				}
			}else{
			if (service.addhfMessage(map)){
					out.print("0000");
				} else {
					out.print("0001");
			  }
			}
	 	 } catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		 }
		
	   }
	
    }
