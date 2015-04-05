package com.hyzm.admin.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyzm.admin.service.collection.CollectionService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.ImageUtil;
import com.hyzm.util.StringUtil;

@Controller
@RequestMapping("/collection")
public class CollectionControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private CollectionService collectionService;
	
	@RequestMapping("/getcollectionlist")
	public void getCollectionList(HttpServletRequest request, HttpServletResponse response) {
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
			String userid = request.getParameter("userid");
			String owner = request.getParameter("owner");
			String username = request.getParameter("username");
			String iscollection = request.getParameter("iscollection");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = collectionService.getCollectionList(begindate, enddate, type==null?"":type,serialnum==null?"":serialnum,name==null?"":name,owner==null?"":owner,userid==null?"":userid, username==null?"":username, iscollection==null?"":iscollection, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploadCollection")
	public void uploadCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "collection/";//获取文件绝对路径
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
		}
	}
	
	@RequestMapping("/gotoaddcollection")
	public String gotoAddCollection() {
		return "admin/collection/addcollection";
	}
	
	@RequestMapping("/addcollection")
	public void addCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String type = request.getParameter("type");
			String name = request.getParameter("name");
			String owner = request.getParameter("owner");
			String source = request.getParameter("source");
			String note = request.getParameter("note");
			String imgurl = request.getParameter("imgurl");
			if (collectionService.addCollection(Integer.parseInt(type), name, StringUtil.getCollectionnum(), currentsession.getUserinfo().getId(), owner, source, note, imgurl)) {
				out.print("0000");
				logService.addSyslog("添加藏品", "addcollection", "藏品名：《"+name+"》，藏品归属："+owner+"，藏品来源："+source, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加藏品失败！！！");
				logService.addSyslog("添加藏品", "addcollection", "藏品名：《"+name+"》，藏品归属："+owner+"，藏品来源："+source, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("添加藏品", "addcollection", "添加藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/delcollection")
	public void delCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		//String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "collection/";//获取文件绝对路径
		PrintWriter out = null;
		try {
			out = response.getWriter();//获得输出流
			Long delid = Long.valueOf(request.getParameter("delid"));
			Map<String, Object> map = collectionService.getCollectionById(delid);
			if (collectionService.delCollection(delid)) {
				/*File delfile = new File(saveFilePath + map.get("imgurl"));
				File delsmalfile = new File(saveFilePath + "/small/" + map.get("imgurl"));
				if (delfile.exists()) {
					delfile.delete();
				}
				if (delsmalfile.exists()) {
					delsmalfile.delete();
				}*/
				out.print("0000");
				logService.addSyslog("删除藏品", "delcollection", "藏品名：《"+map.get("name")+"》，藏品归属："+map.get("owner"), "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("删除藏品", "delcollection", "藏品名：《"+map.get("name")+"》，藏品归属："+map.get("owner"), "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("删除藏品", "delcollection", "删除藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gotoeditcollection")
	public String gotoEditCollection(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("collection", collectionService.getCollectionById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/collection/editcollection";
	}
	
	@RequestMapping("/editcollection")
	public void updCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "collection/";//获取文件绝对路径
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
			fileDir.mkdirs();
		}
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String image = "";
			long id = Long.valueOf(request.getParameter("id"));
			String type = request.getParameter("type");
			String name = request.getParameter("name");
			String owner = request.getParameter("owner");
			String source = request.getParameter("source");
			String note = request.getParameter("note");
			String imgurl = request.getParameter("imgurl");
			Map<String, Object> map = collectionService.getCollectionById(id);
			if (imgurl == null || "".equals(imgurl)) {
				image = map.get("imgurl").toString();
			} else {
				image = imgurl;
				String[] images = map.get("imgurl").toString().split(",");
				File file = null;
				File filesmall = null;
				for (String str : images) {
					file = new File(saveFilePath + str);
					filesmall = new File(saveFilePath + "/small/" + str);
					if (file.exists()) {
						file.delete();
					}
					if (filesmall.exists()) {
						filesmall.delete();
					}
				}
			}
			if (collectionService.updCollection(id, Integer.parseInt(type), name, owner, source, note, image)) {
				out.print("0000");
				logService.addSyslog("修改藏品", "updatecollection", "修改藏品名为：《"+name+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改藏品", "updatecollection", "修改藏品名为：《"+name+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改藏品", "updatecollection", "修改藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/collectThing")
	public void collectThing(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Long id = Long.valueOf(request.getParameter("id"));
			Map<String, Object> map = collectionService.getCollectionById(id);
			if ("1".equals(map.get("iscollection").toString())) {
				if (collectionService.collectThing(id, 0)) {
					out.print("1111");
					logService.addSyslog("藏品取消收藏", "cancelCollection", "藏品《"+map.get("name")+"》被取消收藏", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				} else {
					out.print("取消收藏失败！！！");
					logService.addSyslog("藏品取消收藏", "cancelCollection", "藏品《"+map.get("name")+"》被取消收藏", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				}
			} else if ("0".equals(map.get("iscollection").toString())) {
				if (collectionService.collectThing(id, 1)) {
					out.print("0000");
					logService.addSyslog("藏品被收藏", "collecThing", "藏品《"+map.get("name")+"》被收藏", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				} else {
					out.print("收藏失败！！！");
					logService.addSyslog("藏品被收藏", "collecThing", "藏品《"+map.get("name")+"》被收藏", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				}
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("收藏/取消", "collecThing/cancelCollection", "藏品收藏/取消异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/collectionShowOrHide")
	public void collectionShowOrHide(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Long id = Long.valueOf(request.getParameter("id"));
			Map<String, Object> map = collectionService.getCollectionById(id);
			if ("1".equals(map.get("state").toString())) {
				if (collectionService.collectionShowOrHide(id, 2)) {
					out.print("1111");
					logService.addSyslog("隐藏藏品", "collectionHide", "藏品《"+map.get("name")+"》被隐藏：", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				} else {
					out.print("隐藏藏品失败！！！");
					logService.addSyslog("隐藏藏品", "collectionHide", "藏品《"+map.get("name")+"》被隐藏：", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				}
			} else if ("2".equals(map.get("state").toString())) {
				if (collectionService.collectionShowOrHide(id, 1)) {
					out.print("0000");
					logService.addSyslog("显示藏品", "collectionShow", "藏品《"+map.get("name")+"》取消隐藏：", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				} else {
					out.print("显示藏品失败！！！");
					logService.addSyslog("显示藏品", "collectionShow", "藏品《"+map.get("name")+"》取消隐藏：", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				}
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("显示/隐藏藏品", "collectionHideOrShow", "显示/隐藏藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/gettypelist")
	public void typeCombox(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = collectionService.getTypeList(currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/addtype")
	public void addType(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String typename = request.getParameter("typename").trim();
			if (collectionService.addType(typename)) {
				out.print("0000");
				logService.addSyslog("添加藏品类型", "addType", "添加藏品类型为：“"+typename+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加藏品类型异常！！！");
				logService.addSyslog("添加藏品类型", "addType", "添加藏品类型为：“"+typename+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("添加藏品类型", "addType", "添加藏品类型异常："+e.getMessage()+"", "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/deltype")
	public void delType(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.parseLong(request.getParameter("id").trim());
			if (collectionService.delType(id)) {
				out.print("0000");
				logService.addSyslog("删除藏品类型", "delType", "删除藏品类型，对应序列号为："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除藏品类型异常！！！");
				logService.addSyslog("删除藏品类型", "delType", "删除藏品类型，对应序列号为："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("删除藏品类型", "delType", "删除藏品类型异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updtype")
	public void updType(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.parseLong(request.getParameter("id").trim());
			String typename = request.getParameter("typename").trim();
			if (collectionService.updType(id, typename)) {
				out.print("0000");
				logService.addSyslog("修改藏品类型", "updType", "修改藏品类型：“"+typename+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改藏品类型异常！！！");
				logService.addSyslog("修改藏品类型", "updType", "修改藏品类型：“"+typename+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("修改藏品类型", "updType", "修改藏品类型异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/autoname")
	public void autoName(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = collectionService.autoName();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/autoserialnum")
	public void autoserialnum(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = collectionService.autoserialnum();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/autoowner")
	public void autoOwner(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = collectionService.autoOwner();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/typecombox")
	public void getTypeCombobox(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = collectionService.getTypeCombobox();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/autoUsername")
	public void autoUsername(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = collectionService.autoUsername();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	/**
	   * 合作审批
	   */
		@RequestMapping("/joinControl")
			public void joinControl(HttpServletRequest request, HttpServletResponse response) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");
			PrintWriter out = null;// 获得输出对象
			CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
			try {
				out = response.getWriter();
				long id = Long.valueOf(request.getParameter("id"));
				int state = Integer.valueOf(request.getParameter("state"));
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
				Date  begintime = sdf.parse(request.getParameter("jbegintime"));
				Date endtime = sdf.parse(request.getParameter("jendtime"));
				if (collectionService.joinControl(id, state,begintime,endtime)) {
					if(state==1){
						 out.print("0000");
						 logService.addSyslog("合作审批", "levelControl", "修改用户id为“"+id+"”，修改等级为"+state, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
						}
					 if(state==2){
						 out.print("1111");
						 logService.addSyslog("取消合作审批", "levelControl", "修改用户id为“"+id+"”，修改等级为"+state, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
					 }
				} else {
					out.print("合作审批失败！");
					logService.addSyslog("合作审批", "levelControl", "修改用户id为“"+id+"”，修改等级为"+state, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				}
			} catch (Exception e) {
				e.printStackTrace();
				logService.addSyslog("合作审批", "levelControl", "合作审批异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				out.print("程序异常！");
			}
		}

}
