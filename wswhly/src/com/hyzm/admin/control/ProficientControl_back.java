//package com.hyzm.admin.control;
//
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.PrintWriter;
//import java.util.Map;
//import java.util.UUID;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//
//import com.hyzm.Constans;
//import com.hyzm.admin.service.proficient.ProficientService;
//import com.hyzm.bean.CurrentSession;
//import com.hyzm.syslog.service.SyslogService;
//import com.hyzm.util.ImageUtil;
//import com.hyzm.util.StringUtil;
//
//@RequestMapping("/proficient")
//public class ProficientControl_back {
//	
//	@Autowired
//	private SyslogService logService;
//	
//	@Autowired
//	private ProficientService proService;
//	
//	@RequestMapping("/getproficientlist")
//	public void getProficientList(HttpServletRequest request, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
//		PrintWriter out = null;
//		try {
//			out = response.getWriter();
//			String name = request.getParameter("name");
//			String speciality = request.getParameter("speciality");
//			String appellation = request.getParameter("appellation");
//			String state = request.getParameter("state");
//			int currentPage = Integer.valueOf(request.getParameter("page").trim());
//			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
//			String result = proService.getProficientList(name==null?"":name, speciality==null?"":speciality, appellation==null?"":appellation, state==null||"0".equals(state)?"":state, currentPage, pageSize);
//			out.print(result);
//		} catch (Exception e) {
//			out.print("程序异常");
//			e.printStackTrace();
//		}
//	}
//	
//	@RequestMapping("/gotoaddproficient")
//	public String gotoAddProficient() {
//		return "admin/proficient/addproficient";
//	}
//	
//	@RequestMapping("/gotoeditproficient")
//	public String gotoEditProficient(HttpServletRequest request) {
//		try {
//			long id = Long.valueOf(request.getParameter("id"));
//			request.setAttribute("pro", proService.getProficientById(id));
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "admin/proficient/editproficient";
//	}
//	
//	@RequestMapping("/addproficient")
//	public void addProficient(HttpServletRequest request, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
//		MultipartFile file = multipartRequest.getFile("imgurl");
//		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "proficient/";//获取文件绝对路径
//		File fileDir = new File(saveFilePath);
//		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
//			fileDir.mkdirs();
//		}
//		String fileNameLong = file.getOriginalFilename();//获取上传的文件名称
//		String extensionName = fileNameLong.substring(fileNameLong.lastIndexOf(".") + 1);//获取文件扩展名
//		String filename = UUID.randomUUID().toString();//重命名文件
//		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
//		PrintWriter out = null;
//		try {
//			out = response.getWriter();
//			if (!StringUtil.contains(Constans.imgArray, extensionName)) {
//				out.print("请上传图片（支持jpg，png，bmp，gif）");
//				return;
//			}
//			FileOutputStream fileout = new FileOutputStream(saveFilePath + filename + "." + extensionName);
//			fileout.write(file.getBytes());//写入文件
//			fileout.close();
//			String name = request.getParameter("name");
//			String speciality = request.getParameter("speciality");
//			String appellation = request.getParameter("appellation");
//			String note = request.getParameter("note");
//			if (proService.addProficient(name, filename + "." + extensionName, speciality, appellation, note)) {
//				ImageUtil.imageZip(saveFilePath, filename, extensionName, 150, 187);
//				out.print("0000");
//				logService.addSyslog("添加专家信息", "addProficient", "添加专家信息，专家名称为：“"+name+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			} else {
//				out.print("添加专家信息失败！！！");
//				logService.addSyslog("添加专家信息", "addProficient", "添加专家信息，专家名称为：“"+name+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			}
//		} catch (Exception e) {
//			out.print("程序异常");
//			logService.addSyslog("添加专家信息", "addProficient", "添加专家信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			e.printStackTrace();
//		}
//	}
//	
//	@RequestMapping("/delproficient")
//	public void delProficient(HttpServletRequest request, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
//		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
//		//String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "proficient/";//获取文件绝对路径
//		PrintWriter out = null;
//		try {
//			out = response.getWriter();//获得输出流
//			long delid = Long.valueOf(request.getParameter("delid"));
//			Map<String, Object> map = proService.getProficientById(delid);
//			if (proService.delProficient(delid)) {
//				/*File delfile = new File(saveFilePath + map.get("imgurl"));
//				File delsmalfile = new File(saveFilePath + "/small/" + map.get("imgurl"));
//				if (delfile.exists()) {
//					delfile.delete();
//				}
//				if (delsmalfile.exists()) {
//					delsmalfile.delete();
//				}*/
//				out.print("0000");
//				logService.addSyslog("删除专家信息", "delProficient", "删除专家信息，专家名称为：“"+map.get("name")+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			} else {
//				out.print("删除专家信息失败！！！");
//				logService.addSyslog("删除专家信息", "delProficient", "删除专家信息，专家名称为：“"+map.get("name")+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			}
//		} catch (Exception e) {
//			out.print("程序异常");
//			logService.addSyslog("删除专家信息", "delProficient", "删除专家信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			e.printStackTrace();
//		}
//	}
//	
//	@RequestMapping("/editproficient")
//	public void updProficient(HttpServletRequest request, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
//		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
//		MultipartFile file = multipartRequest.getFile("imgurl");
//		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "proficient/";//获取文件绝对路径
//		File fileDir = new File(saveFilePath);
//		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
//			fileDir.mkdirs();
//		}
//		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
//		String editimg = "";
//		PrintWriter out = null;
//		try {
//			out = response.getWriter();
//			String editimgurl = request.getParameter("editimgurl");
//			String fileNameLong = file.getOriginalFilename();
//			if (fileNameLong == null || "".equals(fileNameLong)) {
//				editimg = editimgurl;
//			} else {
//				String extensionName = fileNameLong.substring(fileNameLong.lastIndexOf(".") + 1);//获取文件扩展名
//				if (!StringUtil.contains(Constans.imgArray, extensionName)) {
//					out.print("请上传图片（支持jpg，png，bmp，gif）");
//					return;
//				}
//				String filename = UUID.randomUUID().toString();//重命名文件
//				File delsmalfile = new File(saveFilePath + "/small/" + editimgurl);
//				File editfile = new File(saveFilePath + editimgurl);
//				if (editfile.exists()) {
//					editfile.delete();
//				}
//				if (delsmalfile.exists()) {
//					delsmalfile.delete();
//				}
//				editimg = filename + "." +extensionName;
//				FileOutputStream fileout = new FileOutputStream(saveFilePath + editimg);
//				fileout.write(file.getBytes());//写入文件
//				fileout.close();
//				ImageUtil.imageZip(saveFilePath, filename, extensionName, 150, 187);
//			}
//			long id = Long.valueOf(request.getParameter("id"));
//			String name = request.getParameter("name");
//			String speciality = request.getParameter("speciality");
//			String appellation = request.getParameter("appellation");
//			String note = request.getParameter("note");
//			if (proService.updProficient(id, name, editimg, speciality, appellation, note)) {
//				out.print("0000");
//				logService.addSyslog("修改专家信息", "updProficient", "修改专家信息，专家名称为：“"+name+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			} else {
//				out.print("修改专家信息失败！！！");
//				logService.addSyslog("修改专家信息", "updProficient", "修改专家信息，专家名称为：“"+name+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			}
//		} catch (Exception e) {
//			out.print("程序异常");
//			logService.addSyslog("修改专家信息", "updProficient", "修改专家信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
//			e.printStackTrace();
//		}
//	}
//	
//	@RequestMapping("/autoname")
//	public void autoName(HttpServletRequest request, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
//		PrintWriter out = null;
//		try {
//			out = response.getWriter();
//			String result = proService.autoName();
//			out.print(result);
//		} catch (Exception e) {
//			out.print("程序异常");
//			e.printStackTrace();
//		}
//	}
//	
//	@RequestMapping("/autoappellation")
//	public void autoAppellation(HttpServletRequest request, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
//		PrintWriter out = null;
//		try {
//			out = response.getWriter();
//			String result = proService.autoAppellation();
//			out.print(result);
//		} catch (Exception e) {
//			out.print("程序异常");
//			e.printStackTrace();
//		}
//	}
//	
//	@RequestMapping("/autospeciality")
//	public void autoSpeciality(HttpServletRequest request, HttpServletResponse response) {
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("text/html");
//		PrintWriter out = null;
//		try {
//			out = response.getWriter();
//			String result = proService.autoSpeciality();
//			out.print(result);
//		} catch (Exception e) {
//			out.print("程序异常");
//			e.printStackTrace();
//		}
//	}
//
//}
