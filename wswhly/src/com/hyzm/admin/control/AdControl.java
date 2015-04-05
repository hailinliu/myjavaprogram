package com.hyzm.admin.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyzm.admin.service.ad.AdService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;

@Controller
@RequestMapping("/ad")
public class AdControl {
	/*
	 * 广告
	 */
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private AdService service;
	
	@RequestMapping("/getAdImageList")
	public void getAdImageList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = service.getAdImageList();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploadAdImage")
	public void uploadAdImage(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "ad/";//获取文件绝对路径
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
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/gotoAddImage")
	public String gotoAddImage() {
		return "admin/ad/addAdImage";
	}
	
	@RequestMapping("/addAdImage")
	public void addAdImage(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String name = request.getParameter("name");
			String imgurl = request.getParameter("imgurl");
			String url = request.getParameter("url");
			if (service.addAdImage(name, imgurl, url)) {
				out.print("0000");
				logService.addSyslog("添加广告内容", "addAdImage", "添加“"+name+"”的广告内容", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加广告内容失败！");
				logService.addSyslog("添加广告内容", "addAdImage", "添加“"+name+"”的广告内容", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("添加广告内容", "addAdImage", "添加广告内容异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoEditImage")
	public String gotoEditImage(HttpServletRequest request) {
		try {
			int id = Integer.valueOf(request.getParameter("id"));
			request.setAttribute("adImage", service.getAdById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/ad/editAdImage";
	}
	
	@RequestMapping("/editAdImage")
	public void editAdImage(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "ad/";//获取文件绝对路径
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String image = "";
			int id = Integer.valueOf(request.getParameter("id"));
			String url = request.getParameter("url");
			int state = Integer.valueOf(request.getParameter("state"));
			String imgurl = request.getParameter("imgurl");
			Map<String, Object> map = service.getAdById(id);
			if (imgurl == null || "".equals(imgurl)) {
				image = map.get("imgname").toString();
			} else {
				image = imgurl;
				File file = new File(saveFilePath + map.get("imgname").toString());
				if (file.exists()) {
					file.delete();
				}
			}
			if (service.editAdImage(id, image, url, state)) {
				out.print("0000");
				logService.addSyslog("修改广告内容", "editAdImage", "修改“"+map.get("name")+"”的图片名为：“"+image+"”，图片链接为：“"+url+"”，状态为：“"+(state==1?"正常":"删除")+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改广告内容失败！");
				logService.addSyslog("修改广告内容", "editAdImage", "修改“"+map.get("name")+"”的图片名为：“"+image+"”，图片链接为：“"+url+"”，状态为：“"+(state==1?"正常":"删除")+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改广告内容", "editAdImage", "修改广告内容异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}

}
