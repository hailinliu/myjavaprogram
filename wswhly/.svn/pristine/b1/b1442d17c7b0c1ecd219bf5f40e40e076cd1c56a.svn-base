package com.hyzm.admin.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.admin.service.news.NewsService;
import com.hyzm.bean.CurrentSession;
import com.hyzm.syslog.service.SyslogService;
import com.hyzm.util.DateUtil;

@Controller
@RequestMapping("/news")
public class NewsControl {
	
	@Autowired
	private SyslogService logService;
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping("/getnewslist")
	public void getNewsList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int type = Integer.valueOf(request.getParameter("type"));
			String title = request.getParameter("title");
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
			String recommend = request.getParameter("recommend");
			String style = request.getParameter("style");
			String state = request.getParameter("state");
			String flagshopbaseinfoid=request.getParameter("flagshopbaseinfoid");
			String id=request.getParameter("id");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = newsService.getNewsList(type, id==null?"":id, title==null?"":title, begindate, enddate, recommend==null?"":recommend, style==null?"":style, state==null||"0".equals(state)?"":state,flagshopbaseinfoid==null||"0".equals(flagshopbaseinfoid)?"":flagshopbaseinfoid, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常：");
		    e.printStackTrace();
		}
	}
	
	@RequestMapping("/getschoollist")
	public void getSchoolList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String title = request.getParameter("title");
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
			String recommend = request.getParameter("recommend");
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = newsService.getNewsList(title==null?"":title, begindate, enddate, recommend==null?"":recommend, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常：");
		    e.printStackTrace();
		}
	}
	
	@RequestMapping("/getbulletinlist")
	public void getBulletinList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String title = request.getParameter("title");
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
			String state = request.getParameter("state");
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = newsService.getBulletinList(title==null?"":title, begindate, enddate, state==null||"0".equals(state)?"":state, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常：");
		    e.printStackTrace();
		}
	}

	@RequestMapping("/gotoaddcollectionInfo")
	public String gotoAddCollectionInfo(){
		return "admin/news/addcollectionInfo";
	}
	
	@RequestMapping("/gotoaddschoolInfo")
	public String gotoAddSchoolInfo(){
		return "admin/news/addschoolInfo";
	}
	
	@RequestMapping("/gotoaddbulletin")
	public String gotoAddBulletin(){
		return "admin/news/addbulletin";
	}
	
	@RequestMapping("/addnews")
	public void addNews(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			int type = Integer.valueOf(request.getParameter("type"));
			String title = request.getParameter("title");
			String label = request.getParameter("label");
			String content = request.getParameter("content");
			String style = request.getParameter("style");
			String flagshopbaseinfoid=request.getParameter("flagshopbaseinfoid");
			String imgurltitle = request.getParameter("imgurltitle"); 
			if (style == null || "".equals(style)) {
				style = "0";
			}
			if (newsService.addNews(type, title, label, content, Integer.parseInt(style),flagshopbaseinfoid,imgurltitle)) {
				out.print("0000");
				logService.addSyslog(type==1?"添加收藏资讯":"添加收藏学院下属", "addNews", "标题：“"+title+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加新闻失败！！！");
				logService.addSyslog(type==1?"添加收藏资讯":"添加收藏学院下属", "addNews", "标题：“"+title+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("添加新闻", "addNews", "添加新闻异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/delnews")
	public void delNews(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (newsService.delNews(id)) {
				out.print("0000");
				logService.addSyslog("删除新闻", "delNews", "删除新闻，序列号为："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除新闻失败！！！");
				logService.addSyslog("删除新闻", "delNews", "删除新闻，序列号为："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除新闻", "delNews", "删除新闻异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	@RequestMapping("/delnewlist")
	public void delnewlist(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			if (newsService.delNewlist(id)) {
				out.print("0000");
				logService.addSyslog("删除新闻", "delnewlist", "删除新闻，序列号为："+id, "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除新闻失败！！！");
				logService.addSyslog("删除新闻", "delnewlist", "删除新闻，序列号为："+id, "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除新闻", "delNews", "删除新闻异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	@RequestMapping("/gotoeditcollectionInfo")
	public String gotoEditCollectionInfo(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("news", newsService.getNewsById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/news/editcollectionInfo";
	}
	
	@RequestMapping("/gotoeditschoolInfo")
	public String gotoEditSchoolInfo(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("news", newsService.getNewsById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/news/editschoolInfo";
	}
	
	@RequestMapping("/gotoeditbulletin")
	public String gotoEditBulletin(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			request.setAttribute("news", newsService.getNewsById(id));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/news/editbulletin";
	}
	
	@RequestMapping("/editnews")
	public void editNews(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			String title = request.getParameter("title");
			String state = request.getParameter("state");
			String label = request.getParameter("label");
			String content = request.getParameter("content");
			String style = request.getParameter("style");
			String flagshopbaseinfoid=request.getParameter("flagshopbaseinfoid");
			String imgurltitle = request.getParameter("imgurltitle"); 
			String createdate = request.getParameter("createdate"); 
			if (style == null || "".equals(style)) {
				style = "0";
			}
			if (state == null || "".equals(state)) {
				state = "0";
			}			
			if (newsService.updNews(id, title,Integer.parseInt(state) ,label, content, Integer.parseInt(style),flagshopbaseinfoid,imgurltitle,createdate)) {
				out.print("0000");
				logService.addSyslog("修改新闻", "updNews", "修改新闻：标题为：“"+title+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改新闻失败！！！");
				logService.addSyslog("修改新闻", "updNews", "修改新闻：标题为：“"+title+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改新闻", "updNews", "修改新闻异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/setrecommend")
	public void setRecommend(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			int style = Integer.valueOf(request.getParameter("recommend"));
			Map<String, Object> map = newsService.getNewsById(id);
			if (newsService.setRecommend(id, style)) {
				out.print("0000");
				logService.addSyslog("推荐资讯", "setRecommend", "推荐资讯，标题为：“"+map.get("title")+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("推荐资讯失败");
				logService.addSyslog("推荐资讯", "setRecommend", "推荐资讯，标题为：“"+map.get("title")+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("推荐资讯", "setRecommend", "推荐资讯异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/autotitle")
	public void autoTitle(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String type = request.getParameter("type");
			String recommend = request.getParameter("recommend");
			String result = newsService.autoTitle(type==null?"":type, recommend==null?"":recommend);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getnewslisttd")
	public void getNewsListTd(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String title = request.getParameter("title");
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
			int currentPage = Integer.valueOf(request.getParameter("page").trim());
			int pageSize = Integer.valueOf(request.getParameter("rows").trim());
			String result = newsService.getNewsListTd(title==null?"":title, begindate, enddate, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常：");
		    e.printStackTrace();
		}
	}
	
    @RequestMapping("/cancel")
	public void cancelNewRecommendHot(HttpServletRequest request, HttpServletResponse response) {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, Object> map = newsService.getNewsById(id);
			if (newsService.setRecommend(id, 0)) {
				out.print("0000");
				logService.addSyslog("取消推荐", "cancelRecommend", "取消推荐，标题为：“"+map.get("title")+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("取消推荐失败");
				logService.addSyslog("取消推荐", "cancelRecommend", "取消推荐，标题为：“"+map.get("title")+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("取消设置", "cancelRecommend", "取消设置异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
	}
    
    @RequestMapping("/newstypelist")
    public void getNewsTypeList(HttpServletRequest request, HttpServletResponse response) {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int style = Integer.valueOf(request.getParameter("parentid"));
			int currentPage = Integer.valueOf(request.getParameter("page"));
			int pageSize = Integer.valueOf(request.getParameter("rows"));
			String result = newsService.getNewsTypeList(style, currentPage, pageSize);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
    }
    
    @RequestMapping("/addtype")
    public void addType(HttpServletRequest request, HttpServletResponse response) {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			String style = request.getParameter("style");
			int parentid = Integer.valueOf(request.getParameter("parentid"));
			if (newsService.addType(style, parentid)) {
				out.print("0000");
				logService.addSyslog("添加新闻子类型", "addType", "新闻子类型为：“"+style+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("添加新闻子类型失败！！！");
				logService.addSyslog("添加新闻子类型", "addType", "新闻子类型为：“"+style+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("添加新闻子类型", "addType", "添加新闻子类型异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
    }
    
    @RequestMapping("/deltype")
    public void delType(HttpServletRequest request, HttpServletResponse response) {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			int id = Integer.valueOf(request.getParameter("id"));
			if (newsService.delType(id)) {
				out.print("0000");
				logService.addSyslog("删除新闻子类型", "delType", "新闻子类型id为：“"+id+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("删除新闻子类型失败！！！");
				logService.addSyslog("删除新闻子类型", "delType", "新闻子类型id为：“"+id+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("删除新闻子类型", "delType", "删除新闻子类型异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
    }
    
    @RequestMapping("/updtype")
    public void updType(HttpServletRequest request, HttpServletResponse response) {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		try {
			out = response.getWriter();
			int id = Integer.valueOf(request.getParameter("id"));
			String style = request.getParameter("style");
			if (newsService.updType(id, style)) {
				out.print("0000");
				logService.addSyslog("修改新闻子类型", "updType", "新闻子类型为：“"+style+"”", "成功", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			} else {
				out.print("修改新闻子类型失败！！！");
				logService.addSyslog("修改新闻子类型", "updType", "新闻子类型为：“"+style+"”", "失败", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			}
		} catch (Exception e) {
			out.print("程序异常！");
			logService.addSyslog("修改新闻子类型", "updType", "修改新闻子类型异常："+e.getMessage(), "异常", currentsession.getUserinfo().getUsername(), request.getRemoteAddr(), 2);
			e.printStackTrace();
		}
    }
    
    @RequestMapping("/gettypecombobox")
    public void getTypeCombobox(HttpServletRequest request, HttpServletResponse response) {
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			int style = Integer.valueOf(request.getParameter("parentid"));
			String result = newsService.autoType(style);
			out.print(result);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
		}
    }
	@RequestMapping("/newsurl")
    public  void  getNewUrl(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		 Runnable runnable = new Runnable() {
		      public void run() {
		    	 String[] str = {"tqfx","scsx1","yhds","zwyp","fcys","zgsh","wwzx","qbtd","zspd1/yjzx1","yjjj","zlxx","jczs2","hwdt","cpsc","cqyw","cjrw1","plfx","pmzx"};	
		 		 String url="";	
		 		 String p="";
		 		 
		 	  for(int k=0;k<str.length;k++){
		 		  List<String> list = new ArrayList<String>();
		 	        p=str[k];	    
		 	     	String Url = "http://roll.collection.sina.com.cn/collection/"+p+"/index_1.shtml"; 	
		 	     	System.out.println(Url);
		 	     	Document doc;
			 try {
					doc = Jsoup.connect(Url).get();
				    Elements e1 = doc.select("div.content");//先遍历整个HTML
			 for(int j=0;j<10;j++){
			 for(Element ele : e1){ 
			 	    url = ele.select("ul > li").get(j).select("a").attr("href"); 		
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
           } catch (IOException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
		    } 
	      }
	    }
	 };
		    ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
		    service.scheduleAtFixedRate(runnable, 0,1, TimeUnit.HOURS);
  }
	private String getItem(String url) throws Exception{
		   //解析url  
//		  System.out.println(url);
	        String threadUrl = url;  
	        Document doc = Jsoup.connect(threadUrl).header("User-Agent", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.4; en-US; rv:1.9.2.2) Gecko/20100316 Firefox/3.6.2").get();  
	          //扩展名为.jpg的图片
	        String style=doc.select("div.path").text(); 
	        String lable=doc.select("p.art_keywords").select("a").text(); 
	        Element masthead = doc.select("div.blkContainerSblk").first();
	        if(masthead!=null){		   		    		   	   		    	 
	        	String imgurl = masthead.select("img[src$=.jpg]").toString();		   		    		   	   		    	 
		    	String value=masthead.select("div#artibody > p").toString(); 
		    	String title=masthead.select("h2").text();		
		    	String content= style+imgurl+value;
		    	newsService.getNewsinfo(title,content, lable);
		    	  }
			return threadUrl;    
		        } 
	         }

