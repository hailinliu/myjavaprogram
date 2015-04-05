package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.MessageRespBean;
import com.hyzm.bean.collection.CollectionListRespBean;
import com.hyzm.bean.collection.CollectionOrderReqBean;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.collection.CollectionOrderListRespBean.CollectionOrder;
import com.hyzm.bean.collection.CollectionTypeRespBean.Type;
import com.hyzm.bean.collectionus.CollectionusListRespBean;
import com.hyzm.bean.collectionus.CollectionusListRespBean.Collectionus;
import com.hyzm.bean.collectionus.CollectionusStyleRespBean.Style;
import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.video.VideoListRespBean.Video;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.forward.service.news.NewsService;
import com.hyzm.forward.service.video.VideoService;

@Controller
@RequestMapping("/collection")
public class CollectionControl {
	
	@Autowired
	private NewsService newsService;
	@Autowired
	private ForumsService forumsService;
	
	@Autowired
	private CollectionService colService;
	@Autowired
	private VideoService videoService;
	@SuppressWarnings("unchecked")
	
	@RequestMapping("/getHycp")
	public String getHycp(HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
		   String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			long typeid=0;
			if(request.getParameter("typeid")==null){
				typeid=1;
			}else{
				typeid=Long.parseLong(request.getParameter("typeid"));
			}
			long styleid = 0;
			List<News> newestList = newsService.getNewsList("3");
			if(request.getParameter("styleid") != null){
				styleid = Long.parseLong(request.getParameter("styleid"));	
			}else if(request.getParameter("type") != null){
				
				styleid = Long.parseLong(request.getParameter("type"));	
			}
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			
			map = colService.getCollectionusStyle(typeid);
			List<Style> liststyle = (List<Style>) map.get("list");
			
			
			int pricearea =-1;
			if(request.getParameter("pricearea") != null)
				pricearea = Integer.valueOf(request.getParameter("pricearea"));
			
			map = colService.getCollectionusList(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize),styleid,typeid,pricearea);
			List<Collectionus> list = (List<Collectionus>) map.get("list");
			Video videoList = videoService.getVideoListIndex().get(0);
			for (Collectionus coll : list) {
				String image = coll.getImgurl();
				String[] imgarray = image.split(",");
				coll.setImgurl(imgarray[0]);
			}
			
			request.setAttribute("collectionList", list);
			request.setAttribute("liststyle", liststyle);
			request.setAttribute("type", styleid);
			request.setAttribute("listsize", ((List<Collectionus>)map.get("list")).size());
			request.setAttribute("count", map.get("count"));
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("newestList", newestList);
			request.setAttribute("videoList", videoList);
			request.setAttribute("pricearea", pricearea);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "collection/hycp/hycps";
	}
	@RequestMapping("/getZbcp")
	public String getZbcp(HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<News> newestList = newsService.getNewsList("3");
			Video videoList = videoService.getVideoListIndex().get(0);
		    String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			long typeid=0;
			if(request.getParameter("typeid")==null){
				typeid=2;
			}else{
				typeid=Long.parseLong(request.getParameter("typeid"));
			}
			long styleid = 0;
			if(request.getParameter("styleid") != null){
				styleid = Long.parseLong(request.getParameter("styleid"));	
			}else if(request.getParameter("type") != null){
				
				styleid = Long.parseLong(request.getParameter("type"));	
			}
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			
			map = colService.getCollectionusStyle(typeid);
			List<Style> liststyle = (List<Style>) map.get("list");
			
			int pricearea =-1;
			if(request.getParameter("pricearea") != null)
				pricearea = Integer.valueOf(request.getParameter("pricearea"));
			
			map = colService.getCollectionusList(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize),styleid,typeid,pricearea);
			List<Collectionus> list = (List<Collectionus>) map.get("list");
			
			for (Collectionus coll : list) {
				String image = coll.getImgurl();
				String[] imgarray = image.split(",");
				coll.setImgurl(imgarray[0]);
			}
			
			request.setAttribute("collectionList", list);
			request.setAttribute("liststyle", liststyle);
			request.setAttribute("type", styleid);
			request.setAttribute("listsize", ((List<Collectionus>)map.get("list")).size());
			request.setAttribute("count", map.get("count"));
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("newestList", newestList);
			request.setAttribute("videoList", videoList);
			request.setAttribute("pricearea", pricearea);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "collection/hycp/zbcps";
	}
	@RequestMapping("/getZjcp")
	public String getZjcp(HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			String collectionid= request.getParameter("collectionid");
	       //styleid
		   String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			long typeid=0;
			if(request.getParameter("typeid")==null){
				typeid=3;
			}else{
				typeid=Long.parseLong(request.getParameter("typeid"));
			}
			List<News> newestList = newsService.getNewsList("3");
			Video videoList = videoService.getVideoListIndex().get(0);
			long styleid = 0;
			String type = request.getParameter("type");
			if(request.getParameter("styleid") != null){
				styleid = Long.parseLong(request.getParameter("styleid"));	
			}else if(request.getParameter("type") != null){
				
				styleid = Long.parseLong(request.getParameter("type"));	
			}
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			
			map = colService.getCollectionusStyle(typeid);
			List<Style> liststyle = (List<Style>) map.get("list");
	
			int pricearea =-1;
			if(request.getParameter("pricearea") != null)
				pricearea = Integer.valueOf(request.getParameter("pricearea"));
			
			map = colService.getCollectionusList(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize),styleid,typeid,pricearea);
			List<Collectionus> list = (List<Collectionus>) map.get("list");
			for (Collectionus coll : list) {
				String image = coll.getImgurl();
				String[] imgarray = image.split(",");
				coll.setImgurl(imgarray[0]);
			}
			request.setAttribute("collectionList", list);
			request.setAttribute("liststyle", liststyle);
			request.setAttribute("type", styleid);
			request.setAttribute("listsize", ((List<Collectionus>)map.get("list")).size());
			request.setAttribute("count", map.get("count"));
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("newestList", newestList);
			request.setAttribute("videoList", videoList);
			request.setAttribute("pricearea", pricearea);
			//request.setAttribute("newestList", newestList);
			//request.setAttribute("recommendList", recommendList);
			//request.setAttribute("hotList", hotList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "collection/hycp/zjcps";
	}
	@RequestMapping("/addCollectionOrder")
		public void addCollectionOrder(HttpServletRequest request, HttpServletResponse response) {
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html");	
			PrintWriter out = null;
			MessageRespBean respBean=null;
			try {
				String collectionid= request.getParameter("orderid");
				String collectionstate=request.getParameter("state");
				String  collectionname=request.getParameter("collectionname");
				out = response.getWriter();
				CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
				CollectionOrderReqBean collection = new CollectionOrderReqBean();
				collection.setUserid(currentSession.getId());
				collection.setUsername(currentSession.getUsername());
				collection.setUsermobile(currentSession.getMobile());
				collection.setCollectionid(Long.parseLong(collectionid));
				collection.setCollectionname(collectionname);
				collection.setCollectionstate(collectionstate);
				respBean=colService.addCollectioOrder(collection);	
				out.print(new Gson().toJson(respBean.getErrorcode()));
			} catch (Exception e) {
				
				out.print("程序异常！");
				e.printStackTrace();
				out.print(new Gson().toJson(respBean.getErrorcode()));
			}
			
		}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/getCollectionOrder")
	public void getCollectionOrder(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;
		Map<String, Object> map=null;
		try {
			String collectionid= request.getParameter("orderid");
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			 map=colService.getCollectioOrder(currentSession.getId(),Long.parseLong(collectionid));	
			 List<CollectionOrder> collectionList = (List<CollectionOrder>) map.get("list");
			 int count=collectionList.size();
			 String time="";
			 String level="0";
			 if(null!=collectionList && collectionList.size()>0){
				 for (CollectionOrder col : collectionList) {
					 time=col.getCollectiontime();
					} 
			 }			 
			 if(currentSession.getLevel()==null || currentSession.getLevel().equals("")){
				 level="0";
			 }else{
				 level =currentSession.getLevel();		 
			 }
			 out.print(count+"="+time+"="+level);
		} catch (Exception e) {
			out.print("程序异常！");
			e.printStackTrace();
			
		}
		
	}
	
	
	@RequestMapping("/getCollectionus")
	public String getCollectionus(HttpServletRequest request, HttpServletResponse response) {
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			List<Collectionus> list = new ArrayList<Collectionus>();
			long id=Long.parseLong(request.getParameter("id"));
			map = colService.getCollectionusInfo(id);
			CollectionusListRespBean.Collectionus col = (CollectionusListRespBean.Collectionus)map.get("collection");
			String images = col.getImgurl();
			String[] imgsarray = images.split(",");
			col.setImgurl(imgsarray[0]);
			list = colService.getCollectionusList(String.valueOf(id), col.getType());
			for (Collectionus coll : list) {
				String image = coll.getImgurl();
				String[] imgarray = image.split(",");
				coll.setImgurl(imgarray[0]);
			}
			List<Forums> listForum=forumsService.getFlagshopList(id, "1");
			List<Forums> listRepaly=new ArrayList<Forums>() ;
			List<Forums> addlist=new ArrayList<Forums>() ;
			int counts=0;
			for (Forums forums : listForum) {
				counts+=Integer.parseInt(forums.getLikenum());
				if(!forums.getCountnum().equals("0")){
					listRepaly.add(forums);	
				}else{
					addlist.add(forums);
					
				}
			}
	
			request.setAttribute("listForum", addlist);
			request.setAttribute("listRepaly", listRepaly);
			request.setAttribute("size", listForum.size());
			request.setAttribute("counts", counts);
			request.setAttribute("col", col);
			request.setAttribute("colList", list);
			request.setAttribute("imgsarray", imgsarray);
			request.setAttribute("type", 1);
			request.setAttribute("collection", (CollectionusListRespBean.Collectionus)map.get("collection"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "collection/hycp/getCollectionus";
	}
	
	
	
	
	@RequestMapping("/getStyle")
	public String getStyle(HttpServletRequest request, HttpServletResponse response) {
		try {
			
			Map<String, Object> map = new HashMap<String, Object>();
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "collection/hycp/zjcps";
	}
	
	
	
	
	
	@RequestMapping("/getCollections")
	public String getCollectionList(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Type> typelist = new ArrayList<Type>();
			Map<String, Object> map = new HashMap<String, Object>();
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			String type = request.getParameter("type");
			typelist = colService.getTypeList();
			if (type == null || "".equals(type)) {
				map = colService.getCollectionList(Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			} else {
				map = colService.getCollectionList(type, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
				for (Type tp : typelist) {
					if (Long.valueOf(type) == tp.getId()) {
						request.setAttribute("typename", tp.getName());
						break;
					}
				}
			}
			List<Collection> list = (List<Collection>) map.get("list");
			for (Collection col : list) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			request.setAttribute("collectionList", list);
			request.setAttribute("listsize", ((List<Collection>)map.get("list")).size());
			//request.setAttribute("count", map.get("count"));
			request.setAttribute("count",100);//临时使用
			request.setAttribute("type", type);
			request.setAttribute("typelist", typelist);
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "collection/getCollections";
	}
	
	@RequestMapping("/getCollection")
	public String getCollectionById(HttpServletRequest request, HttpServletResponse response) {
		Collection col = new CollectionListRespBean().new Collection();
		List<Collection> list = new ArrayList<Collection>();
		try {
			String id = request.getParameter("id");
			String userid = request.getParameter("userid");
			col = colService.getCollectionById(Long.valueOf(id), userid==null||"".equals(userid)?0:Long.valueOf(userid));
			String images = col.getImgurl();
			String[] imgsarray = images.split(",");
			col.setImgurl(imgsarray[0]);
			list = colService.getCollectionList(id, col.getType());
			for (Collection coll : list) {
				String image = coll.getImgurl();
				String[] imgarray = image.split(",");
				coll.setImgurl(imgarray[0]);
			}
			request.setAttribute("collection", col);
			request.setAttribute("colList", list);
			request.setAttribute("imgsarray", imgsarray);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "collection/getCollection";
	}

}
