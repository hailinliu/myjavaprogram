package com.hyzm.admin.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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

import com.hyzm.admin.service.video.VideoService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;

@Controller
@RequestMapping("/video")
public class VideoControl {

	@Autowired
	private SyslogService logService;

	@Autowired
	private VideoService videoService;
	
	@RequestMapping("/getvideolist")
	public void getVideoList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String title = request.getParameter("title");
			String proficient = request.getParameter("proficient");
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
			String videotype=request.getParameter("videotype");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = videoService.getVideoList(title==null?"":title, proficient==null?"":proficient, begindate, enddate, state==null||"0".equals(state)?"":state, videotype==null?"":videotype, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}

	@RequestMapping("/uploadvideo")
	public void uploadVideo(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "video/";//获取文件绝对路径
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
			/*if (!StringUtil.contains(Constans.imgArray, extensionName)) {
				out.print("请上传Flash视频（支持swf格式）");
				return;
			}*/
			FileOutputStream fileout = new FileOutputStream(saveFilePath + filename + "." + extensionName);
			fileout.write(file.getBytes());//写入文件
			fileout.close();
			String videoname = saveFilePath + filename + ".flv";
			String videoimg = saveFilePath + filename + ".jpg";
			String command = "ffmpeg -i " + videoname + " -y -f image2 -ss 00:00:10 -t 00:00:01 -s 236*216 " + videoimg;
			try {
				Runtime.getRuntime().exec(command);
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.print(filename);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoaddvideo")
	public String gotoAddVideo() {
		return "admin/video/addvideo";
	}
	
	@RequestMapping("/addvideo")
	public void addVideo(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String title = request.getParameter("title");
			String videoname = request.getParameter("videoname");
			String proficient = request.getParameter("proficient");
			String note = request.getParameter("note");
			String videotype=request.getParameter("videotype");
			if (videoService.addVideo(title, videoname, videoname.substring(0,videoname.lastIndexOf("."))+".flv", proficient, note,videotype)) {
				out.print("0000");
				logService.addSyslog("添加视频", "addVideo", "视频名称：《"+title+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加视频失败！！！");
				logService.addSyslog("添加视频", "addVideo", "视频名称：《"+title+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("添加视频", "addVideo", "添加视频异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delvideo")
	public void delVideo(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (videoService.delVideo(id)) {
				out.print("0000");
				logService.addSyslog("删除视频", "delVideo", "删除序列号为："+id+"的视频", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除视频失败！！！");
				logService.addSyslog("删除视频", "delVideo", "删除序列号为："+id+"的视频", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除视频", "delVideo", "删除视频异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
		}
	}
	
	@RequestMapping("/gotoeditvideo")
	public String gotoEditVideo(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("video", videoService.getVideoById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/video/editvideo";
	}
	
	@RequestMapping("/editvideo")
	public void editVideo(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "video/";//获取文件绝对路径
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
			fileDir.mkdirs();
		}
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String title = request.getParameter("title");
			String videoname = request.getParameter("videoname");
			String proficient = request.getParameter("proficient");
			String note = request.getParameter("note");
			String videotype=request.getParameter("videotype");
			if (videoService.updVideo(id, title, videoname, videoname.substring(0,videoname.lastIndexOf("."))+".flv", proficient, note,videotype)) {
				out.print("0000");
				logService.addSyslog("修改视频", "updVideo", "视频名称：《"+title+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改视频失败！！！");
				logService.addSyslog("修改视频", "updVideo", "视频名称：《"+title+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改视频", "updVideo", "修改视频异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/autotitle")
	public void autoTitle(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = videoService.autoTitle();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/autoproficient")
	public void autoProficient(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = videoService.autoProficient();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}

}
