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

import com.hyzm.admin.service.baibao.BaibaoShopBaseInfoService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.ImageUtil;
import com.hyzm.util.StringUtil;
@Controller
@RequestMapping("/baibaoshopinfo")
public class BaibaoShopBaseInfoControl {

	@Autowired
	private SyslogService logService;
	
	@Autowired
	private  BaibaoShopBaseInfoService baibaoshopbaseinfoService;
	
	@RequestMapping("/getbaibaoshopbaseinfocombobox")
	public void getbaibaoshopBaseinfoCombobox(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = baibaoshopbaseinfoService.getBaibaoshopBaseinfoCombobox();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getbaibaoshopinfoList")
	public void getbaibaoshopinfoList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Date begindate = null;
			Date enddate = null;
			String shopname = request.getParameter("shopname");
			String username = request.getParameter("username");
			String mobile = request.getParameter("mobile");			
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = baibaoshopbaseinfoService.getBaibaoshopList(begindate, enddate, username==null?"":username, shopname==null?"":shopname,mobile==null?"":mobile, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/uploadbaibaoshop")
	public void uploadbaibaoshop(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "baibaoshop/";//获取文件绝对路径
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
	@RequestMapping("/gotoaddbaibaoshop")
	public String gotoAddCollection() {
		return "admin/baibao/addbaibaoshopinfo";
	}
	@RequestMapping("/addbaibaoshop")
	public void addbaibaoshop(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String shopname = request.getParameter("shopname");
			String manifesto = request.getParameter("manifesto");
			String username = request.getParameter("username");
			String weixinimg = request.getParameter("weixinimg");
			String mainscope = request.getParameter("mainscope");
			String mobile = request.getParameter("mobile");
			String weixin = request.getParameter("weixin");
			String shopaddress = request.getParameter("shopaddress");
			String img = request.getParameter("img");
			String desction = request.getParameter("desction");
			String state = request.getParameter("state");
			if (baibaoshopbaseinfoService.addBaibaoshopinfo(shopname, username, mainscope, manifesto, weixin, weixinimg, shopaddress, mobile, desction, img, state)) {
				out.print("0000");
				logService.addSyslog("添加商家", "addbaibaoshop", "商家名：《"+shopname+"》，商家简介："+mainscope ,"成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加商家失败！！！");
				logService.addSyslog("添加商家", "addbaibaoshop", "商家名：《"+shopname+"》，商家简介："+mainscope, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("添加商家", "addbaibaoshop", "添加商家异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/gotoeditbaibaoshop")
	public String gotoeditbaibaoshop(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("baibaoshop", baibaoshopbaseinfoService.getBaibaoshopinfoById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/baibao/editbaibaoshopinfo";
	}
	@RequestMapping("/editbaibaoshop")
	public void editbaibaoshop(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "baibaoshop/";//获取文件绝对路径
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
			fileDir.mkdirs();
		}
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			System.out.println(id);
			String shopname = request.getParameter("shopname");
			String manifesto = request.getParameter("manifesto");
			String weixinimg = request.getParameter("weixinimg");
			String mainscope = request.getParameter("mainscope");
			String mobile = request.getParameter("mobile");
			String weixin = request.getParameter("weixin");
			String shopaddress = request.getParameter("shopaddress");
			String img = request.getParameter("img");
			String desction = request.getParameter("desction");
			String state = request.getParameter("state");
			if (baibaoshopbaseinfoService.updBaibaoshopinfo(id, shopname, mainscope, manifesto, weixin, shopaddress, mobile, desction, img)){
				out.print("0000");
				logService.addSyslog("修改商家", "editbaibaoshop", "修改商家名为：《"+shopname+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改商家", "editbaibaoshop", "修改商家名为：《"+shopname+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改商家", "editbaibaoshop", "修改商家异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/delbaibaoshop")
	public void delbaibaoshop(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();//获得输出流
			Long delid = Long.valueOf(request.getParameter("delid"));
			Map<String, Object> map = baibaoshopbaseinfoService.getBaibaoshopinfoById(delid);
			if (baibaoshopbaseinfoService.delBaibaoshopinfo(delid)) {
				out.print("0000");
				logService.addSyslog("删除商家", "delbaibaoshop", "商家名：《"+map.get("name")+"》，藏品归属："+map.get("owner"), "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("删除商家", "delbaibaoshop", "商家名：《"+map.get("name")+"》，藏品归属："+map.get("owner"), "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("删除商家", "delbaibaoshop", "删除商家异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
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
				String startdate = request.getParameter("startdate");
				String enddate = request.getParameter("enddate");
				System.out.println(startdate);
				System.out.println(enddate);
				if (baibaoshopbaseinfoService.joinControl(id, state)) {
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

/*	导出EXCEL表格
	 * autor:haojk
	 
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		try {
			int currentPage = 1;
			int pageSize = 99999;
			String shopname = request.getParameter("shopname");
			String username = request.getParameter("username");
			String bdate = request.getParameter("startdate");
			String edate = request.getParameter("enddate");
			String state = request.getParameter("state");
			Date startdate = null;
			Date enddate = null;
			if(bdate == null || bdate.equals("")){
				startdate = DateUtil.getDateTime(DateUtil.getDate(-7)+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}else{
				startdate = DateUtil.getDateTime(bdate+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}
			if(edate == null || edate.equals("")){
				enddate = DateUtil.getDateTime(DateUtil.getDateTime(new Date(), "yyyy-MM-dd")+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}else{
				enddate = DateUtil.getDateTime(edate+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}
			Map<String, Object> map=baibaoshopbaseinfoService.exportCSV(startdate, enddate, username==null?"":username, shopname==null?"":shopname, state==null||"0".equals(state)?"":state, currentPage, pageSize);
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
				response.setHeader("Content-disposition", "attachment;filename=t_baibaoshop.xls");
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
				ws.addCell(new Label(0, 0, "旗舰商家信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"商家名称",wcf));
				ws.addCell(new Label(1,1,"商家logo",wcf));
				ws.addCell(new Label(2,1,"经营范围",wcf));
				ws.addCell(new Label(3,1,"公司导语",wcf));
				ws.addCell(new Label(4,1,"详细介绍",wcf));
				ws.addCell(new Label(5,1,"联系人",wcf));
				ws.addCell(new Label(6,1,"联系电话",wcf));
				ws.addCell(new Label(7,1,"QQ号",wcf));
				ws.addCell(new Label(8,1,"微信号",wcf));
				ws.addCell(new Label(9,1,"新浪微博",wcf));
				ws.addCell(new Label(10,1,"公司地址",wcf));
				ws.addCell(new Label(11,1,"地图",wcf));
				ws.addCell(new Label(12,1,"商务专员",wcf));
				ws.addCell(new Label(13,1,"开始合作时间",wcf));
				ws.addCell(new Label(14,1,"合作结束时间",wcf));
				ws.addCell(new Label(15,1,"合作状态",wcf));
				ws.addCell(new Label(1,1,"公司类型",wcf));
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("shoplist");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("name").toString(),wcf));					
					ws.addCell(new Label(1,i,enMap.get("logo").toString(),wcf));	
					System.out.println(enMap.get("logo").toString());
					ws.addCell(new Label(2,i,enMap.get("mainscope").toString(),wcf));
				    ws.addCell(new Label(3,i,enMap.get("daoyu").toString(),wcf));
				    System.out.println(enMap.get("daoyu").toString());
					ws.addCell(new Label(4,i,enMap.get("introduce").toString(),wcf));
					System.out.println(enMap.get("introduce").toString());
				    ws.addCell(new Label(5,i,enMap.get("contactname").toString(),wcf));
					ws.addCell(new Label(6,i,enMap.get("contacttel").toString(),wcf));
					ws.addCell(new Label(7,i,enMap.get("qq").toString(),wcf));
					ws.addCell(new Label(8,i,enMap.get("weixin").toString(),wcf));
					ws.addCell(new Label(9,i,enMap.get("sinlwblog").toString(),wcf));
					ws.addCell(new Label(10,i,enMap.get("addresss").toString(),wcf));
					ws.addCell(new Label(11,i,enMap.get("map").toString(),wcf));
					ws.addCell(new Label(12,i,enMap.get("commissioner").toString(),wcf));
					ws.addCell(new Label(13,i,enMap.get("startdate").toString(),wcf));
					ws.addCell(new Label(14,i,enMap.get("enddate").toString(),wcf));
					if(enMap.get("state").equals("1")){
					    ws.addCell(new Label(15,i,"合作中",wcf));
					}else if(enMap.get("state").equals("2")){
						ws.addCell(new Label(15,i,"合作暂停",wcf));
					}else if(enMap.get("state").equals("3")){
						ws.addCell(new Label(15,i,"合作结束",wcf));
					}
					if(enMap.get("style").equals("1")){
					  ws.addCell(new Label(16,i,"个人",wcf));
					}else if(enMap.get("style").equals("2")){
						ws.addCell(new Label(16,i,"公司",wcf));
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
	*/
}
