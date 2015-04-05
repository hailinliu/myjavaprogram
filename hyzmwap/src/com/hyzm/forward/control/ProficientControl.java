package com.hyzm.forward.control;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hyzm.bean.CurrentSession;
import com.hyzm.bean.enroll.EnrollListRespBean.EnrollRecord;
import com.hyzm.bean.forums.ForumsListRespBean.Forums;
import com.hyzm.bean.proficient.ProficientListRespBean.Proficient;
import com.hyzm.forward.service.forums.ForumsService;
import com.hyzm.forward.service.mine.MineService;
import com.hyzm.forward.service.proficient.ProficientService;

@Controller
@RequestMapping("/proficient")
public class ProficientControl {
	
	@Autowired
	private ProficientService proService;
	
	@Autowired
	private ForumsService forumsService;
	
	@Autowired
	private MineService service;
	@RequestMapping("/getProficients")
	public String getProficientList(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Proficient> list = new ArrayList<Proficient>();
			list = proService.getProficientList(1, 9999);
			request.setAttribute("proficientList", list);
			request.setAttribute("listsize", list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "proficient/proficients";
	}
	
	@RequestMapping("/getDijjf")
	public String getDijjf(HttpServletRequest request, HttpServletResponse response) {
		try {
			List<Proficient> list = new ArrayList<Proficient>();
			list = proService.getProficientList(1, 9999);
			request.setAttribute("proficientList", list);
			request.setAttribute("listsize", list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "djff";
	}
	@RequestMapping("/getProficient")
	public String getOneProficient(HttpServletRequest request, HttpServletResponse response) {
		try {
			long id = Long.valueOf(request.getParameter("id"));
			Proficient pro = proService.getOneProficient(id);
			request.setAttribute("pro", pro);
			
			
			
//			评论
			List<Forums> listForum=forumsService.getFlagshopList(Integer.valueOf(request.getParameter("id")), "9");
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
			request.setAttribute("type", 9);
		 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "proficient/proficient";
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
//	获取本期海选专家
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
