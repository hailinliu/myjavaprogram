package com.hyzm.admin.control;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.yc.LotsService;
import com.hyzm.util.ComplTosimple;
import com.hyzm.util.CompressPicDemo;
import com.hyzm.util.DownloadImage;

@Controller
@RequestMapping("/yclots")
public class LotsControl {
	@Autowired
	LotsService service;
	@RequestMapping("/getlotsList")
	public void getLylotsList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html"); 
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			map.put("name", request.getParameter("name"));
			map.put("specialID", request.getParameter("specialID"));
			map.put("currentPage", request.getParameter("page"));
			map.put("pageSize", request.getParameter("rows"));
			String result = service.getLotsList(map);
			System.out.println(result);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotoeditlots")
	public String gotoeditlylots(HttpServletRequest request) {
		try {
			Map<String, String> map=new HashMap<String, String>();
			map.put("id", request.getParameter("id"));
			request.setAttribute("lylots", service.getLots(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/yc/editlots";
	}
	@RequestMapping("/editlots")
	public void editlylots(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, String> map=new HashMap<String, String>();
			map.put("name",request.getParameter("name")); 
			map.put("image",request.getParameter("image"));
			map.put("autor",request.getParameter("autor"));
			map.put("size",request.getParameter("size"));
			map.put("classes",request.getParameter("classes"));
			map.put("year",request.getParameter("year"));
			map.put("price",request.getParameter("price"));
			map.put("specialID",request.getParameter("specialID"));
			map.put("suggest",request.getParameter("suggest"));
			map.put("note",request.getParameter("note"));
			map.put("cjprice",request.getParameter("cjprice"));
			map.put("cjtime",request.getParameter("cjtime"));
			if(request.getParameter("id")!=""){
				map.put("id",request.getParameter("id"));
				if (service.upaLots(map)){
					out.print("0000");
				} else {
					out.print("0001");
				}
			}else{
				if (service.addLots(map)){
					out.print("0000");
				} else {
					out.print("0001");
				}
			}
			
		} catch (Exception e) {
			out.print("程序异常");
			e.printStackTrace();
		}
		
	}
	@RequestMapping("/zqurl")
 public void zqurl(HttpServletRequest request, HttpServletResponse response){ 
		PrintWriter out = null;
		 String res=null;
	     	String Url=request.getParameter("Url"); 
			String specialID=request.getParameter("specialID");	
			int ins_id=Integer.valueOf(request.getParameter("ins_id"));	
			
	 try {	
		 out = response.getWriter();
		 if(ins_id==4){
		  res=getItemsfb(Url,specialID);
	     }else{
		  res=getItem(Url,specialID);
	   }
		 System.out.println(res);
			if (res!=null){				
				out.print(res);
			} else {
				out.print("0001");
		}
	 }catch(Exception e) {
	 	    System.out.println("当前路径抓取错误："+Url);
	 	   out.print("程序异常");
			e.printStackTrace();
			
 }
	 
  }

	private String getItem(String url, String specialID) throws Exception{
	        String threadUrl = url;  
	        Document doc = Jsoup.connect(threadUrl).header("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2").get();     
	        Elements ListDiv = doc.getElementsByAttributeValue("class","bottom-padding");
	        for(Element ele :ListDiv){ 
	            if(!ele.select("div.row").toString().equals("")){              	
	   			        Elements jsp = ele.select("img[src$=.jpg]");
				        String imgurl = jsp.attr("src");				        
				        imgurl="http://119.254.110.231:8088"+imgurl;
				       System.out.println(imgurl); 				      
				       String imgname=imgurl.substring(imgurl.lastIndexOf("/m")+1,imgurl.length());
				       for(int i=0;i<1000;i++){          
				    	  int num= DownloadImage.download(imgurl,imgname, "/home/tomcat_admin/webapps/wswhly/zengjipaipin/jsd/");
				    	  if(num==1){
				    		  break;
				    	  }
				       }
					Map<String, String> map=new HashMap<String, String>();
				      String imgurldb="/jsd/"+imgname;

			        	   String names="#"+threadUrl.substring(threadUrl.lastIndexOf("/")+1,threadUrl.length())+"  "+ele.select("div.row").select("p.detail-title").text()+"  "+ele.select("div.row").select("p.activity-subtitle").first().text();
			        	   String price=ele.select("div.row").select("p.activity-redtxt").text(); 
			        	   String suggest=ele.select("div.row").select("p.activity-content").text(); 		
			        	   names=new ComplTosimple().complTosimple(names);
			        	   suggest=new ComplTosimple().complTosimple(suggest);
			        	   price=new ComplTosimple().complTosimple(price);
			        		map.put("name",names); 
			    			map.put("image",imgurldb+",");
			    			map.put("autor",null);
			    			map.put("size",null);
			    			map.put("classes",null);
			    			map.put("year",null);
			    			map.put("price",price);
			    			map.put("specialID",specialID);
			    			map.put("suggest",suggest);
			    			map.put("note",null);
			    			service.addLots(map);	
			    			return names;
		        } 
		    	 
	         }
			return null;
	}


	private String getItemsfb(String url, String specialID) throws Exception{

	        String threadUrl = url;  
	        Document doc = Jsoup.connect(threadUrl).header("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2").get();     
	        Elements ListDiv = doc.getElementsByAttributeValue("id","conditionsOfSaleModal");
	        for(Element ele :ListDiv){ 
	            if(!ele.select("div.row-fluid").toString().equals("")){              	
	   			        Elements jsp = ele.select("img");
				        String imgurl = jsp.attr("src");				        
				        imgurl="http://www.sothebys.com"+imgurl;			      
				       String imgname=imgurl.substring(imgurl.lastIndexOf("/")+1,imgurl.length());
				       for(int i=0;i<1000;i++){          
				    	  int num= DownloadImage.download(imgurl,imgname, "/home/tomcat_admin/webapps/wswhly/zengjipaipin/sfb/");
				    	  if(num==1){
				    		  break;
				    	  }
				       }
					Map<String, String> map=new HashMap<String, String>();
				          String imgurldb="/sfb/"+imgname;
			        	   String names=ele.select("h1.number").text()+"  "+ele.select("h5.guarantee").text();
			        	   String price=ele.select("div.estimate").text();
			        	   String suggest=doc.select("div.lotdetail-details-content").text(); 		
			        	   names=new ComplTosimple().complTosimple(names);
			        	   suggest=new ComplTosimple().complTosimple(suggest);
			        	   price=new ComplTosimple().complTosimple(price);
			        		map.put("name",names); 
			    			map.put("image",imgurldb+",");
			    			map.put("autor",null);
			    			map.put("size",null);
			    			map.put("classes",null);
			    			map.put("year",null);
			    			map.put("price",price);
			    			map.put("specialID",specialID);
			    			map.put("suggest",suggest);
			    			map.put("note",null);
			    			service.addLots(map);	
			    			return names;
		        } 
		    	 
	         }
			return null;
	}
	
}
