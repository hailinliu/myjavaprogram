package com.hyzm.admin.control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
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

import org.apache.tools.ant.Project;
import org.apache.tools.ant.taskdefs.Zip;
import org.apache.tools.ant.types.FileSet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hyzm.admin.service.lylots.LylotsService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;
import com.hyzm.util.DownloadImage;
import com.hyzm.util.ImageUtil;

@Controller
@RequestMapping("/collect")
public class LylotsControl {
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private LylotsService lylotsService;
	@RequestMapping("/uploadCollection")
	public void uploadCollection(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String yyyyMMdd=DateUtil.getDateTime(new Date(), "yyyyMMdd");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "zengjipaipin/"+yyyyMMdd+"/";//获取文件绝对路径
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
	@RequestMapping("/uploademailimage")
	public void uploademailimage(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;// 转型为MultipartHttpRequest
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "emailimage/";//获取文件绝对路径
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
			fileDir.mkdirs();
		}
		String fileNameLong = file.getOriginalFilename();//获取上传的文件名称
		String extensionName = fileNameLong.substring(fileNameLong.lastIndexOf(".") + 1);//获取文件扩展名
		String filename = fileNameLong.substring(0,fileNameLong.lastIndexOf("."));
		PrintWriter out = null;
		try {
			out = response.getWriter();
			FileOutputStream fileout = new FileOutputStream(saveFilePath +filename + "." + extensionName);
			fileout.write(file.getBytes());//写入文件
			fileout.close();
			ImageUtil.imageZip(saveFilePath, filename, extensionName, 156, 142);
			out.print(filename + "." + extensionName);
		} catch (Exception e) {
			e.printStackTrace();
			out.print("程序异常！");
		}
	}
	@RequestMapping("/getLylotsList")
	public void getLylotsList(HttpServletRequest request, HttpServletResponse response) {
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
			String lynumber = request.getParameter("lynumber");
			String specialID = request.getParameter("specialID");
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String username = request.getParameter("username");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = lylotsService.getLylotsList(begindate, enddate, specialID==null?"":specialID, lynumber==null?"":lynumber, name==null?"":name, username==null?"":username, userid==null?"":userid, state==null?"":state , currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/getZjlotsList")
	public void getZjlotsList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");	   
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
			String lynumber = request.getParameter("lynumber");
			String name = request.getParameter("name");
			String userid = request.getParameter("userid");
			String zjid =Long.toString(currentsession.getUserinfo().getId());
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = lylotsService.getLylotsList(begindate, enddate,  lynumber==null?"":lynumber, name==null?"":name,  zjid==null?"":zjid , currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/editsate")
	public void editsate(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int state =Integer.valueOf(request.getParameter("state")) ;
			System.out.println(state);
			if (lylotsService.updstate(id, state)){
				out.print("0000");
				logService.addSyslog("修改状态", "editlylots", "修改状态为：《"+state+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改状态", "editlylots", "修改状态为：《"+state+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改状态", "editlylots", "修改状态异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotoeditlylots")
	public String gotoeditlylots(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("lylots", lylotsService.getLylotsById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/lylots/editlylots";
	}
	@RequestMapping("/editlylots")
	public void editlylots(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String specialID = request.getParameter("specialID");
			String name = request.getParameter("name");
			String qpprice = request.getParameter("qpprice");
			String pricearea = request.getParameter("pricearea");
			String taobaourl = request.getParameter("taobaourl");
			String cjprice = request.getParameter("cjprice");
			String trialcomments = request.getParameter("trialcomments");
			String reviewcomments = request.getParameter("reviewcomments");
			String image = request.getParameter("image");
			String adminname = request.getParameter("adminname");
			String record = request.getParameter("record");
			String suggest = request.getParameter("suggest");;
			if (qpprice == null || "".equals(qpprice)) {
				qpprice = "0";
			}
			if (lylotsService.updLylots(id, Integer.parseInt(specialID), name,image, qpprice,pricearea, taobaourl, trialcomments, reviewcomments, cjprice, adminname, record, suggest)){
				out.print("0000");
				logService.addSyslog("修改拍品", "editlylots", "修改拍品名为：《"+name+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改拍品", "editlylots", "修改拍品名为：《"+name+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改拍品", "editlylots", "修改拍品异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotozjeditlylots")
	public void gotozjeditlylots(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		String saveFilePath = request.getSession().getServletContext().getRealPath("/") + "lylots/";//获取文件绝对路径
		File fileDir = new File(saveFilePath);
		if (!fileDir.exists()) {//判断路径是否存在，如果不存在创建
			fileDir.mkdirs();
		}
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String trialcomments = request.getParameter("trialcomments");	
			String trialexperts = request.getParameter("trialexperts");	
			String sczjid =Long.toString(currentsession.getUserinfo().getId());
			if (lylotsService.updzjlots(id, trialcomments, sczjid, trialexperts)){
				out.print("0000");
				logService.addSyslog("修改专家评论", "editlylots", "修改专家评论为：《"+trialcomments+"》", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("0001");
				logService.addSyslog("修改专家评论", "editlylots", "修改专家评论为：《"+trialcomments+"》", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			logService.addSyslog("修改专家评论", "editlylots", "修改专家异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/downIMGByid")
	public void downIMGByid(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, Object> map=lylotsService.getLylotsById(id);
			String images[];
			String name=map.get("lynumber").toString();
			//判断文件是否存在
			if(map.get("image")!=null){
				images=map.get("image").toString().split(",");
				for(int i=0;i<images.length;i++){
					String newPath= request.getSession().getServletContext().getRealPath("/") + "zengjipaipin/test/"+name+"/";
					String newfilename=images[i].substring(images[i].lastIndexOf("/")+1,images[i].length());
					DownloadImage.download("http://admin.wswhly.com/zengjipaipin/"+images[i],newfilename, newPath);
				}
				//对 name文件夹进行压缩打包
				compress(request.getSession().getServletContext().getRealPath("/") + "zengjipaipin/test/",name);
				//下载打包之后的文件
				 // path是指欲下载的文件的路径。
				String path=request.getSession().getServletContext().getRealPath("/") + "zengjipaipin/test/"+name+".zip";
	            File file = new File(path);
	            // 取得文件名。
	            String filename = file.getName();

	            // 以流的形式下载文件。
	            InputStream fis = new BufferedInputStream(new FileInputStream(path));
	            byte[] buffer = new byte[fis.available()];
	            fis.read(buffer);
	            fis.close();
	            response.reset();
	            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename.getBytes()));
	            response.addHeader("Content-Length", "" + file.length());
	            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
	            response.setContentType("application/octet-stream");
	            toClient.write(buffer);
	            toClient.flush();
	            toClient.close();
	            file.delete(); 
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	//压缩文件
	public void compress(String srcPathName,String filename) {  
		 File zipFile=new  File(srcPathName+"/"+filename+".zip");
        File srcdir = new File(srcPathName+"/"+filename);   
        if (!srcdir.exists())   
            throw new RuntimeException(srcPathName + "不存在！");   
           
        Project prj = new Project();   
        Zip zip = new Zip();   
        zip.setProject(prj);   
        zip.setDestFile(zipFile);   
        FileSet fileSet = new FileSet();   
        fileSet.setProject(prj);   
        fileSet.setDir(srcdir);   
        zip.addFileset(fileSet);   
        zip.execute();   
    }   
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int currentPage = 1;
			int pageSize = 99999;
			String specialID = request.getParameter("specialID");
			String lynumber = request.getParameter("lynumber");
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String userid = request.getParameter("userid");
			String state = request.getParameter("state");
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
			Map<String, Object> map=lylotsService.exportCSV(begindate, enddate, specialID==null?"":specialID, lynumber==null?"":lynumber, name==null?"":name, username==null?"":username, userid==null?"":userid, state==null||"0".equals(state)?"":state,currentPage, pageSize);
			
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
				response.setHeader("Content-disposition", "attachment;filename=t_paipin.xls");
				response.setContentType("application/msexcel");
				WritableWorkbook wwb = Workbook.createWorkbook(os);//创建Excel文件
				WritableSheet ws = wwb.createSheet("Sheet1",10);//创建一个工作表
				WritableFont hd = new WritableFont(WritableFont.createFont("微软雅黑"),
						16, WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE);
				WritableCellFormat headerFormat = new WritableCellFormat(NumberFormats.TEXT);
				headerFormat.setFont(hd);  
				headerFormat.setBackground(Colour.BLUE);  
				headerFormat.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK);  
				headerFormat.setAlignment(Alignment.CENTRE);
				ws.addCell(new Label(0, 0, "华豫之门拍品信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"乐园编号",wcf));
				ws.addCell(new Label(1,1,"拍品名称",wcf));
				ws.addCell(new Label(2,1,"拍卖专场",wcf));
				ws.addCell(new Label(3,1,"作者",wcf));
				ws.addCell(new Label(4,1,"尺寸",wcf));
				ws.addCell(new Label(5,1,"年代",wcf));
				ws.addCell(new Label(6,1,"上传者",wcf));
				ws.addCell(new Label(7,1,"上传时间",wcf));
				ws.addCell(new Label(8,1,"拍品描述",wcf));
				ws.addCell(new Label(9,1,"预备价格",wcf));
				ws.addCell(new Label(10,1,"起拍价格区间",wcf));
				ws.addCell(new Label(11,1,"起拍价格",wcf));
				ws.addCell(new Label(12,1,"成交价格",wcf));
				ws.addCell(new Label(13,1,"淘宝拍品链接",wcf));
				ws.addCell(new Label(14,1,"初审专家",wcf));
				ws.addCell(new Label(15,1,"初审评论",wcf));
				ws.addCell(new Label(16,1,"复审评论",wcf));
				ws.addCell(new Label(17,1,"拍卖状态",wcf));
				ws.addCell(new Label(18,1,"商务专员",wcf));
				ws.addCell(new Label(19,1,"商务记录",wcf));
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("useList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("lynumber").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("name").toString(),wcf));	
					ws.addCell(new Label(2,i,enMap.get("specialname").toString(),wcf));	
					ws.addCell(new Label(3,i,enMap.get("autor").toString(),wcf));
					ws.addCell(new Label(4,i,enMap.get("size").toString(),wcf));
					ws.addCell(new Label(5,i,enMap.get("year").toString(),wcf));
				    ws.addCell(new Label(6,i,enMap.get("username").toString(),wcf));
					ws.addCell(new Label(7,i,enMap.get("uptime").toString(),wcf));					
					ws.addCell(new Label(8,i,enMap.get("suggest").toString(),wcf));
					ws.addCell(new Label(9,i,enMap.get("ybprice").toString(),wcf));
					if(enMap.get("pricearea").toString().equals("0")){
						ws.addCell(new Label(10,i,"5万以内",wcf));
					}else if(enMap.get("pricearea").toString().equals("1")){
						ws.addCell(new Label(10,i,"5万至10万",wcf));
				}else if(enMap.get("pricearea").toString().equals("2")){
					ws.addCell(new Label(10,i,"10万至20万",wcf));
			    }else if(enMap.get("pricearea").toString().equals("3")){
					ws.addCell(new Label(10,i,"20万至50万",wcf));
			    } else if(enMap.get("pricearea").toString().equals("4")){
					ws.addCell(new Label(10,i,"50万至100万",wcf));
			    } else if(enMap.get("pricearea").toString().equals("5")){
					ws.addCell(new Label(10,i,"100万以上",wcf));
			    }  
					ws.addCell(new Label(11,i,enMap.get("qpprice").toString(),wcf));
					ws.addCell(new Label(12,i,enMap.get("cjprice").toString(),wcf));
					ws.addCell(new Label(13,i,enMap.get("taobaourl").toString(),wcf));
					ws.addCell(new Label(14,i,enMap.get("trialexperts").toString(),wcf));
					ws.addCell(new Label(15,i,enMap.get("trialcomments").toString(),wcf));
					ws.addCell(new Label(16,i,enMap.get("reviewcomments").toString(),wcf));
					if(enMap.get("state").toString().equals("1")){
						ws.addCell(new Label(17,i,"待初审",wcf));
					}else if(enMap.get("state").toString().equals("2")){
						ws.addCell(new Label(17,i,"已初审",wcf));
					}else if(enMap.get("state").toString().equals("3")){
					    ws.addCell(new Label(17,i,"初审失败",wcf));
					}else if(enMap.get("state").toString().equals("4")){
						ws.addCell(new Label(17,i,"已复审",wcf));
					}else if(enMap.get("state").toString().equals("5")){
						ws.addCell(new Label(17,i,"复审失败",wcf));
					}else if(enMap.get("state").toString().equals("6")){
						ws.addCell(new Label(17,i,"已签约",wcf));
					}else if(enMap.get("state").toString().equals("7")){
						ws.addCell(new Label(17,i,"待拍卖",wcf));
					}else if(enMap.get("state").toString().equals("8")){
						ws.addCell(new Label(17,i,"已成交",wcf));
					}else if(enMap.get("state").toString().equals("9")){
						ws.addCell(new Label(17,i,"流拍",wcf));
					}else if(enMap.get("state").toString().equals("10")){
						ws.addCell(new Label(17,i,"已删除",wcf));
					}				
				    ws.addCell(new Label(18,i,enMap.get("adminname").toString(),wcf));
					ws.addCell(new Label(19,i,enMap.get("record").toString(),wcf));
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/ZJexportExcel")
	public void ZJexportExcel(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int currentPage = 1;
			int pageSize = 99999;
			String lynumber = request.getParameter("lynumber");
			String name = request.getParameter("name");	
			String zjid = request.getParameter("zjid");	
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
			Map<String, Object> map=lylotsService.ZjexportCSV(begindate, enddate, lynumber==null?"":lynumber, name==null?"":name,zjid==null?"":zjid, currentPage, pageSize);
			
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
				response.setHeader("Content-disposition", "attachment;filename=t_paipin.xls");
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
				ws.addCell(new Label(0, 0, "华豫之门拍品信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"乐园编号",wcf));
				ws.addCell(new Label(1,1,"拍品名称",wcf));
				ws.addCell(new Label(2,1,"拍卖专场",wcf));
				ws.addCell(new Label(3,1,"作者",wcf));
				ws.addCell(new Label(4,1,"尺寸",wcf));
				ws.addCell(new Label(5,1,"年代",wcf));	
				ws.addCell(new Label(6,1,"预备价格",wcf));
				ws.addCell(new Label(7,1,"上传时间",wcf));
				ws.addCell(new Label(8,1,"初审时间",wcf));
				ws.addCell(new Label(9,1,"初审评论",wcf));
				ws.addCell(new Label(10,1,"拍品描述",wcf));				
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("useList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("lynumber").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("name").toString(),wcf));	
					ws.addCell(new Label(2,i,enMap.get("specialname").toString(),wcf));	
					ws.addCell(new Label(3,i,enMap.get("autor").toString(),wcf));
					ws.addCell(new Label(4,i,enMap.get("size").toString(),wcf));
					ws.addCell(new Label(5,i,enMap.get("year").toString(),wcf));
					ws.addCell(new Label(6,i,enMap.get("ybprice").toString(),wcf));				  
					ws.addCell(new Label(7,i,enMap.get("uptime").toString(),wcf));					
					ws.addCell(new Label(8,i,enMap.get("trialtime").toString(),wcf));
					ws.addCell(new Label(9,i,enMap.get("trialcomments").toString(),wcf));
					ws.addCell(new Label(10,i,enMap.get("suggest").toString(),wcf));				
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
