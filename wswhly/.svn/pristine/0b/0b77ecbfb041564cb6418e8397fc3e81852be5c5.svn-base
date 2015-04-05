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

import com.hyzm.admin.service.flagshop.FlagshopService;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.ImageUtil;

@Controller
@RequestMapping("/flagshop")
public class FlagshopControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private FlagshopService flagshopService;
	//旗舰商家

	@RequestMapping("/getFlagshopList")
	public void getFlagshopList(HttpServletRequest request, HttpServletResponse response) {
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
			String mobile = request.getParameter("mobile");
			String companyName = request.getParameter("companyName");
			String username = request.getParameter("username");
			String style = request.getParameter("style");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = flagshopService.getFlagshopList(begindate, enddate,companyName==null?"":companyName,username==null?"":username, mobile==null?"":mobile,style==null||"0".equals(style)?"":style, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/uploadFlagshop")
	public void uploadFlagshop(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "flagshop/";//获取文件绝对路径
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
	@RequestMapping("/gotoeditcollection")
	public String gotoEditCollection(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("collection", flagshopService.getCollectionById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/collection/editcollection";
	}
	
	/*导出EXCEL表格
	 * autor:haojk
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		try {
			int currentPage = 1;
			int pageSize = 99999;
			String companyName = request.getParameter("companyName");
			String username = request.getParameter("username");
			String mobile = request.getParameter("mobile");
			String bdate = request.getParameter("startdate");
			String edate = request.getParameter("enddate");
			String style = request.getParameter("style");
			if(style.equals("0")){
				
				style="";
			}
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
			Map<String, Object> map=flagshopService.exportCSV(companyName==null?"":companyName, username==null?"":username, mobile==null?"":mobile, startdate, enddate, style,pageSize, currentPage);
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
				response.setHeader("Content-disposition", "attachment;filename=t_flagshop.xls");
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
				ws.addCell(new Label(0, 0, "管理信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"商家名称",wcf));
				ws.addCell(new Label(1,1,"公司简称",wcf));
				ws.addCell(new Label(2,1,"营业执照号码",wcf));
				ws.addCell(new Label(3,1,"组织机构代码",wcf));
				ws.addCell(new Label(4,1,"地址",wcf));
				ws.addCell(new Label(5,1,"注册资金",wcf));
				ws.addCell(new Label(6,1,"法人代表人名称",wcf));
				ws.addCell(new Label(7,1,"法人身份证号",wcf));
				ws.addCell(new Label(8,1,"联系人名称",wcf));
				ws.addCell(new Label(9,1,"联系人身份证号码",wcf));
				ws.addCell(new Label(10,1,"联系人电话",wcf));
				ws.addCell(new Label(11,1,"电子邮箱",wcf));
				ws.addCell(new Label(12,1,"经营范围",wcf));
				ws.addCell(new Label(13,1,"店铺面积",wcf));
				ws.addCell(new Label(14,1,"提交申请时间",wcf));
				ws.addCell(new Label(15,1,"开始合作时间",wcf));
				ws.addCell(new Label(16,1,"合作结束时间",wcf));
				ws.addCell(new Label(17,1,"合作状态",wcf));
				ws.addCell(new Label(18,1,"合作性质",wcf));
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("shoplist");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("companyName").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("com_abb").toString(),wcf));	
					ws.addCell(new Label(2,i,enMap.get("code").toString(),wcf));	
					ws.addCell(new Label(3,i,enMap.get("com_code").toString(),wcf));
				    ws.addCell(new Label(4,i,enMap.get("address").toString(),wcf));
					ws.addCell(new Label(5,i,enMap.get("money").toString(),wcf));
				    ws.addCell(new Label(6,i,enMap.get("f_name").toString(),wcf));
					ws.addCell(new Label(7,i,enMap.get("f_id_code").toString(),wcf));
					ws.addCell(new Label(8,i,enMap.get("name").toString(),wcf));
					ws.addCell(new Label(9,i,enMap.get("id_card").toString(),wcf));
					ws.addCell(new Label(10,i,enMap.get("mobile").toString(),wcf));
					ws.addCell(new Label(11,i,enMap.get("email").toString(),wcf));
					ws.addCell(new Label(12,i,enMap.get("manage").toString(),wcf));
					ws.addCell(new Label(13,i,enMap.get("com_area").toString(),wcf));
					ws.addCell(new Label(14,i,enMap.get("applicationtime").toString(),wcf));
					ws.addCell(new Label(15,i,enMap.get("begintime").toString(),wcf));
					ws.addCell(new Label(16,i,enMap.get("endtime").toString(),wcf));
					if(enMap.get("state").equals("1")){
					    ws.addCell(new Label(17,i,"已合作",wcf));
					}else if(enMap.get("state").equals("0")){
						ws.addCell(new Label(17,i,"未合作",wcf));
					}else if(enMap.get("state").equals("2")){
						ws.addCell(new Label(17,i,"取消合作",wcf));
					}
					if(enMap.get("style").equals("1")){
					  ws.addCell(new Label(18,i,"公司",wcf));
					}else if(enMap.get("style").equals("2")){
						ws.addCell(new Label(18,i,"个人",wcf));
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
