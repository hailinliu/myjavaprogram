package com.hyzm.admin.control;

import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
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

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.taobao.taobaoService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;


@Controller
@RequestMapping("/taobao")
public class TaobaoControl {
	@Autowired
	private  SyslogService logService;
	
	@Autowired
	private taobaoService taobaoservice ;	
	@RequestMapping("/taobaourl")
	 public String url(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		 String url="";			 
		 List<String> list = new ArrayList<String>();		 	         
	     	String Url=request.getParameter("Url"); 	
	     	Document doc;
		 doc = Jsoup.connect(Url).get();  
		 Elements e1 = doc.select("div.pmp-item-list-wrap");
	 for(int j=0;j<20;j++){
	 for(Element ele : e1){ 
	 	    url = ele.select("div.pmp-item-list-wrap").select("p.title").get(j).select("a").attr("href"); 		
	 	    list.add(url);
	 	    String newsurl=list.get(j);
	 	    System.out.println(newsurl); 	
	 try {
		 getItem(newsurl);	
	 }catch(Exception e) {
	 	    System.out.println("当前路径抓取错误："+newsurl);
	 	    e.printStackTrace();
  }
} 	  
}
	return Url;
   } 
	private String getItem(String url) throws Exception{
		PrintWriter out = null;
	        String threadUrl = url;  
	        Document doc = Jsoup.connect(threadUrl).header("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2").get();     
	        Element masthead = doc.select("div.pm-main").first();
	        if(masthead!=null){		   		    		   	   		    	 	   		    		   	   		    	 
		    	String dangqianprice=masthead.select("div.pm-money").text(); 
		    	String baozhengprice=masthead.select("div.pm-bid").text(); 	
		    	 if(!masthead.select("div.pm-people").toString().equals("")){  
		            	Elements eletd = masthead.select("span.pm-people-cell");
		            	List<String> values=new ArrayList<String>();
		          
		            	for(int i=0;i<eletd.size();i++){		            	
		            		values.add(eletd.select("em").get(i).text());
		            	}	
		        String 	bmnum=values.get(0);
		        String 	sznum=values.get(1);
		        String 	wgnum=values.get(2);
		    	String pmname=masthead.select("h1").text();		    		
		    	String qpprice=masthead.select("div.pm-attachment").select("ul>li.line1").first().text();	
		    	String jprice=masthead.select("div.pm-attachment").select("ul>li.line2").first().text();	
		    	String jgname=masthead.select("div.pm-seller").select("a").text();		 
		    	taobaoservice.gettaobaoinfoByUrl(pmname, qpprice, baozhengprice, dangqianprice, jprice, bmnum, sznum, wgnum, jgname);
		        } 
		    	 
	         }
			return threadUrl;
	}
	@RequestMapping("/getTaobaoList")
	public void getTaobaoList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html"); 
		PrintWriter out = null;
		try {
			out = response.getWriter();			
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = taobaoservice.gettaobaoinfoList(currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/deltaobaolist")
	public void deltaobaolist(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (taobaoservice.deltaobaolist(id)) {
				out.print("0000");
				logService.addSyslog("删除信息", "delnewlist", "删除信息，序列号为："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除信息失败！！！");
				logService.addSyslog("删除信息", "delnewlist", "删除信息，序列号为："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除信息", "delNews", "删除信息异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	@SuppressWarnings("unchecked")
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request,HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			int currentPage = 1;
			int pageSize = 99999;		
			Map<String, Object> map=taobaoservice.exportCSV(currentPage, pageSize);
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
				ws.addCell(new Label(0, 0, "华豫之门抓取信息表", headerFormat));
				ws.mergeCells(0, 0, 4, 0);
				WritableFont wf = new WritableFont(WritableFont.createFont("微软雅黑"),10,WritableFont.NO_BOLD,false,UnderlineStyle.NO_UNDERLINE,Colour.BLACK);//设置单元格的文字格式
				WritableCellFormat wcf = new WritableCellFormat(wf);
				wcf.setWrap(false);
				wcf.setBorder(Border.ALL, BorderLineStyle.THIN, Colour.BLACK); 
				wcf.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcf.setAlignment(Alignment.CENTRE);
				wcf.setWrap(true);
				
				ws.addCell(new Label(0,1,"拍品名称",wcf));
				ws.addCell(new Label(1,1,"起拍价",wcf));
				ws.addCell(new Label(2,1,"保证金",wcf));
				ws.addCell(new Label(3,1,"当前价",wcf));
				ws.addCell(new Label(4,1,"加价幅度",wcf));
				ws.addCell(new Label(5,1,"报名人数",wcf));	
				ws.addCell(new Label(6,1,"设置提醒人数",wcf));
				ws.addCell(new Label(7,1,"围观人数",wcf));
				ws.addCell(new Label(8,1,"送拍机构",wcf));
				ws.addCell(new Label(9,1,"抓取时间",wcf));			
	        	List<Map<String, Object>> list = (List<Map<String, Object>>) map.get("useList");
				int i = 2;
				for (Map<String, Object> enMap : list) {
					ws.addCell(new Label(0,i,enMap.get("pmname").toString(),wcf));
					ws.addCell(new Label(1,i,enMap.get("qpprice").toString(),wcf));	
					ws.addCell(new Label(2,i,enMap.get("baozhengprice").toString(),wcf));	
					ws.addCell(new Label(3,i,enMap.get("dangqianprice").toString(),wcf));
					ws.addCell(new Label(4,i,enMap.get("jprice").toString(),wcf));
					ws.addCell(new Label(5,i,enMap.get("bmnum").toString(),wcf));
					ws.addCell(new Label(6,i,enMap.get("sznum").toString(),wcf));				  
					ws.addCell(new Label(7,i,enMap.get("wgnum").toString(),wcf));					
					ws.addCell(new Label(8,i,enMap.get("jgname").toString(),wcf));
					ws.addCell(new Label(9,i,enMap.get("zqtime").toString(),wcf));			
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
