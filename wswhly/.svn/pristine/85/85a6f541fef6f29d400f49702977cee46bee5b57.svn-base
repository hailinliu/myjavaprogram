package com.hyzm.admin.control;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.Map;

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

import com.hyzm.admin.service.enroll.EnrollActivitieService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;

@Controller
@RequestMapping("/enrollActivitie")
public class EnrollActivitiesControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private EnrollActivitieService enService;
	
	@RequestMapping("/getEnrollList")
	public void getEnrollList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String bdate = request.getParameter("begindate");
			String edate = request.getParameter("enddate");
			Date begindate = null;
			Date enddate = null;
			if (bdate == null || bdate.equals("")) {
				begindate = DateUtil.getDateTime(DateUtil.getDate(-7)+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}else{
				begindate = DateUtil.getDateTime(bdate+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}
			if(edate == null || edate.equals("")){
				enddate = DateUtil.getDateTime(DateUtil.getDateTime(new Date(), "yyyy-MM-dd")+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}else{
				enddate = DateUtil.getDateTime(edate+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}
			String name = request.getParameter("username");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = enService.getEnrollActiveList(begindate, enddate, name==null||"0".equals(name)?"":name, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		try {
			String bdate = request.getParameter("begindate");
			String edate = request.getParameter("enddate");
			Date begindate = null;
			Date enddate = null;
			if (bdate == null || bdate.equals("")) {
				begindate = DateUtil.getDateTime(DateUtil.getDate(-7)+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}else{
				begindate = DateUtil.getDateTime(bdate+" 00:00:00", "yyyy-MM-dd HH:mm:ss");
			}
			if(edate == null || edate.equals("")){
				enddate = DateUtil.getDateTime(DateUtil.getDateTime(new Date(), "yyyy-MM-dd")+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}else{
				enddate = DateUtil.getDateTime(edate+" 23:59:59", "yyyy-MM-dd HH:mm:ss");
			}
			String username = request.getParameter("username");
			Map<String, Object> map = enService.exportCSV(begindate, enddate, username==null?"":username);
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
				response.setHeader("Content-disposition", "attachment;filename=t_bm_info.xls");
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
				ws.addCell(new Label(0, 0, "活动报名信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"登陆姓名",wcf));
				ws.addCell(new Label(1,1,"注册电话",wcf));
				ws.addCell(new Label(2,1,"报名类型",wcf));
				ws.addCell(new Label(3,1,"报名时间",wcf));
				ws.addCell(new Label(4,1,"报名姓名",wcf));
				ws.addCell(new Label(5,1,"报名电话",wcf));
				ws.addCell(new Label(6,1,"邮箱",wcf));
				
				ws.addCell(new Label(7,1,"性别",wcf));
				ws.addCell(new Label(8,1,"身份证",wcf));
				ws.addCell(new Label(9,1,"绿卡号",wcf));
				ws.addCell(new Label(10,1,"地址",wcf));
				ws.addCell(new Label(11,1,"是否签证",wcf));
				ws.addCell(new Label(12,1,"到期时间",wcf));
				ws.addCell(new Label(13,1,"藏品类型",wcf));
				
				ws.addCell(new Label(14,1,"带队专家",wcf));
				ws.addCell(new Label(15,1,"是否随队",wcf));
				ws.addCell(new Label(16,1,"描述",wcf));

				List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("enrollInfoList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("username").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("mobile").toString(),wcf));
					ws.addCell(new Label(2,i,enMap.get("bm_style").toString(),wcf));
					ws.addCell(new Label(3,i,enMap.get("bm_time").toString(),wcf));
					ws.addCell(new Label(4,i,enMap.get("name").toString(),wcf));
					ws.addCell(new Label(5,i,enMap.get("tel").toString(),wcf));
					ws.addCell(new Label(6,i,enMap.get("email").toString(),wcf));
					
					ws.addCell(new Label(7,i,enMap.get("sex").toString(),wcf));
					ws.addCell(new Label(8,i,enMap.get("idcard").toString(),wcf));
					ws.addCell(new Label(9,i,enMap.get("ipcard").toString(),wcf));
					ws.addCell(new Label(10,i,enMap.get("address").toString(),wcf));
					ws.addCell(new Label(11,i,enMap.get("visa").toString(),wcf));
					ws.addCell(new Label(12,i,enMap.get("useTime").toString(),wcf));
					ws.addCell(new Label(13,i,enMap.get("style").toString(),wcf));
					
					ws.addCell(new Label(14,i,enMap.get("lader").toString(),wcf));
					ws.addCell(new Label(15,i,enMap.get("joins").toString(),wcf));
					ws.addCell(new Label(16,i,enMap.get("description").toString(),wcf));
	
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
