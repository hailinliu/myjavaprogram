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

import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.ImageUtil;
import com.hyzm.admin.service.baibao.BaibaoCollectionService;

@Controller
@RequestMapping("/baibao")
public class BaibaoCollectionControl {
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private BaibaoCollectionService Service;
	@RequestMapping("/uploadBaibaourl")
	public void uploadCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String yyyyMMdd=DateUtil.getDateTime(new Date(), "yyyyMMdd");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "Baibaourl/"+yyyyMMdd+"/";//获取文件绝对路径
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
			fileDir.mkdirs();
		}
		String fileNameLong = file.getOriginalFilename();//获取上传的文件名称
		String extensionName = fileNameLong.substring(fileNameLong.lastIndexOf(".") + 1);//获取文件扩展名
		String filename = UUID.randomUUID().toString();//重命名文件
		if(request.getParameter("newfilename")!=null&&request.getParameter("newfilename")!=""){
			filename=request.getParameter("newfilename");
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
			FileOutputStream fileout = new FileOutputStream(saveFilePath + filename + "." + extensionName);
			fileout.write(file.getBytes());//写入文件
			fileout.close();
			ImageUtil.imageZip(saveFilePath, filename, extensionName, 156, 142);
			out.print(yyyyMMdd+"/"+filename + "." + extensionName);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	@RequestMapping("/getBaibaoCollectionList")
	public void getBaibaoCollectionList(HttpServletRequest request, HttpServletResponse response) {
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
			String baibaonum = request.getParameter("baibaonum");
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = Service.getBaibaoCollectionList(begindate, enddate, baibaonum==null?"":baibaonum, name==null?"":name, username==null?"":username, userid==null?"":userid, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotoeditBaibaoCollection")
	public String gotoeditBaibaoCollection(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("baibaocollection",Service.getBaibaoCollectionById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/baibao/editbaibaoCollection";
	}
	@RequestMapping("/editBaibaoCollection")
	public void editBaibaoCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String name = request.getParameter("name");
			String price = request.getParameter("price");		
			String advertisement = request.getParameter("advertisement");
			String imgurl = request.getParameter("imgurl");
			String isagree = request.getParameter("isagree");
			String note = request.getParameter("note");;
			if (price == null || "".equals(price)) {
				price = "0";
			}
			if (Service.updBaibaoCollection(id, name, imgurl, price, advertisement, Integer.parseInt(isagree), note)){
				out.print("0000");
				logService.addSyslog("修改藏品", "editBaibaoCollection", "修改藏品名为：《"+name+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改藏品", "editBaibaoCollection", "修改藏品名为：《"+name+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改藏品", "editBaibaoCollection", "修改藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/addBaibaoCollection")
	public void addBaibaoCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String price = request.getParameter("price");		
			String advertisement = request.getParameter("advertisement");
			String imgurl = request.getParameter("imgurl");
			String isagree = request.getParameter("isagree");
			String state = request.getParameter("state");
			String note = request.getParameter("note");;
			if (price == null || "".equals(price)) {
				price = "0";
			}
			if (Service.addBaibaoCollection(id, name, username, imgurl, price, advertisement, Integer.parseInt(isagree), Integer.parseInt(state), note)){
				out.print("0000");
				logService.addSyslog("添加藏品", "editBaibaoCollection", "添加藏品名为：《"+name+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("添加藏品", "editBaibaoCollection", "添加藏品名为：《"+name+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("添加藏品", "editBaibaoCollection", "添加藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delBaibaoCollection")
	public void delBaibaoCollection(HttpServletRequest request, HttpServletResponse response){
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String name = request.getParameter("name");
			if (Service.delBaibaoCollection(id)){
				out.print("0000");
				logService.addSyslog("删除藏品", "editBaibaoCollection", "删除藏品名为：《"+name+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("删除藏品", "editBaibaoCollection", "删除藏品名为：《"+name+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("删除藏品", "editBaibaoCollection", "删除藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}

	@RequestMapping("/getBaibaoTrabsferList")
	public void getBaibaoTrabsferList(HttpServletRequest request, HttpServletResponse response) {
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
			String shopname = request.getParameter("shopname");
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = Service.getBaibaoTrabsferList(begindate, enddate, shopname==null?"":shopname, name==null?"":name, username==null?"":username, userid==null?"":userid, state==null?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/editcollectionsate")
	public void editcollectionsate(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String state = request.getParameter("state");
			if (Service.editcollectionsate(id, Integer.parseInt(state))){
				out.print("0000");
				logService.addSyslog("修改交易", "editBaibaoCollection", "修改交易为：《"+state+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改交易", "editBaibaoCollection", "修改交易为：《"+state+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改藏品", "editBaibaoCollection", "修改藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/editsate")
	public void editBaibaoTrabsferstate(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String state = request.getParameter("state");
			String version = request.getParameter("version");
			if (Service.updBaibaoTrabsferstate(id, Integer.parseInt(state),version)){
				out.print("0000");
				logService.addSyslog("修改交易状态", "editBaibaoCollection", "修改交易状态为：《"+state+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改交易状态", "editBaibaoCollection", "修改交易状态为：《"+state+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改藏品", "editBaibaoCollection", "修改藏品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotoupdtrasfer")
	public String gotoeditbaibaoshop(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			String version = request.getParameter("version");
			request.setAttribute("baibaotransfer", Service.getBaibaoTrabsferById(id, version));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/baibao/editbaibaotransfer";
	}
	@RequestMapping("/updtrasfer")
	public void editBaibaoTrabsfer(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String starttime = request.getParameter("starttime");
			String paytime = request.getParameter("paytime");
			String txmjfhtime = request.getParameter("txmjfhtime");
			String dddqtime = request.getParameter("dddqtime");
			String deliverytime = request.getParameter("deliverytime");
			String wfhtime = request.getParameter("wfhtime");
			String kdgs = request.getParameter("kdgs");
			String syspaytime = request.getParameter("syspaytime");
			String applyreturntime = request.getParameter("applyreturntime");
			String thkdgs = request.getParameter("thkdgs");
			String thmjqrtime = request.getParameter("thmjqrtime");
			String dkdmftime = request.getParameter("dkdmftime");
			String couriernumber = request.getParameter("couriernumber");
			String consigneemobile = request.getParameter("consigneemobile");
			String consignee = request.getParameter("consignee");
			String consigneeaddress = request.getParameter("consigneeaddress");
			String thcouriernumber = request.getParameter("thcouriernumber");
			String thconsigneemobile = request.getParameter("thconsigneemobile");
			String thconsignee = request.getParameter("thconsignee");
			String thconsigneeaddress = request.getParameter("thconsigneeaddress");
			String version = request.getParameter("version");
			String state = request.getParameter("state");	
			if ( "".equals(state)) {
				state =null;
			}
		
			if ( "".equals(starttime)) {
				starttime =null;
			} 
			if ( "".equals(paytime)) {
				paytime =null;
			}
			if ( "".equals(txmjfhtime)) {
				txmjfhtime =null;
			}
			if ( "".equals(dddqtime)) {
				dddqtime =null;
			}
			if ( "".equals(deliverytime)) {
				deliverytime =null;
			}
			if ( "".equals(wfhtime)) {
				wfhtime =null;
			}		
			if ( "".equals(syspaytime)) {
				syspaytime =null;
			}
			if ( "".equals(applyreturntime)) {
				applyreturntime =null;
			}
			if ( "".equals(thmjqrtime)) {
				thmjqrtime =null;
			}
			if ( "".equals(dkdmftime)) {
				dkdmftime =null;
			}
			if (Service.updBaibaoTrabsfer(id,version,couriernumber,starttime, paytime, txmjfhtime, dddqtime, deliverytime, wfhtime, kdgs,syspaytime, applyreturntime, thkdgs, thmjqrtime, dkdmftime, consigneemobile, consignee, consigneeaddress, thcouriernumber, thconsigneemobile, thconsignee, thconsigneeaddress,Integer.parseInt(state))){
				out.print("0000");
				logService.addSyslog("修改交易", "editBaibaoCollection", "修改单号为：《"+couriernumber+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改交易", "editBaibaoCollection", "修改单号为：《"+couriernumber+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改交易", "editBaibaoCollection", "修改交易异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
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
			String baibaonum = request.getParameter("baibaonum");
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			int currentPage = 1;
			int pageSize = 99999;
			Map<String, Object> map=Service.exportCSV(begindate, enddate, baibaonum==null?"":baibaonum, name==null?"":name, username==null?"":username, userid==null?"":userid, state==null||"0".equals(state)?"":state, currentPage, pageSize);
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
				ws.addCell(new Label(0, 0, "华豫之门百宝藏品信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"百宝编号",wcf));
				ws.addCell(new Label(1,1,"藏品名称",wcf));
				ws.addCell(new Label(2,1,"类别",wcf));
				ws.addCell(new Label(3,1,"上传者",wcf));
				ws.addCell(new Label(4,1,"上传时间",wcf));
				ws.addCell(new Label(5,1,"广告",wcf));
				ws.addCell(new Label(6,1,"详细介绍",wcf));
				ws.addCell(new Label(7,1,"价格",wcf));
				ws.addCell(new Label(8,1,"是否同意中转",wcf));
				ws.addCell(new Label(9,1,"拍卖状态",wcf));
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("baibaoCollectionusList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("baibaonum").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("name").toString(),wcf));	
					ws.addCell(new Label(2,i,enMap.get("typename").toString(),wcf));	
					ws.addCell(new Label(3,i,enMap.get("username").toString(),wcf));	
					ws.addCell(new Label(4,i,enMap.get("uploaddate").toString(),wcf));	
					ws.addCell(new Label(5,i,enMap.get("advertisement").toString(),wcf));	
					ws.addCell(new Label(6,i,enMap.get("note").toString(),wcf));	
					ws.addCell(new Label(7,i,enMap.get("price").toString(),wcf));	
					if(enMap.get("isagree").toString().equals("1")){
						ws.addCell(new Label(8,i,"同意",wcf));
					}else if(enMap.get("isagree").toString().equals("2")){
						ws.addCell(new Label(8,i,"不同意",wcf));
					}
			
					if(enMap.get("state").toString().equals("1")){
						ws.addCell(new Label(9,i,"审核中",wcf));
					}else if(enMap.get("state").toString().equals("2")){
						ws.addCell(new Label(9,i,"待售中",wcf));
					}else if(enMap.get("state").toString().equals("3")){
					    ws.addCell(new Label(9,i,"交易中转",wcf));
					}else if(enMap.get("state").toString().equals("4")){
						ws.addCell(new Label(9,i,"已售罄",wcf));
					}else if(enMap.get("state").toString().equals("5")){
						ws.addCell(new Label(9,i,"下架",wcf));
					}else if(enMap.get("state").toString().equals("6")){
						ws.addCell(new Label(9,i,"已删除",wcf));
					}
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
