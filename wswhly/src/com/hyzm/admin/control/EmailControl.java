package com.hyzm.admin.control;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyzm.admin.service.email.EmailService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.SendMail;

@Controller
@RequestMapping("/email")
public class EmailControl {
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private EmailService service;
	
	@RequestMapping("/getemailList")
	public void getMessageList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String mailaddress = request.getParameter("mailaddress");
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
			String result = service.getEmailList(mailaddress==null?"":mailaddress, begindate, enddate, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploademail")
	public void uploadMobile(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "email/";//获取文件绝对路径
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
	
	@RequestMapping("/gotoaddemail")
	public String gotoAddMessage() {
		return "admin/emali/addemail";
	}
	
	@RequestMapping("/sendEmail")
	public void sendMessage(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "email/";//获取文件绝对路径
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		BufferedReader reader = null;
		String tempString = null;
		String mailaddress = "";
		try {
			out = response.getWriter();
			String filename = request.getParameter("eamil");
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			List<File> filelist=new ArrayList<File>();
			File readfile=new File(saveFilePath + filename);
			if(readfile.exists()&&readfile.isFile()){			
				reader = new BufferedReader(new FileReader(readfile));		
				int line =1;
				while ((tempString = reader.readLine()) != null) {
					mailaddress += tempString;
		            line ++ ;
		        }
				reader.close();
				  filelist.add(readfile);
				if (!"".equals(mailaddress)) {
					String[] emails = mailaddress.split(",");
					for (String str : emails) {
						boolean flag= SendMail.doSendHtmlEmail(subject, content, str, null);	
						int state=0;
						if(flag){
			        		System.out.println(str+":成功！");
			        	}else{
			        		System.out.println(str+":失败！");
			        		state=1;
			        	}
						addMessage(str,content,String.valueOf(state),subject,"",currentsession.getUserinfo().getUsername(), request.getRemoteAddr());
					}
					out.print("0000");
				} else {
					out.print("邮件发送失败");
				}
			}
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}

	public boolean addMessage(String mailaddress, String content, String state,
			String subject, String files,String username,String ip) {
		try {
			if (service.addEmailSend(mailaddress, content, state, subject, files) > 0) {
				logService.addSyslog("后台发送邮件", "sendMessage", "为邮箱地址为“"+mailaddress+"”的用户发送邮件："+content, "成功", username, ip, 2);
				return true;
			} else {
				logService.addSyslog("后台发送邮件", "sendMessage", "为邮箱地址为“"+mailaddress+"”的用户发送邮件："+content, "失败", username, ip, 2);
				return false;
			}
		} catch (Exception e) {
			logService.addSyslog("后台发送邮件", "sendMessage", "发送邮件异常："+e.getMessage(), "异常", username, ip, 2);
			e.printStackTrace();
		}
		return false;
	}
	
	
}
