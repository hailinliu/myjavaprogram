package com.hyzm.forward.control;

import java.util.Calendar;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.collectionus.CollectionusListRespBean.Collectionus;
import com.hyzm.bean.enroll.CurrentEnrollRespBean.Enroll;
import com.hyzm.bean.flagshop.FlagshopListRespBean.Flagshop;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.proficient.ProficientListRespBean.Proficient;
import com.hyzm.bean.video.VideoListRespBean.Video;
import com.hyzm.bean.vote.ActivityListRespBean.Activity;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.forward.service.flagshop.FlagshopService;
import com.hyzm.forward.service.mine.MineService;
import com.hyzm.forward.service.news.NewsService;
import com.hyzm.forward.service.proficient.ProficientService;
import com.hyzm.forward.service.video.VideoService;
import com.hyzm.forward.service.vote.VoteService;
import com.hyzm.forward.service.yc.YclotsService;
import com.hyzm.util.DateUtil;

@Controller
public class IndexControl {
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private CollectionService collectionService;
	
	@Autowired
	private ProficientService proficientService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private MineService mineService;
	
	@Autowired
	private FlagshopService flagService;
	
	@Autowired
	private VoteService voteService;
	@Autowired
	private YclotsService yclotsService;
	@SuppressWarnings("unchecked")
	@RequestMapping("/redirect")
	public String redirect(HttpServletRequest request, HttpServletResponse response){
		String p = request.getParameter("p");
		Enumeration enu = request.getParameterNames();
		while (enu.hasMoreElements()) {
			String paraName = (String) enu.nextElement();
			if (!paraName.equals("p")) {
				request.setAttribute(paraName, request.getParameter(paraName));
			}
		}
		return p;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/index")
	public String goIndex(HttpServletRequest request, HttpServletResponse response) {
		try {
			//公告
			List<News> bulletinList = newsService.getBulletinList("3");
			//华豫咨询
			List<News> bulletinHY = newsService.getBulletinList("4");
			List<News> collectionInfoList = newsService.getCollectionInfoList();
			List<News> huodongInfoList = newsService.getHuodongInfoList();
			List<News> HuayuInfoList = newsService.getHuayuInfoList();
			List<News> schoolInfoList = newsService.getSchoolInfoList();
			List<Flagshop> flagshopList=flagService.getFalgshopInfoList();
			//Map<String, Object> map = collectionService.getCollectionListIndex(1,4);
			Map<String, Object> map = collectionService.getCollectionusListIndex(1,6,3);
			Map<String, Object> map2 = collectionService.getCollectionusListIndex(1,6,2);
			Map<String, Object> map1 = collectionService.getCollectionusListIndex(1,6,1);
			List<Collectionus> collectionList = (List<Collectionus>) map.get("list");
			for (Collectionus col : collectionList) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			List<Collectionus> collectionListZB = (List<Collectionus>) map2.get("list");
			for (Collectionus col : collectionListZB) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			List<Collectionus> collectionListHY = (List<Collectionus>) map1.get("list");
			for (Collectionus col : collectionListHY) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			
			List<Proficient> proficientList = proficientService.getProficientListIndex();
			//讲坛随机获取
			//List<Video> videoList = videoService.getVideoListIndex();
			List<Video> videoList = videoService.getVideoList();
			Map<String, Object> enrollMap = mineService.getMyApplicationHistory(0, 1, 10);
			Enroll en = mineService.getCurrentEnroll();
			String enrollDate = en.getEnddate();
			if (enrollDate != null) {
				Calendar cal = Calendar.getInstance();
				cal.setTime(DateUtil.getDateTime(enrollDate, "yyyy-MM-dd HH:mm:ss"));
				request.setAttribute("year", cal.get(Calendar.YEAR));
				request.setAttribute("month", cal.get(Calendar.MONTH));
				request.setAttribute("day", cal.get(Calendar.DAY_OF_MONTH));
				request.setAttribute("hour", cal.get(Calendar.HOUR_OF_DAY));
				request.setAttribute("minute", cal.get(Calendar.MINUTE));
				request.setAttribute("second", cal.get(Calendar.SECOND));
			}
			
			//读取我要上华豫前五个
			Map<String, Object> wyshymap = voteService.getActivitiesList(1, 5, voteService.getCurrentActivity("2"), "2", "2");
			List<Activity> wyshylist = (List<Activity>) wyshymap.get("list");
			for (Activity col : wyshylist) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			request.setAttribute("wyshylist", wyshylist);
			//随机读取会员藏品五个
			
			Map<String, Object> hycpmap = voteService.getActivitiesList(1, 3, 0, "", "4");
			List<Activity> hycplist = (List<Activity>) hycpmap.get("list");
			for (Activity col : hycplist) {
				String image = col.getImgurl();
				String[] imgarray = image.split(",");
				col.setImgurl(imgarray[0]);
			}
			request.setAttribute("hycplist", hycplist);
			//随机读取前五个拍品
			Map<String, Object> ppmap=yclotsService.queryYclotsByspecialID("-1", 1, 5);
			request.setAttribute("pplist", ppmap.get("list"));
			
			request.setAttribute("bulletinList", bulletinList);
			request.setAttribute("bulletinHYList", bulletinHY);	
			request.setAttribute("collectionListZB", collectionListZB);
			request.setAttribute("collectionListHY", collectionListHY);
			request.setAttribute("collectionInfoList", collectionInfoList);
			request.setAttribute("huayuInfoList", HuayuInfoList);
			request.setAttribute("huodongInfoList", huodongInfoList);
			request.setAttribute("schoolInfoList", schoolInfoList);
			request.setAttribute("collectionList", collectionList);
			request.setAttribute("proficientList", proficientList);
			request.setAttribute("videoList", videoList);
			request.setAttribute("enrollList", enrollMap.get("list"));
			request.setAttribute("enrollCollectionCount", enrollMap.get("count"));
			request.setAttribute("currentEnroll", en);
			request.setAttribute("pageid", 1);
			request.setAttribute("flagshopList", flagshopList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}
	
}
