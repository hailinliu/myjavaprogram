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

import com.hyzm.admin.service.business.BusinessService;
import com.hyzm.admin.service.sys.SysService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.ImageUtil;

@Controller
@RequestMapping("/business")
public class BusinessControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private BusinessService busiService;
	
	@Autowired
	private SysService server;
	
	@RequestMapping("/uploadOffLine")
	public void payOffLine(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "offline/";//获取文件绝对路径
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
			ImageUtil.imageZip(saveFilePath, filename, extensionName, 40, 40);
			out.print(filename + "." + extensionName);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	
	@RequestMapping("/getOffLinePayList")
	public void getOffLinePayList(HttpServletRequest request, HttpServletResponse response) {
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
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = busiService.getOffLinePayList(begindate, enddate, userid==null?"":userid,  username==null?"":username, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/dealOffLine")
	public void dealOffLine(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long userid = Long.valueOf(request.getParameter("userid"));
			double money = Double.valueOf(request.getParameter("money"));
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, Object> map = server.getUserById(userid);
			if (busiService.dealOffLine(userid, money)) {
				if (busiService.changeState(id, 2)) {
					out.print("0000");
					logService.addSyslog("线下转款处理", "dealOffLine", "登录名为“"+map.get("username")+"”的用户线下转款“"+money+"”元", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				} else {
					out.print("处理线下转款成功，处理状态失败");
					logService.addSyslog("处理线下转款状态", "changeState", "处理登录名为“"+map.get("username")+"”的线下转款状态", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
				}
			} else {
				out.print("处理线下转款失败");
				logService.addSyslog("线下转款处理", "dealOffLine", "登录名为“"+map.get("username")+"”的用户线下转款“"+money+"”元", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("线下转款处理", "dealOffLine", "处理用户线下转款异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delOffLine")
	public void delOffLine(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (busiService.changeState(id, 3)) {
				out.print("0000");
				logService.addSyslog("删除线下转款记录", "delOffLine", "删除序列号为“"+id+"”的转账记录", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除线下转款记录失败");
				logService.addSyslog("删除线下转款记录", "delOffLine", "删除序列号为“"+id+"”的转账记录", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("删除线下转款记录", "delOffLine", "删除线下转账记录异常："+e.getMessage(), "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("getInvoiceList")
	public void getInvoiceList(HttpServletRequest request, HttpServletResponse response) {
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
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String issend = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = busiService.getInvoiceList(begindate, enddate, userid==null?"":userid, username==null?"":username, issend==null||"-1".equals(issend)?"":issend, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/updateInvoiceState")
	public void updateState(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (busiService.updateState(1, id)) {
				out.print("0000");
				logService.addSyslog("修改发票状态", "updateInvoiceState", "修改序列号为“"+id+"”的发票状态为已发送", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改发票状态失败");
				logService.addSyslog("修改发票状态", "updateInvoiceState", "修改序列号为“"+id+"”的发票状态为已发送", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("修改发票状态", "updateInvoiceState", "修改发票状态异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delInvoice")
	public void delInvoice(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (busiService.updateState(2, id)) {
				out.print("0000");
				logService.addSyslog("删除发票信息", "delInvoice", "删除序列号为“"+id+"”的发票信息", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除发票信息失败");
				logService.addSyslog("删除发票信息", "delInvoice", "删除序列号为“"+id+"”的发票信息", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("删除发票信息", "delInvoice", "删除发票信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getOrderList")
	public void getOrderList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String money = request.getParameter("money");
			String tradetype = request.getParameter("tradetype");
			String ordernum = request.getParameter("ordernum");
			String orderno = request.getParameter("orderno");
			String paytype = request.getParameter("paytype");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = busiService.getOrderList(userid==null?"":userid,username==null?"":username, money==null?"":money, tradetype==null||"0".equals(tradetype)?"":tradetype, ordernum==null?"":ordernum, orderno==null?"":orderno, paytype==null||"0".equals(paytype)?"":paytype, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delOrder")
	public void delOrder(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (busiService.delOrder(id)) {
				out.print("0000");
				logService.addSyslog("删除视频", "delOrder", "删除序列号为“"+id+"”的视频", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除视频失败");
				logService.addSyslog("删除视频", "delOrder", "删除序列号为“"+id+"”的视频", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("删除视频", "delOrder", "删除视频异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getPointList")
	public void getPointList(HttpServletRequest request, HttpServletResponse response) {
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
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = busiService.getPointList(begindate, enddate, userid==null?"":userid,  username==null?"":username, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delPoint")
	public void delPoint(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (busiService.delPoint(id)) {
				out.print("0000");
				logService.addSyslog("删除积分明细", "delPoint", "删除序号为“"+id+"”的积分明细", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除积分明细失败");
				logService.addSyslog("删除积分明细", "delPoint", "删除序号为“"+id+"”的积分明细", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("删除积分明细", "delPoint", "删除积分明细异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getMoneyList")
	public void getMoneyList(HttpServletRequest request, HttpServletResponse response) {
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
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String tradetype = request.getParameter("tradetype");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = busiService.getMoneyList(begindate, enddate,userid==null?"":userid,  username==null?"":username,tradetype==null||"0".equals(tradetype)?"":tradetype, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delMoney")
	public void delMoney(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (busiService.delMoney(id)) {
				out.print("0000");
				logService.addSyslog("删除收支明细", "delMoney", "删除序号为“"+id+"”的收支明细", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除收支明细失败");
				logService.addSyslog("删除收支明细", "delMoney", "删除序号为“"+id+"”的收支明细", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常");
			logService.addSyslog("删除收支明细", "delMoney", "删除收支明细异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response) {
        	try {
				int currentPage = 1;
				int pageSize = 99999;
				//int currentPage = Integer.valueOf(request.getParameter("page").trim());
			   // int pageSize = Integer.valueOf(request.getParameter("rows").trim());
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
				String userid = request.getParameter("userid");
				String username = request.getParameter("username");
				String tradetype = request.getParameter("tradetype");
				String state = request.getParameter("state");
				//System.out.println(userid+username+state);
				Map<String, Object> map=busiService.exportCSV(begindate, enddate,userid==null?"":userid, username==null?"":username, tradetype==null||"0".equals(tradetype)?"":tradetype, state==null||"0".equals(state)?"":state, currentPage, pageSize);			
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
					response.setHeader("Content-disposition", "attachment;filename=t_money.xls");
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
					ws.addCell(new Label(0, 0, "收支管理信息表", headerFormat));
					ws.mergeCells(0, 0, 4, 0);
					WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
					WritableCellFormat wcf = new WritableCellFormat(wf);
					wcf.setWrap(false);
					wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
					wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
					wcf.setAlignment(Alignment.CENTRE);
					wcf.setWrap(true);
					
					ws.addCell(new Label(0,1,"ID号",wcf));
					ws.addCell(new Label(1,1,"登录名",wcf));
					ws.addCell(new Label(2,1,"金额",wcf));
					ws.addCell(new Label(3,1,"交易类型",wcf));
					ws.addCell(new Label(4,1,"交易时间",wcf));
					ws.addCell(new Label(5,1,"获取与扣除",wcf));
					ws.addCell(new Label(6,1,"剩余金额",wcf));
					ws.addCell(new Label(7,1,"备注",wcf));
					ws.addCell(new Label(8,1,"状态",wcf));
		        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("moneyList");
					int i = 2;
					for (Map<String, Object> enMap : list) {
						ws.addCell(new Label(0,i,enMap.get("id").toString(),wcf));
						ws.addCell(new Label(1,i,enMap.get("username").toString(),wcf));
						ws.addCell(new Label(2,i,enMap.get("money").toString(),wcf));
						if(enMap.get("type").toString().equals("1")){
						if(enMap.get("tradetype").toString().equals("1")){
							ws.addCell(new Label(3,i,"充值",wcf));
							}else{
								ws.addCell(new Label(3,i,"其它",wcf));
							}	
						}else if(enMap.get("type").toString().equals("2")){
							if(enMap.get("tradetype").toString().equals("4")){
								ws.addCell(new Label(3,i,"报名",wcf));
								}else if(enMap.get("tradetype").toString().equals("3")){
									ws.addCell(new Label(3,i,"拍品征集",wcf));
								}
						}else{
							ws.addCell(new Label(3,i,"其它",wcf));
						}
						ws.addCell(new Label(4,i,enMap.get("tradedate").toString(),wcf));
						
						if(enMap.get("type").toString().equals("1")){
							ws.addCell(new Label(5,i,"获取",wcf));
						}else if(enMap.get("type").toString().equals("2")){
							ws.addCell(new Label(5,i,"扣除",wcf));
						}else{
							ws.addCell(new Label(5,i,"其他",wcf));
						}
					    ws.addCell(new Label(6,i,enMap.get("leftmoney").toString(),wcf));
						ws.addCell(new Label(7,i,enMap.get("note").toString(),wcf));
						//ws.addCell(new Label(8,i,enMap.get("state").toString(),wcf));
						if(enMap.get("state").toString().equals("1")){
							ws.addCell(new Label(8,i,"正常",wcf));
						}else{
							ws.addCell(new Label(8,i,"删除",wcf));
						}
						i++;
					}
					wwb.write();
					wwb.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	@SuppressWarnings("unchecked")
	@RequestMapping("/exportInvoic")
	public void exportInvoic(HttpServletRequest request, HttpServletResponse response) {
        	try {
				int currentPage = 1;
				int pageSize = 99999;
				//int currentPage = Integer.valueOf(request.getParameter("page").trim());
			   // int pageSize = Integer.valueOf(request.getParameter("rows").trim());
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
				String userid = request.getParameter("userid");
				String username = request.getParameter("username");
				String issend = request.getParameter("state");	
				//System.out.println(userid+username+issend);
				Map<String, Object> map=busiService.exportInvoiceCSV(begindate, enddate,userid==null?"":userid, username==null?"":username, issend==null||"-1".equals(issend)?"":issend, currentPage, pageSize);			
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
					response.setHeader("Content-disposition", "attachment;filename=t_invoice.xls");
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
					ws.addCell(new Label(0, 0, "发票管理信息表", headerFormat));
					ws.mergeCells(0, 0, 4, 0);
					WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
					WritableCellFormat wcf = new WritableCellFormat(wf);
					wcf.setWrap(false);
					wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
					wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
					wcf.setAlignment(Alignment.CENTRE);
					wcf.setWrap(true);
					
					ws.addCell(new Label(0,1,"ID号",wcf));
					ws.addCell(new Label(1,1,"登录名",wcf));
					ws.addCell(new Label(2,1,"发票名",wcf));
					ws.addCell(new Label(3,1,"接收人",wcf));
					ws.addCell(new Label(4,1,"手机号",wcf));
					ws.addCell(new Label(5,1,"邮编",wcf));
					ws.addCell(new Label(6,1,"地址",wcf));
					ws.addCell(new Label(7,1,"订单时间",wcf));
					ws.addCell(new Label(8,1,"订单号",wcf));
					ws.addCell(new Label(9,1,"状态",wcf));
					ws.addCell(new Label(10,1,"备注",wcf));
		        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("invoicList");
					int i = 2;
					for (Map<String, Object> enMap : list) {
						ws.addCell(new Label(0,i,enMap.get("id").toString(),wcf));
						ws.addCell(new Label(1,i,enMap.get("username").toString(),wcf));
						ws.addCell(new Label(2,i,enMap.get("invoicename").toString(),wcf));
						
						ws.addCell(new Label(3,i,enMap.get("recipient").toString(),wcf));
						ws.addCell(new Label(4,i,enMap.get("mobile").toString(),wcf));
						ws.addCell(new Label(5,i,enMap.get("address").toString(),wcf));
						
						ws.addCell(new Label(6,i,enMap.get("code").toString(),wcf));
						ws.addCell(new Label(7,i,enMap.get("createdate").toString(),wcf));
						ws.addCell(new Label(8,i,enMap.get("orderid").toString(),wcf));
						
						ws.addCell(new Label(9,i,enMap.get("issend").toString(),wcf));
						if(enMap.get("issend").toString().equals("0")){
							ws.addCell(new Label(9,i,"未邮寄",wcf));
						}else if(enMap.get("issend").toString().equals("1")){
							ws.addCell(new Label(9,i,"已邮寄",wcf));
						}else{
							ws.addCell(new Label(9,i,"已删除",wcf));
						}			
						ws.addCell(new Label(10,i,enMap.get("note").toString(),wcf));
						i++;
					}
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
