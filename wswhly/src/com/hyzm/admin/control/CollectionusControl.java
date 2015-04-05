package com.hyzm.admin.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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

import com.hyzm.admin.service.collectionus.CollectionusService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.ImageUtil;
import com.hyzm.util.StringUtil;

@Controller("/collectionus")
@RequestMapping("/collectionus")
public class CollectionusControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private CollectionusService collectionService;
	
	@RequestMapping("/getcollectionuslist")
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
			String style = request.getParameter("style");
			String name = request.getParameter("name");
			String serialnum = request.getParameter("serialnum");
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			String pricearea=request.getParameter("pricearea");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = collectionService.getCollectionList(begindate, enddate, type==null||"0".equals(type)?"":type, style==null||"0".equals(style)?"":style, name==null?"":name, serialnum==null?"":serialnum, username==null?"":username, state==null||"0".equals(state)?"":state, pricearea==null||"-1".equals(pricearea)?"":pricearea, currentPage, pageSize);
			System.out.println(result);
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
		return "admin/collectionus/addcollection";
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
			String style = request.getParameter("style");
			String name = request.getParameter("name");
			String note = request.getParameter("note");
			String imgurl = request.getParameter("imgurl");
			String tvnum = request.getParameter("tvnum");
			String imgurltitle = request.getParameter("imgurltitle");
			if (collectionService.addCollection(Integer.parseInt(type), Integer.parseInt(style), name, StringUtil.getCollectionnum(), currentsession.getUserinfo().getId(), note, imgurl,imgurltitle, tvnum)) {
				out.print("0000");
				logService.addSyslog("添加藏品", "addcollection", "藏品名：《"+name+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加藏品失败！！！");
				logService.addSyslog("添加藏品", "addcollection", "藏品名：《"+name+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("添加藏品", "addcollection", "添加藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	@RequestMapping("/priceareaControl")
	public void priceareaControl(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			
			Long id = Long.valueOf(request.getParameter("priceareaid"));
			int pricearea = Integer.valueOf(request.getParameter("pricearea").toString());
			System.out.println("********************"+id+"**************"+pricearea);
			Map<String, Object> map = collectionService.getCollectionById(id);
			
			if (collectionService.priceareaControl(id,pricearea)) {
				out.print("0000");
				logService.addSyslog("修改价格区间", "updatecollection", "修改价格区间藏品名为：《"+map.get("name")+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改价格区间", "updatecollection", "修改价格区间藏品名为：《"+map.get("name")+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改价格区间", "addcollection", "修改价格区间藏品名为："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	@RequestMapping("/pointpriceControl")
	public void pointpriceControl(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			
			Long id = Long.valueOf(request.getParameter("pointpriceid"));
			String  pricearea = request.getParameter("pointprice").toString();
			System.out.println("********************"+id+"**************"+pricearea);
			Map<String, Object> map = collectionService.getCollectionById(id);
			
			if (collectionService.pointpriceControl(id,pricearea)) {
				out.print("0000");
				logService.addSyslog("修改具体价格", "updatecollection", "修改具体价格藏品名为：《"+map.get("name")+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改具体价格", "updatecollection", "修改具体价格藏品名为：《"+map.get("name")+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改具体价格", "addcollection", "修改具体价格藏品名为："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
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
		return "admin/collectionus/editcollection";
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
			long id = Long.valueOf(request.getParameter("id"));
			String type = request.getParameter("type");
			String style = request.getParameter("style");
			String name = request.getParameter("name");
			String note = request.getParameter("note");
			String imgurl = request.getParameter("imgurl");
			String tvnum = request.getParameter("tvnum");
			String imgurltitle = request.getParameter("imgurltitle");
			if (collectionService.updCollection(id, Integer.parseInt(type), Integer.parseInt(style), name, note, imgurl,imgurltitle, tvnum)) {
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

	@RequestMapping("/stylecombox")
	public void getStyleCombobox(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int typeid = Integer.valueOf(request.getParameter("typeid"));
			String result = collectionService.getStyleCombobox(typeid);
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
	 * 导出
	 * @param request
	 * @param response
	 */
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response){
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
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
			String style = request.getParameter("style");
			String name = request.getParameter("name");
			String serialnum = request.getParameter("serialnum");
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			String pricearea=request.getParameter("pricearea");
			int currentPage = 1;
			int pageSize = 99999;
			Map<String, Object> map=collectionService.exportCSV(begindate, enddate, type==null||"0".equals(type)?"":type, style==null||"0".equals(style)?"":style, name==null?"":name, serialnum==null?"":serialnum, username==null?"":username, state==null||"0".equals(state)?"":state, pricearea==null||"-1".equals(pricearea)?"":pricearea, currentPage, pageSize);
			
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
				response.setHeader("Content-disposition", "attachment;filename=t_member.xls");
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
				ws.addCell(new Label(0, 0, "华豫之门会员信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"类型",wcf));
				ws.addCell(new Label(1,1,"名称",wcf));
				ws.addCell(new Label(2,1,"编号",wcf));
				ws.addCell(new Label(3,1,"推荐者",wcf));
				ws.addCell(new Label(4,1,"节目期号",wcf));
				ws.addCell(new Label(5,1,"上传日期",wcf));
				ws.addCell(new Label(6,1,"最后编辑时间",wcf));
				ws.addCell(new Label(7,1,"藏品简介",wcf));
				ws.addCell(new Label(8,1,"状态",wcf));
				ws.addCell(new Label(9,1,"价格区间",wcf));
				ws.addCell(new Label(10,1,"具体价格",wcf));
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("CollectionusList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("typename").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("name").toString(),wcf));	
					ws.addCell(new Label(2,i,enMap.get("serialnum").toString(),wcf));	
					ws.addCell(new Label(3,i,enMap.get("username").toString(),wcf));	
					ws.addCell(new Label(4,i,enMap.get("tvnum").toString(),wcf));	
					ws.addCell(new Label(5,i,enMap.get("uploaddate").toString(),wcf));	
					ws.addCell(new Label(6,i,enMap.get("lastmodifydate").toString(),wcf));
					ws.addCell(new Label(7,i,enMap.get("note").toString(),wcf));						
					if(enMap.get("state").toString().equals("1")){
						ws.addCell(new Label(8,i,"正常",wcf));
					}else if(enMap.get("state").toString().equals("2")){
						ws.addCell(new Label(8,i,"隐藏",wcf));
					}else if(enMap.get("state").toString().equals("3")){
					    ws.addCell(new Label(8,i,"删除",wcf));
					}
			
					if(enMap.get("pricearea").toString().equals("0")){
						ws.addCell(new Label(9,i,"5万以内",wcf));
					}else if(enMap.get("pricearea").toString().equals("1")){
						ws.addCell(new Label(9,i,"5万至10万",wcf));
					}else if(enMap.get("pricearea").toString().equals("2")){
					    ws.addCell(new Label(9,i,"10万至20万",wcf));
					}else if(enMap.get("pricearea").toString().equals("3")){
						ws.addCell(new Label(9,i,"20万至50万",wcf));
					}else if(enMap.get("pricearea").toString().equals("4")){
						ws.addCell(new Label(9,i,"50万至100万",wcf));
					}else if(enMap.get("pricearea").toString().equals("5")){
						ws.addCell(new Label(9,i,"100万以上",wcf));
					}
					 ws.addCell(new Label(10,i,enMap.get("pointprice").toString(),wcf));
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
