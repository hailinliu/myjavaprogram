package com.hyzm.admin.control;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
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
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyzm.admin.service.collection.CollectionService;
import com.hyzm.admin.service.mem.MemService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.ImageUtil;
import com.hyzm.util.StringUtil;
@Controller
@RequestMapping("/member")
public class MemberControl {
	@Autowired
	private SyslogService logService;
	@Autowired
	private MemService memService;
	@RequestMapping("/getMemberList")
	public void getMemberList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String collectage = request.getParameter("collectage");
			String likeoption = request.getParameter("likeoption");
			String price = request.getParameter("price");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = memService.getMemberList(userid==null?"":userid,username==null?"":username,collectage==null||"0".equals(collectage)?"":collectage,likeoption==null||"0".equals(likeoption)?"":likeoption,price==null||"0".equals(price)?"":price, currentPage, pageSize);
		
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("/usermemupd")
	public void updMember(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "Member/";//获取文件绝对路径
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
			fileDir.mkdirs();
		}
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String image = "";
//			request.getAttribute(id);
			long id = Long.valueOf(request.getParameter("id"));
			String username = request.getParameter("username");
			String birth = request.getParameter("birth");
			String isjoin = request.getParameter("isjoin");
			String isload = request.getParameter("isload");
			String collectage=request.getParameter("collectage");
			String likeoption=request.getParameter("likeoption");
			String target=request.getParameter("target");
			String service=request.getParameter("service");
		    String channel=request.getParameter("channel");
		    String price=request.getParameter("price");
			Map<String, Object> map = memService.getMemberById(id);
			System.out.println(likeoption);
			if (memService.updMember(id, username, collectage, likeoption, target, service, channel, price, isjoin, isload)) {
				out.print("0000");
				logService.addSyslog("修改会员", "addMember", "会员名：《"+username+"》，出生年份："+birth+"，是否参加过海选："+isjoin+":是否登过华豫之门"+isload, "成功",currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改会员失败！！！");
				logService.addSyslog("修改会员", "addMember","会员名：《"+username+"》，出生年份："+birth+"，是否参加过海选："+isjoin+":是否登过华豫之门"+isload, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改会员", "updatecollection", "修改会员异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/automember")
	public void automember(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String result = memService.autoUserName();
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int currentPage = 1;
			int pageSize = 99999;
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String collectage = request.getParameter("collectage");
			String likeoption = request.getParameter("likeoption");
			String price = request.getParameter("price");
			Map<String, Object> map=memService.exportCSV(userid==null?"":userid,username==null?"":username,collectage==null?"":collectage, likeoption==null?"":likeoption,price==null?"":price, currentPage, pageSize);
			
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
				
				ws.addCell(new Label(0,1,"ID号",wcf));
				ws.addCell(new Label(1,1,"用户名",wcf));
				ws.addCell(new Label(2,1,"出生年份",wcf));
				ws.addCell(new Label(3,1,"收藏履历",wcf));
				ws.addCell(new Label(4,1,"收藏品类",wcf));
				ws.addCell(new Label(5,1,"收藏渠道",wcf));
				ws.addCell(new Label(6,1,"希望鉴定渠道",wcf));
				ws.addCell(new Label(7,1,"鉴定机构名称",wcf));
				ws.addCell(new Label(8,1,"行业专家名称",wcf));
				ws.addCell(new Label(9,1,"华豫之门专家",wcf));
				ws.addCell(new Label(10,1,"希望网站提供的服务",wcf));
				ws.addCell(new Label(11,1,"收藏目的",wcf));
				ws.addCell(new Label(12,1,"上传时间",wcf));
				ws.addCell(new Label(13,1,"是否参加过海选",wcf));
				ws.addCell(new Label(14,1,"是否登过华豫之门",wcf));
				ws.addCell(new Label(15,1,"接受价格",wcf));
				ws.addCell(new Label(16,1,"是否愿意信息推送",wcf));
				ws.addCell(new Label(17,1,"建议",wcf));
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("MemberList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					String field[]=new String  []{"userid","username","birth","collectage","likeoption","channel","hopeorganization","organization","collection1","collection2","service","target","time","isjoin","isload","price","ispush","suggest"};
					for(int k=0;k<field.length;k++){
						Object values=enMap.get(field[k]);
						if(values!=null&&values.toString()!=null){
							ws.addCell(new Label(k,i,values.toString(),wcf));
						}else{
							ws.addCell(new Label(k,i,"",wcf));
						}
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
