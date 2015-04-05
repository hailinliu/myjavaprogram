package com.hyzm.admin.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyzm.admin.service.vote.VoteService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.ImageUtil;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/vote")
public class VoteControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private VoteService voteService;

	//我要上华豫图片上传
	@RequestMapping("/uploadVote")
	public void uploadVote(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "voteactivity/";//获取文件绝对路径
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
			
			ImageUtil.imageZip(saveFilePath, filename, extensionName, 156, 142);
			out.print(filename + "." + extensionName);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}finally{
			out.close();
		}
	}
	
	//藏品征集令图片上传
	@RequestMapping("/uploadCollectVote")
	public void uploadCollectVote(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "votecollect/";//获取文件绝对路径
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
			
			ImageUtil.imageZip(saveFilePath, filename, extensionName, 156, 142);
			out.print(filename + "." + extensionName);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}finally{
			out.close();
		}
	}
	
	//会员藏品区图片上传
	@RequestMapping("/uploadVipVote")
	public void uploadVipVote(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "votevip/";//获取文件绝对路径
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
			
			ImageUtil.imageZip(saveFilePath, filename, extensionName, 156, 142);
			out.print(filename + "." + extensionName);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}finally{
			out.close();
		}
	}

	//我要上华豫列表
	@RequestMapping("/getVoteActivityList")
	public void getVoteActivityList(HttpServletRequest request, HttpServletResponse response) {
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
			String type = request.getParameter("type");
			String serialnum = request.getParameter("serialnum");
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String userid = request.getParameter("userid");
			String issue = request.getParameter("issue");
			String issuetype = request.getParameter("issuetype");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = voteService.getVoteCollectionList(begindate, enddate, type==null||"0".equals(type)?"":type,serialnum==null?"":serialnum, name==null?"":name, username==null?"":username, userid==null?"":userid, issue==null?"":issue, issuetype, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	//藏品征集令列表
	@RequestMapping("/getVoteCollectionList")
	public void getVoteCollectionList(HttpServletRequest request, HttpServletResponse response) {
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
			String type = request.getParameter("type");
			String serialnum = request.getParameter("serialnum");
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String userid = request.getParameter("userid");
			String issue = request.getParameter("issue");
			String issuetype = request.getParameter("issuetype");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = voteService.getVoteCollectionList(begindate, enddate, type==null||"0".equals(type)?"":type,serialnum==null?"":serialnum, name==null?"":name, username==null?"":username, userid==null?"":userid,issue==null?"":issue, issuetype, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	//会员藏品区列表
	@RequestMapping("/getVoteVipList")
	public void getVoteVipList(HttpServletRequest request, HttpServletResponse response) {
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
			String type = request.getParameter("type");
			String serialnum = request.getParameter("serialnum");
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String userid = request.getParameter("userid");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
         	String result = voteService.getVipCollectionList(begindate, enddate, type==null||"0".equals(type)?"":type,serialnum==null?"":serialnum, name==null?"":name,username==null?"":username, userid==null?"":userid, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			System.out.println(result);
         	out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/gotoAddVoteCollection")
	public String gotoAddVoteCollection(HttpServletRequest request) {
		request.setAttribute("type", request.getParameter("type"));
		request.setAttribute("issue", request.getParameter("issue"));
		return "admin/vote/addvotecollection";
	}
	
	@RequestMapping("/addVoteCollection")
	public void addVoteCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			int type = Integer.valueOf(request.getParameter("type"));
			String name = request.getParameter("name");
			String note = request.getParameter("note");
			String imgurl = request.getParameter("imgurl");
			String issue = request.getParameter("issue");
			if (voteService.addVoteCollection(type, name, StringUtil.getActivityCollectionNum("ac"), currentsession.getUserinfo().getId(), note, imgurl, issue==null?"0":issue)) {
				out.print("0000");
				logService.addSyslog("添加活动藏品", "addVoteCollection", "藏品名："+name, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加藏品信息失败！");
				logService.addSyslog("添加活动藏品", "addVoteCollection", "藏品名："+name, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("添加活动藏品", "addVoteCollection", "添加活动藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/delVoteCollection")
	public void delVoteCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int state = Integer.valueOf(request.getParameter("state"));
			if (voteService.delVoteCollection(id, state)) {
				out.print("0000");
				logService.addSyslog("删除活动藏品", "delVoteCollection", "藏品序列号："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除藏品信息失败！");
				logService.addSyslog("删除活动藏品", "delVoteCollection", "藏品序列号："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("删除活动藏品", "delVoteCollection", "删除活动藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/gotoUpdVoteCollection")
	public String gotoUpdVoteCollection(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("collection", voteService.getCollectionById(id));
			request.setAttribute("type", request.getParameter("type"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/vote/editvotecollection";
	}
	
	@RequestMapping("/updVoteCollection")
	public void updVoteCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int type = Integer.valueOf(request.getParameter("type"));
			String name = request.getParameter("name");
			String note = request.getParameter("note");
			String imgurl = request.getParameter("imgurl");
			String issue = request.getParameter("issue");
			if (voteService.updVoteCollection(id, type, name, note, imgurl, issue==null?"0":issue)) {
				out.print("0000");
				logService.addSyslog("修改活动藏品", "updVoteCollection", "藏品名："+name, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改藏品信息失败！");
				logService.addSyslog("修改活动藏品", "updVoteCollection", "藏品名："+name, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改活动藏品", "updVoteCollection", "修改活动藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	//活动列表
	@RequestMapping("/getActivityBmList")
	public void getActivityBmList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String cycle = request.getParameter("cycle");
			String title = request.getParameter("title");
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
			String type = request.getParameter("type");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page"));
			int pageSize = Integer.valueOf(request.getParameter("rows"));
			String result = voteService.getActivityBmList(cycle==null?"":cycle, title==null?"":title, begindate, enddate, type==null||"0".equals(type)?"":type, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	//添加活动
	@RequestMapping("/addActivityBm")
	public void addBm(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
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
			int type = Integer.valueOf(request.getParameter("type"));
			if (voteService.addBm(cycle, title, content, begindate, enddate, type)) {
				out.print("0000");
				logService.addSyslog("修改活动", "addActivityBm", "活动名："+title, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加活动报名失败！");
				logService.addSyslog("修改活动", "addActivityBm", "活动名："+title, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改活动", "addActivityBm", "添加活动异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	//删除活动
	@RequestMapping("/delActivityBm")
	public void delBm(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int state = Integer.valueOf(request.getParameter("state"));
			if (voteService.delBm(id, state)) {
				out.print("0000");
				logService.addSyslog("删除活动", "delActivityBm", "活动序列号："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("操作失败！");
				logService.addSyslog("删除活动", "delActivityBm", "活动序列号："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("删除活动", "delActivityBm", "删除活动异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	//修改活动
	@RequestMapping("/updActivityBm")
	public void updBm(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
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
			if (voteService.updBm(id, cycle, title, content, begindate, enddate)) {
				out.print("0000");
				logService.addSyslog("修改活动", "updActivityBm", "活动名称："+title, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改活动报名失败！");
				logService.addSyslog("修改活动", "updActivityBm", "活动名称："+title, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改活动", "updActivityBm", "修改活动异常：："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
}
