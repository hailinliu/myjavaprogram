package com.hyzm.forward.control;

import java.io.PrintWriter;
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
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.enroll.EnrollInfoReqBean;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.news.NewsStyleRespBean.Style;
import com.hyzm.bean.proficient.ProficientListRespBean.Proficient;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.forward.service.news.NewsService;
import com.hyzm.forward.service.proficient.ProficientService;

@Controller
@RequestMapping("/news")
public class NewsControl {
	
	@Autowired
	private CollectionService colService;
	
	@Autowired
	private ProficientService proService;
	
	@Autowired
	private NewsService newsService;
	
	@RequestMapping("/gotoCollectionInfoList")
	public String gotoCollectionInfoList(HttpServletRequest request) {
		try {
			request.setAttribute("nesStyleList", newsService.getStyleList("1"));
			System.out.println(request.getParameter("styleid"));
			request.setAttribute("styleid", request.getParameter("styleid"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/collectionInfos";
	}
	
	@RequestMapping("/getCollectionInfo")
	public void getCollectionInfoList(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			String currentPage = request.getParameter("page");
			String pageSize = request.getParameter("size");
			String styleid = "";
			if(request.getParameter("styleid") != null)
				styleid = request.getParameter("styleid");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			Map<String, Object> map = newsService.getNewsList("1", "1", styleid, Integer.valueOf(currentPage), Integer.valueOf(pageSize));
			out.print(new Gson().toJson(map));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/getCollectionInfoByStyle")
	public String getCollectionInfoListByStyle(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Style> styleList = newsService.getStyleList("1");
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			String style = request.getParameter("style");
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			Map<String, Object> map = newsService.getNewsList("1", "1", style, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			for (Style sty : styleList) {
				if (Long.valueOf(style) == sty.getId()) {
					request.setAttribute("stylename", sty.getName());
					break;
				}
			}
			request.setAttribute("styleList", styleList);
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("newsList", map.get("list"));
			request.setAttribute("style", style);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("count", map.get("count"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/getCollectionInfoStyle";
	}
	
	@RequestMapping("/getOneNews")
	public String getOneCollectionInfo(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, News> map = newsService.getOneNews(id);
			News n = map.get("news");
			request.setAttribute("news", n);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/oneNews";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/getSchools")
	public String getSchools(HttpServletRequest request) {
		try {
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			List<News> list1 = newsService.getNewsList("1", "2", "201");
			List<News> list2 = newsService.getNewsList("1", "2", "202");
			List<News> list3 = newsService.getNewsList("1", "2", "203");
			List<News> list4 = newsService.getNewsList("1", "2", "204");
			List<News> list5 = newsService.getNewsList("1", "2", "205");
			List<News> list6 = newsService.getNewsList("1", "2", "206");
			List<News> list7 = newsService.getNewsList("1", "2", "207");
			List<News> list8 = newsService.getNewsList("1", "2", "208");
			List<News> list9 = newsService.getNewsList("1", "2", "209");
			List<News> list10 = newsService.getNewsList("1", "2", "210");
			List<Style> styleList = newsService.getStyleList("2");
			List<Collection> colList = (List<Collection>) colService.getCollectionList(1, 1).get("list");
			Collection col = colList.get(0);
			String image = col.getImgurl();
			String[] imgarray = image.split(",");
			col.setImgurl(imgarray[0]);
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("list3", list3);
			request.setAttribute("list4", list4);
			request.setAttribute("list5", list5);
			request.setAttribute("list6", list6);
			request.setAttribute("list7", list7);
			request.setAttribute("list8", list8);
			request.setAttribute("list9", list9);
			request.setAttribute("list10", list10);
			request.setAttribute("styleList", styleList);
			request.setAttribute("col", col);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/getSchools";
	}
	
	@RequestMapping("/getSchoolInfo")
	public String getSchoolInfo(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Style> styleList = newsService.getStyleList("2");
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			String style = request.getParameter("style");
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			Map<String, Object> map = newsService.getNewsList("1", "2", style, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			for (Style sty : styleList) {
				if (Long.valueOf(style) == sty.getId()) {
					request.setAttribute("stylename", sty.getName());
					break;
				}
			}
			request.setAttribute("styleList", styleList);
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("newsList", map.get("list"));
			request.setAttribute("style", style);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("count", map.get("count"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/getSchoolInfo";
	}
	/**
	 * 新增报名信息
	 * @param request
	 * @param response
	 */
	@RequestMapping("/enrollInfo")
	public void EnrollInfo(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;
		MessageRespBean respBean=null;
		try {
			out = response.getWriter();
			CurrentSession currentSession = (CurrentSession)request.getSession().getAttribute("CurrentSession");
			EnrollInfoReqBean info = new EnrollInfoReqBean();
			info.setName(request.getParameter("name"));
			info.setTel(request.getParameter("tel"));
			info.setStyle(request.getParameter("style"));
			info.setSex(request.getParameter("sex"));
			
			info.setAddress(request.getParameter("address"));
			info.setBmStyle(request.getParameter("bmstyle"));
			info.setIdcard(request.getParameter("idcard"));
            info.setIpcard(request.getParameter("ipcard"));
            info.setEmail(request.getParameter("email"));
            info.setVisa(request.getParameter("visa"));
			info.setUseTime(request.getParameter("useTime"));
			info.setLader(request.getParameter("lader"));
            info.setJoin(request.getParameter("joins"));
            info.setDesc(request.getParameter("desc"));
            
            info.setUserid(currentSession.getId());
            info.setUsername(currentSession.getUsername());
            info.setMobile(currentSession.getMobile());    
			respBean=newsService.EnrollInfo(info);	
			out.print(new Gson().toJson(respBean.getErrorcode()));
		} catch (Exception e) {
			
			out.print("程序异常！");
			e.printStackTrace();
			out.print(new Gson().toJson(respBean.getErrorcode()));
		}
		
	}
	
	/**
	 * 华豫快讯信息列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getNewflash")
	public String getNewflash(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		try {
			List<Style> styleList = newsService.getStyleList("1");
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			String style =request.getParameter("style");
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			Map<String, Object> map = newsService.getNewsList("1", "4", style, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			/*for (Style sty : styleList) {
				if (Long.valueOf(style) == sty.getId()) {
					request.setAttribute("stylename", sty.getName());
					break;
				}
			}*/
			request.setAttribute("styleList", styleList);
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("newsList", map.get("list"));
			request.setAttribute("style", style);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("count", map.get("count"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/getNewflash";
	}
	/**
	 * 华豫快讯详情列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getOneFlash")
	public String getOneFlash(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		try {
			List<Style> styleList = newsService.getStyleList("1");
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			List<Collection> colList = (List<Collection>) colService.getCollectionList(1, 1).get("list");
			Collection col = colList.get(0);
			String image = col.getImgurl();
			String[] imgarray = image.split(",");
			col.setImgurl(imgarray[0]);
			Proficient pro = proService.getProficientList(1, 1).get(0);
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, News> map = newsService.getOneNews(id);
			News n = map.get("news");
			List<News> list1 = null;
			List<News> list2 = null;
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("col", col);
			request.setAttribute("pro", pro);
			request.setAttribute("news", n);
			request.setAttribute("pre", map.get("pre"));
			request.setAttribute("next", map.get("next"));
			if ("4".equals(n.getType())) {
				list1 = (List<News>) newsService.getNewsList("1", n.getType(), "", n.getId()+"", 1, 6).get("list");
				list2 = (List<News>) newsService.getNewsList("1", n.getType(), "", n.getId()+"", 7, 12).get("list");
				request.setAttribute("list1", list1);
				request.setAttribute("list2", list2); 
				return "news/getOneFlash";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/getOneFlash";
	}
	
	/**
	 * 公告详情列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getAnnounce")
	public String getAnnounce(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Style> styleList = newsService.getStyleList("1");
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			String style =request.getParameter("style");
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "10";
			}
			Map<String, Object> map = newsService.getNewsList("1", "3", style, Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			request.setAttribute("styleList", styleList);
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("newsList", map.get("list"));
			request.setAttribute("style", style);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("count", map.get("count"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "news/getAnnounce";
	}
	
	@RequestMapping("/getOneCollectionInfo")
	public String getOneCollectionInfo(HttpServletRequest request) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, News> map = newsService.getOneNews(id);
			request.setAttribute("n", map.get("news"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "activity/activitiyinfo";
	}
	
}
