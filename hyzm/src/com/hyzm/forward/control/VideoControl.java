package com.hyzm.forward.control;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.video.VideoListRespBean.Video;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.forward.service.news.NewsService;
import com.hyzm.forward.service.video.VideoService;

@Controller
@RequestMapping("/video")
public class VideoControl {
	
	@Autowired
	private VideoService videoService;
	@Autowired
	private ForumsService forumsService;
	@Autowired
	private NewsService newsService;
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/getVideoList")
	public String getVideoList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			String videotype=request.getParameter("videotype"); 
			videotype=videotype==null?"0":videotype;
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			Map<String, Object> map = videoService.getVideoList(videotype,Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("count", map.get("count"));
			request.setAttribute("videoList", map.get("list"));
			request.setAttribute("listsize", ((List<Video>)map.get("list")).size());
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("videotype", videotype);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/getVideoList";
	}
	@RequestMapping("/getNewVideoList")
	public String getNewVideoList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			String videotype=request.getParameter("videotype"); 
			videotype=videotype==null?"0":videotype;
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			Map<String, Object> map = videoService.getVideoList(videotype,Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("count", map.get("count"));
			request.setAttribute("videoList", map.get("list"));
			request.setAttribute("listsize", ((List<Video>)map.get("list")).size());
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("videotype", videotype);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/getNewVideoList";
	}
	
	@RequestMapping("/getVideo")
	public String getVideo(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			String videotype=request.getParameter("videotype");
			videotype=videotype==null?"0":videotype;
			Map<String, Video> map = videoService.getVideoById(id);
			Map<String, Object> videoMap = videoService.getVideoList(videotype,1, 10);
			request.setAttribute("pre", map.get("pre"));
			request.setAttribute("video", map.get("video"));
			request.setAttribute("next", map.get("next"));
			request.setAttribute("videoList", videoMap.get("list"));
			List<Forums> listForum=forumsService.getFlagshopList(id, "5");
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
			request.setAttribute("type", 5);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/getVideo";
	}
	@RequestMapping("/getNewVideo")
	public String getNewVideo(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			String videotype=request.getParameter("videotype");
			videotype=videotype==null?"0":videotype;
			Map<String, Video> map = videoService.getVideoById(id);
			Map<String, Object> videoMap = videoService.getVideoList(videotype,1, 10);
			request.setAttribute("pre", map.get("pre"));
			request.setAttribute("video", map.get("video"));
			request.setAttribute("next", map.get("next"));
			request.setAttribute("videoList", videoMap.get("list"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/getNewVideo";
	}
	
	@RequestMapping("/getWapVideo")
	public String getWapVideo(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			String width = request.getParameter("width");
			String height = request.getParameter("height");
			System.out.println(width);
			System.out.println(height);
			Map<String, Video> map = videoService.getVideoById(id);
			request.setAttribute("video", map.get("video"));
			request.setAttribute("width", width==null?"800":width);
			request.setAttribute("height", height==null?"600":height);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/getWapVideo";
	}
	
	@RequestMapping("/getHyvideoList")
	public String getHyvideoList(HttpServletRequest request, HttpServletResponse response) {
		try {
			String currentPage = request.getParameter("pager.offset");
			String pageSize = request.getParameter("pageSize");
			String videotype=request.getParameter("videotype"); 
			if (currentPage==null || "0".equals(currentPage)) {
				currentPage = "1";
			}
			if (pageSize == null) {
				pageSize = "9";
			}
			Map<String, Object> map = videoService.getVideoList(videotype,Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("count", 0);
			//request.setAttribute("videoList", map.get("list"));
			request.setAttribute("listsize", ((List<Video>)map.get("list")).size());
			request.setAttribute("pageSize", pageSize);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "video/getHyvideoList";
	}
	

}
