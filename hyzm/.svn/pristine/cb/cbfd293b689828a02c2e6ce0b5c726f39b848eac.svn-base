package com.hyzm.forward.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.news.NewsStyleRespBean.Style;
import com.hyzm.bean.proficient.ProficientListRespBean.Proficient;
import com.hyzm.forward.service.baibao.BaiBaoAttentionService;
import com.hyzm.forward.service.baibao.BaiBaoChooseService;
import com.hyzm.forward.service.baibao.BaiBaoCollectionService;
import com.hyzm.forward.service.baibao.BaiBaoGradesService;
import com.hyzm.forward.service.baibao.BaibaoShopService;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.forward.service.news.NewsService;
import com.hyzm.forward.service.proficient.ProficientService;
import com.hyzm.util.PropertiesUtil;

@Controller
@RequestMapping("/baibaoindex")
public class BaibaoNewsIndexControl {	
	@Autowired
	private NewsService newsService;//资讯
	@Autowired
	private ProficientService proService;//专家
	@Autowired
	private CollectionService colService;//藏品
	@Autowired
	private ForumsService forumsService;//评论
	@Autowired
	private BaiBaoCollectionService baibaocollectionService;//百宝藏品
	@Autowired
	private BaibaoShopService baibaoshopService;//店铺

	@RequestMapping("/BaiBao_getIndex")
	public String goIndex(HttpServletRequest request, HttpServletResponse response){
		try {

		    Map<String, String> maxplmap=new HashMap<String, String>();
			maxplmap.put("ordercolumn", "clicknum");
			maxplmap.put("orderdesc", "desc");
			maxplmap.put("pageno",String.valueOf( 1/5+1));
			maxplmap.put("pagesize",String.valueOf(5));
			//热门
			Map<String, Object> resmaxplmap = baibaocollectionService.getCollectionForList(maxplmap);
			List<Map<String, Object>> randcollectionlist=(List<Map<String, Object>>)resmaxplmap.get("list");
			
			//随机推荐
			maxplmap.put("ordercolumn", "rand");
			maxplmap.put("pageno",String.valueOf( 1/5+1));
			maxplmap.put("pagesize",String.valueOf(5));
			Map<String, Object> resmaxplmap2= baibaocollectionService.getCollectionForList(maxplmap);
			List<Map<String, Object>> randcollectionlist2=(List<Map<String, Object>>)resmaxplmap2.get("list");
			
			//官网自营
			maxplmap.put("ordercolumn", "rand");
			maxplmap.put("pageno",String.valueOf( 1/10+1));
			maxplmap.put("pagesize",String.valueOf(10));
			maxplmap.put("userid", PropertiesUtil.getPropertiesValue("guanwangziying").trim());
			Map<String, Object> resmaxplmap3= baibaocollectionService.getCollectionForList(maxplmap);
			List<Map<String, Object>> randcollectionlist3=(List<Map<String, Object>>)resmaxplmap3.get("list");
			
			//入驻商家 随机
			Map<String, String> maxcollmap=new HashMap<String, String>();
			maxcollmap.put("orderdesc", "rand");
			maxcollmap.put("pageno",String.valueOf( 1/10+1));
			maxcollmap.put("pagesize","10");
			Map<String, Object> resmaxcollmap = baibaoshopService.getShopForList(maxcollmap);
			List<Map<String, Object>> maxcolllist=(List<Map<String, Object>>)resmaxcollmap.get("list");
			

			request.setAttribute("randcollectionlist", randcollectionlist);
			request.setAttribute("randcollectionlist2", randcollectionlist2);
			request.setAttribute("randcollectionlist3", randcollectionlist3);
			request.setAttribute("maxcolllist", maxcolllist);
             
//			List<News> baibaonewsList = newsService.getNewsList("1", "1", "217");
//			String currentPage = request.getParameter("pager.offset");
//			String pageSize = request.getParameter("pageSize");
//			if (currentPage==null || "0".equals(currentPage)) {
//				currentPage = "1";
//			}
//			if (pageSize == null) {
//				pageSize = "10";
//			}
//			Map<String, Object> map = newsService.getNewsList("1", "1", "217", Integer.valueOf(currentPage)/Integer.valueOf(pageSize)+1, Integer.valueOf(pageSize));
//			request.setAttribute("baibaonewsList", baibaonewsList);
//			request.setAttribute("count", map.get("count"));
//			request.setAttribute("pageSize", pageSize);
//			request.setAttribute("currentPage", currentPage);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "baibaojie/zixun";
	}
	/**
	 * 获取百宝街新闻列表
	 * @param request
	 * @return
	 */

	@SuppressWarnings("unchecked")
	@RequestMapping("/getOneBaibaoNews")
	public String getOneBaibaoNews(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<News> baibaonews = newsService.getNewsList("1", "1", "217");
			Proficient pro = proService.getProficientListIndex().get(0);
			long id = Long.valueOf(request.getParameter("id"));
			Map<String, News> map = newsService.getOneNews(id);
			News n = map.get("news");
			request.setAttribute("news", n);
			request.setAttribute("pre", map.get("pre"));
			request.setAttribute("next", map.get("next"));			
			List<Forums> listForum=forumsService.getFlagshopList(id, "6");
			List<Forums> listRepaly=new ArrayList<Forums>() ;
			List<Forums> addlist=new ArrayList<Forums>() ;
			  Map<String, String> maxplmap=new HashMap<String, String>();
				maxplmap.put("ordercolumn", "clicknum");
				maxplmap.put("orderdesc", "desc");
				maxplmap.put("pageno",String.valueOf( 1/5+1));
				maxplmap.put("pagesize",String.valueOf(5));
				Map<String, Object> resmaxplmap = baibaocollectionService.getCollectionForList(maxplmap);
		 		List<Map<String, Object>> randcollectionlist3=(List<Map<String, Object>>)resmaxplmap.get("list");
			    int counts=0;
			    for (Forums forums : listForum) {
				counts+=Integer.parseInt(forums.getLikenum());
				if(!forums.getCountnum().equals("0")){
					listRepaly.add(forums);	
				}else{
					addlist.add(forums);
					
			    	}
			}	
			request.setAttribute("randcollectionlist3", randcollectionlist3);
			request.setAttribute("baibaonews", baibaonews);
			request.setAttribute("next", map.get("next"));		
			request.setAttribute("listForum", addlist);
			request.setAttribute("listRepaly", listRepaly);
			request.setAttribute("size", listForum.size());
			request.setAttribute("counts", counts);
			request.setAttribute("type", 6);
				return "baibaojie/zixuninfo";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "baibaojie/zixuninfo";
	}
}
