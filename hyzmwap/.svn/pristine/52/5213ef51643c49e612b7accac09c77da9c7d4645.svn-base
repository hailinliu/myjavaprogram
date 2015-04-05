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
import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.forward.service.news.NewsService;

@Controller
@RequestMapping("/collection")
public class CollectionControl {
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private CollectionService colService;
	
	@Autowired
	private ForumsService forumsService;
	
	@RequestMapping("/gotoHycp")
	public String gotoHycp(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			long typeid = Long.valueOf(request.getParameter("typeid"));
			map = colService.getCollectionusStyle(typeid);
			request.setAttribute("liststyle", map.get("list"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "hycp/hycps";
	}
	
	@RequestMapping("/gotoZtcp")
	public String gotoZtcp(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			long typeid = Long.valueOf(request.getParameter("typeid"));
			map = colService.getCollectionusStyle(typeid);
			request.setAttribute("liststyle", map.get("list"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "hycp/ztcps";
	}
	
	@RequestMapping("/gotoZjcp")
	public String gotoZjcp(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			long typeid = Long.valueOf(request.getParameter("typeid"));
			map = colService.getCollectionusStyle(typeid);
			request.setAttribute("liststyle", map.get("list"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "hycp/zjcps";
	}

	@RequestMapping("/getHycp")
	public void getHycp(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, Object> map = new HashMap<String, Object>();
		    String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			long typeid=Long.parseLong(request.getParameter("typeid"));
			long styleid = 0;
			if(request.getParameter("styleid") != null)
				styleid = Long.parseLong(request.getParameter("styleid"));
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			int pricearea =-1;
			if(request.getParameter("pricearea") != null){
				pricearea = Integer.valueOf(request.getParameter("pricearea"));
			}
			map = colService.getCollectionusList(Integer.valueOf(currentPage), Integer.parseInt(pageSize),styleid,typeid,pricearea);
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getZtcp")
	public void getZbcp(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, Object> map = new HashMap<String, Object>();
		    String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			long typeid=Long.parseLong(request.getParameter("typeid"));
			long styleid = 0;
			if(request.getParameter("styleid") != null)
				styleid = Long.parseLong(request.getParameter("styleid"));
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			int pricearea =-1;
			if(request.getParameter("pricearea") != null){
				pricearea = Integer.valueOf(request.getParameter("pricearea"));
			}
			map = colService.getCollectionusList(Integer.valueOf(currentPage), Integer.parseInt(pageSize),styleid,typeid,pricearea);
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getZjcp")
	public void getZjcp(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			Map<String, Object> map = new HashMap<String, Object>();
		    String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			long typeid=Long.parseLong(request.getParameter("typeid"));
			long styleid = 0;
			if(request.getParameter("styleid") != null)
				styleid = Long.parseLong(request.getParameter("styleid"));
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			int pricearea =-1;
			if(request.getParameter("pricearea") != null){
				pricearea = Integer.valueOf(request.getParameter("pricearea"));
			}
			map = colService.getCollectionusList(Integer.valueOf(currentPage), Integer.parseInt(pageSize),styleid,typeid,pricearea);
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			if (currentSession != null) {
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
			} else {
				out.print("观摩预约，请先登录。若无账户，请先注册。");
			}
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
			
			//评论
			List<Forums> listForum=forumsService.getFlagshopList(id, "1");
			List<Forums> listRepaly=new ArrayList<Forums>() ;
			List<Forums> addlist=new ArrayList<Forums>() ;
			int likenum=0;
			for (Forums forums : listForum) {
				likenum+=Integer.parseInt(forums.getLikenum());
				if(!forums.getCountnum().equals("0")){
					listRepaly.add(forums);	
				}else{
					addlist.add(forums);
				}
			}
			request.setAttribute("forumList", addlist);
			request.setAttribute("repalyList", listRepaly);
			request.setAttribute("forumSize", listForum.size());
			request.setAttribute("likenum", likenum+listForum.size());
			request.setAttribute("type", 1);
			
			request.setAttribute("collection", col);
			request.setAttribute("colList", list);
			request.setAttribute("imgsarray", imgsarray);
			request.setAttribute("collection", (CollectionusListRespBean.Collectionus)map.get("collection"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "hycp/oneCollection";
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
			String[] imgsarray = {};
			if (images != null) {
				imgsarray = images.split(",");
				col.setImgurl(imgsarray[0]);
			}
			list = colService.getCollectionList(id, col.getType());
			for (Collection coll : list) {
				String image = coll.getImgurl();
				if (image != null) {
					String[] imgarray = image.split(",");
					coll.setImgurl(imgarray[0]);
				}
			}
			request.setAttribute("collection", col);
			request.setAttribute("colList", list);
			request.setAttribute("imgsarray", imgsarray);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "collection/oneCollection";
	}

}
