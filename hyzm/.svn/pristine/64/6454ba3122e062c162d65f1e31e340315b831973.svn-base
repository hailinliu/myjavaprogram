package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.collection.CollectionListRespBean.Collection;
import com.hyzm.bean.enroll.EnrollListRespBean.EnrollRecord;
import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.bean.news.NewsListRespBean.News;
import com.hyzm.bean.proficient.ProficientListRespBean.Proficient;
import com.hyzm.forward.service.collection.CollectionService;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.forward.service.mine.MineService;
import com.hyzm.forward.service.news.NewsService;
import com.hyzm.forward.service.proficient.ProficientService;

@Controller
@RequestMapping("/proficient")
public class ProficientControl {
	
	@Autowired
	private ProficientService proService;
	
	@Autowired
	private NewsService newsService;
	
	@Autowired
	private CollectionService colService;
	
	@Autowired
	private ForumsService forumsService;
	
	@Autowired
	private MineService service;
	@RequestMapping("/getProficients")
	public String getProficientList(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Proficient> list = new ArrayList<Proficient>();
			list = proService.getProficientList(1, 9999);
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			request.setAttribute("proficientList", list);
			request.setAttribute("listsize", list.size());
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "proficient/getProficients";
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/getProficient")
	public String getOneProficient(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<News> newestList = newsService.getNewsList("3");
			List<News> recommendList = newsService.getNewsList("2");
			List<News> hotList = newsService.getNewsList("4");
			List<Collection> colList = (List<Collection>) colService.getCollectionList(1, 1).get("list");
			Collection col = colList.get(0);
			String image = col.getImgurl();
			String[] imgarray = image.split(",");
			col.setImgurl(imgarray[0]);
			long id = Long.valueOf(request.getParameter("id"));
			Proficient pro = proService.getOneProficient(id);
			List<Proficient> proList = proService.getProficientList(1, 10);
			request.setAttribute("newestList", newestList);
			request.setAttribute("recommendList", recommendList);
			request.setAttribute("hotList", hotList);
			request.setAttribute("col", col);
			request.setAttribute("pro", pro);
			request.setAttribute("proList", proList);
			
			
			//评论
			List<Forums> listForum=forumsService.getFlagshopList(Integer.valueOf(request.getParameter("id")), "9");
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
			request.setAttribute("type", 9);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "proficient/getProficient";
	}
	
	/**
	 * 验证表明编码是否存在
	 * @param request
	 * @param response
	 */
	@RequestMapping("/checkBmCode")
	public void checkBmCode(HttpServletRequest request, HttpServletResponse response) {
		CurrentSession currentsession = (CurrentSession) request.getSession().getAttribute("CurrentSession");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");	
		PrintWriter out = null;	
		try {
			out = response.getWriter();
			int bmcode=Integer.valueOf(request.getParameter("bmcode"));
			Map<String, Object> map = service.getMyApplicationHistory(currentsession.getId(),1,10000000);
			List<EnrollRecord> list=(List<EnrollRecord>) map.get("list");
			for(int i=0;i<list.size();i++){
				String code=list.get(i).getCode();
				if(code!=null&&code!=""&&!code.equals("")){
					if(Integer.valueOf(code.substring(code.indexOf("BM")+2))==bmcode){
						out.print("0000");
						return;
					}
				}
			}
			out.print("9999");
		} catch (Exception e) {
			out.print("9999");
		}
		
	}
	//获取本期海选专家
	@RequestMapping("/getBqProficients")
	public void getBqProficients(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;//获得输出对象
		try{
			out = response.getWriter();//获得输出对象
			Map<String,String> where=new HashMap<String, String>();
			//是否为本期海选专家
			where.put("isbqhx", request.getParameter("isbqhx"));
			Map<String,Object> listmap=proService.getProficientListForMap(where);
			List<Map<String, Object>> hxzjlist=(List<Map<String, Object>>)listmap.get("list");
			out.print(JSONArray.fromObject(hxzjlist));
		} catch (Exception e) {
			out.print("9999");
			e.printStackTrace();
		}
	}
	

}
